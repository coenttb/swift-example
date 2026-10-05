public import Tagged

extension Example.Greeting {

    public static func greet(_ name: Name) -> Message {
        .init("Hello, \(name.underlying)!")
    }
}
