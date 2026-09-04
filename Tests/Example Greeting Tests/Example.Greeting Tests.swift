import Example
import Example_Greeting
import Tagged
import Tagged_Standard_Library_Integration
import Testing

@Suite
struct `Example.Greeting Tests` {

    @Test
    func `greet composes the message from the name`() {
        #expect(Example.Greeting.greet("Ada") == "Hello, Ada!")
    }
}
