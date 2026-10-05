import Example
import Tagged
import Testing

@Suite
struct `Example.Greeting Tests` {

    @Test
    func `greet composes the message from the name`() {
        #expect(Example.Greeting.greet("Ada") == "Hello, Ada!")
    }
}
