public import Tagged

extension Example.Counter {

    public enum Magnitude {}

    public typealias Limit = Tagged<Magnitude, Swift.Int>
}
