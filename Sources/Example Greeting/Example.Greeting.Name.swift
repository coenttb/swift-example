public import Example

extension Example.Greeting {

    public struct Name: Equatable, Sendable {

        public let underlying: Swift.String

        public init(_ underlying: Swift.String) {
            self.underlying = underlying
        }
    }
}
