public import Client_Macro
public import Interface_Macro

extension Example {
    @Interface
    public struct Counter: Counter.`Protocol` {
        @Client
        public protocol `Protocol` {
            func increment(limit: Limit) async throws(Error) -> Value
        }
    }
}
