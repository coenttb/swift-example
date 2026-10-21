public import Tagged

extension Example.Greeting {

    public enum Nominal {}

    public typealias Name = Tagged<Nominal, Swift::String>
}
