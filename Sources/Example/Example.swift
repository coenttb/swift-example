public import Client_Macro
public import Interface_Macro

@Interface
public struct Example: Example.`Protocol` {
    @Client
    public protocol `Protocol` {
        associatedtype Greeting: Example.Greeting.`Protocol`
        associatedtype Counter: Example.Counter.`Protocol`

        var greeting: Greeting { get }
        var counter: Counter { get }
    }
}
