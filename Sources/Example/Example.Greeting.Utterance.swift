public import Tagged

extension Example.Greeting {

    public enum Utterance {}

    public typealias Message = Tagged<Utterance, Swift::String>
}
