import Either
import Example
import Tagged
import Testing

private enum Transport: Swift::Error, Equatable {
    case unreachable
}

extension Example {
    @Suite
    struct Test {

        @Test
        func `an implementation of the interface is the local client`() async throws {
            var current: Example.Counter.Value = 0
            let example = Example(
                greeting: Example.Greeting(greet: { request in Example.Greeting.greet(request.name) }),
                counter: Example.Counter(
                    increment: { request throws(Example.Counter.Error) in
                        current = try Example.Counter.increment(current, limit: request.limit)
                        return current
                    }
                )
            )

            #expect(await example.greeting.greet("Ada") == "Hello, Ada!")
            #expect(try await example.counter.increment(limit: 9) == 1)
            #expect(try await example.counter.increment(limit: 9) == 2)
        }

        @Test
        func `a client over a transport keeps its failure apart from the refusal`() async throws {
            let client = Example.Client<Transport>(
                greeting: .init(greet: { request throws(Either<Transport, Never>) in
                    Example.Greeting.greet(request.name)
                }),
                counter: .init(increment: { _ throws(Either<Transport, Example.Counter.Error>) in
                    throw .left(.unreachable)
                })
            )

            #expect(try await client.greeting.greet(.init("Ada")) == "Hello, Ada!")
            await #expect(throws: Either<Transport, Example.Counter.Error>.left(.unreachable)) {
                try await client.counter.increment(.init(limit: 1))
            }
        }

        @Test
        func `a client keeps the domain refusal on the right`() async {
            let client = Example.Counter.Client<Transport>(
                increment: { request throws(Either<Transport, Example.Counter.Error>) in
                    do throws(Example.Counter.Error) {
                        return try Example.Counter.increment(5, limit: request.limit)
                    } catch {
                        throw .right(error)
                    }
                }
            )

            await #expect(throws: Either<Transport, Example.Counter.Error>.right(.limit(reached: 5))) {
                try await client.increment(.init(limit: 5))
            }
        }
    }
}
