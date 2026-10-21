public import Client_Macro
public import Interface_Macro
import Tagged

extension Example {
    @Interface
    public struct Counter: Counter.`Protocol` {
        @Client
        public protocol `Protocol` {
            func increment(limit: Limit) async throws(Example.Counter.Error) -> Value
        }
    }
}

extension Example.Counter {

    public static func increment(
        _ value: Value,
        limit: Limit
    ) throws(Example.Counter.Error) -> Value {
        guard value.underlying < limit.underlying else {
            throw .limit(reached: limit)
        }
        return .init(value.underlying + 1)
    }
}
