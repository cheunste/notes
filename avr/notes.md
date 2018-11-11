# Scratch Notes


Because you sometimes use Chinese arduinos (because they're cheapish) they might not work with your  terminal.

check /dev/ and see if you see any changes and then just create a soft link and map it to tty.wch

https://www.stm32duino.com/viewtopic.php?t=363

# Hardware Registers

Almost all of hte pins on a AVR chip are configurable either as input or output pins. That means they can be internally hooked up as either voltage sensing components or as transistor switches that will connect the pin through VCC or GND voltage levels.

- Each slot in the AVR's memory is a byte

## DDRx data-direction registers (port x)

These registers control whether each pin is configured for input or outputthe data direction. After a reset or power-up, the default state is all zeros, corresponding to the pins being configured for input. To enable a pin as output, you write a one to its slot in the DDR.

## PORTx port x data registers

When the DDRx bits are set to one (output) for a given pin, the PORT register controls whether that pin is set to logic high or low (i.e., the VCC voltage or ground). Switching between these voltage levels could, for instance, turn on and off attached LEDs.

With the DDR configured for input, setting the PORT bits on a pin will control whether it has an internal pull-up resistor attached or whether it’s in a “hi-Z” (high-impedance) state, effectively electrically disconnected from the circuit, but still able to sense voltage. We’ll talk more about this in Chapter 6.

## PINx port x input pins address

The PIN register addresses are where you read the digital voltage values for each pin that’s configured as input. Each PINx memory location is hooked up to a comparator circuit that detects whether the external voltage on that pin is high or low. You can’t write to them, so they’re not really memory, but you can read from the PINx registers like a normal variable in your code to see which pins have high and low voltages on them.

- All of these HW registers are readable, so you can always query the input/output direction or state of any pin at any time.

 - The PINx aren't writable because they just reflect the voltage values on the corresponding pin

 # Configuring output DDRs, PORTs

- To output a voltage on a given pin, you'll need to

1. Configure the relevant pin for output mode by writing to the data-direction register (DDR).

2. Assign a high or low value to the individual pin by writing to the PORT hardware register.
