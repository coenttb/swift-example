public import Example

extension Example.Greeting {

    public struct Message: Equatable, Sendable {

        public let underlying: Swift.String

        public init(_ underlying: Swift.String) {
            self.underlying = underlying
        }
    }
}
