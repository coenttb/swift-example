public import Client_Macro
public import Interface_Macro
import Tagged

extension Example {
    @Interface
    public struct Greeting: Greeting.`Protocol` {
        @Client
        public protocol `Protocol` {
            func greet(_ name: Name) async -> Message
        }
    }
}

extension Example.Greeting {

    public static func greet(_ name: Name) -> Message {
        .init("Hello, \(name.underlying)!")
    }
}
