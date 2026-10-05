public import Client_Macro
public import Interface_Macro

extension Example {
    @Interface
    public struct Greeting: Greeting.`Protocol` {
        @Client
        public protocol `Protocol` {
            func greet(_ name: Name) async -> Message
        }
    }
}
