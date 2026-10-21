import Example
import Tagged
import Testing

extension Example.Counter {
    @Suite
    struct Test {

        @Test
        func `increment below the limit succeeds`() throws {
            #expect(try Example.Counter.increment(3, limit: 5) == 4)
        }

        @Test
        func `increment at the limit refuses`() {
            do throws(Example.Counter.Error) {
                _ = try Example.Counter.increment(5, limit: 5)
                Issue.record("expected a refusal")
            } catch {
                #expect(error == .limit(reached: 5))
            }
        }
    }
}
