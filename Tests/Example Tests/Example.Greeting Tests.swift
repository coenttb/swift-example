import Example
import Tagged
import Testing

extension Example.Greeting {
    @Suite
    struct Test {

        @Test
        func `greet composes the message from the name`() {
            #expect(Example.Greeting.greet("Ada") == "Hello, Ada!")
        }
    }
}
