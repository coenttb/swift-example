public import Tagged

extension Example.Counter {

    public enum Quantity {}

    public typealias Value = Tagged<Quantity, Swift.Int>
}
