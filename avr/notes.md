# Scratch Notes


Because you sometimes use Chinese arduinos (because they're cheapish) they might not work with your  terminal.

check /dev/ and see if you see any changes and then just create a soft link and map it to tty.wch

https://www.stm32duino.com/viewtopic.php?t=363

# Hardware Registers

Almost all of hte pins on a AVR chip are configurable either as input or output pins. That means they can be internally hooked up as either voltage sensing components or as transistor switches that will connect the pin through VCC or GND voltage levels.

- Each slot in the AVR's memory is a byte

## DDRx data-direction registers (port x)

These registers control whether each pin is configured for input or outputthe data direction. After a reset or power-up, the default state is all zeros, corresponding to the pins being configured for input.

If you haven't configured DDR yet, it is in input mode by default. However, pull-up resistor is not enabled by default. To do this, you need to set the bit on PORTx (ie PORTD |= (1<<PD2);)

- To enable a pin as output, you write a one to its slot in the DDR.
- To enable a pin as input, you write a zero to its slot in the DDR.

## PORTx port x data registers

When the DDRx bits are set to one (output) for a given pin, the PORT register controls whether that pin is set to logic high or low (i.e., the VCC voltage or ground). Switching between these voltage levels could, for instance, turn on and off attached LEDs.

You also use PORTx to set internal pull-up resistors on AVR

With the DDR configured for input, setting the PORT bits on a pin will control whether it has an internal pull-up resistor attached or whether it’s in a “hi-Z” (high-impedance) state, effectively electrically disconnected from the circuit, but still able to sense voltage. We’ll talk more about this in Chapter 6.

## PINx port x input pins address

The PIN register addresses are where you read the digital voltage values for each pin that’s configured as input. Each PINx memory location is hooked up to a comparator circuit that detects whether the external voltage on that pin is high or low. You can’t write to them, so they’re not really memory, but you can read from the PINx registers like a normal variable in your code to see which pins have high and low voltages on them.

- All of these HW registers are readable, so you can always query the input/output direction or state of any pin at any time.

 - The PINx aren't writable because they just reflect the voltage values on the corresponding pin

 # Configuring output DDRs, PORTs

- To output a voltage on a given pin, you'll need to

1. Configure the relevant pin for output mode by writing to the data-direction register (DDR).

2. Assign a high or low value to the individual pin by writing to the PORT hardware register.

## UART/USART

**USART**: Universal Synchronous and Asynchronous Receiver and Transmitter

Note that AVR's serial HW is capable of running both Synchronous (using a clock) and Async mode (no clock)

**baud rate**: This pretty much means how often voltage is allowed to change on the line and how often
the receiver needs to read in a new voltage

### Using USART

1) Choose a baud rate (by defining BAUD) and write the appropriate values to the baud rage registers UBRRL and UBRRH
2) Enable the serial receive and transmit register bits
3) If transmitting, wait until the HW is ready and then load your byte data into UDR0. The AVR's HW handles everything else automatically
4) If you're waiting for data, check the data-received bit and then read the data out of UDR0. Reading UDR0 autoamtically clears the data-recieved bit, and the AVR gets ready for the next received byte

### Setting up Serial communication

Involves three different stages

1) Configuring the AVR
2) Installing serial terminal software on your computer
3) Connecting them together

### datasheet

Like everything else in life, someone have to have code the library you're using.
If you need to make changes to the UART, or you're forced to make your own UART module, you need to refer to the uC's
UART section. never forget, the datasheet is your friend

### Other uses for USART

- USART can have many different uses besides communicating with your computer such as

* debugging
* Using LCD and VFD displays
* Dataloggign
* Integrating card-readers or RFID
* Sending data via radio protcol

- The USART library provided is developed from the datasheet. So if you use a different uC, then you'll most likely have to review the datasheet


## C Files and Header Files

You use header files for defining constants and function prototypes (essentually functions wihtout the code )

If you ever need to create your own module, do the following

1) Copy the module.h and module.c file into your project directory
2) #include module.h at the top of your code
3) Add the .c file to your make file as extra source to be compile

## Digital logic

- This is used for shit like pressing a button and sending the signal to high or low
- You have to set up the AVR's DDR and PORT to be on input mode and set for internal pull up
- To read the value of a single bit in the register, you use bitwise AND

ex: reading PD2
//Note that ( 1 << 2) creates 00000100
//So the below will get you the status of PD2
if (PIND & (1 << 2)){
  doStuff();
}

### Changing States

- Depending on application, you might have an event that triggers whenever a button is pushed.
- However, you don't want the event to trigger on and off when the button is held.
- In this case, you need to have an additional statement to determine whether the button is held or not and then depending on that condition, trigger the event or not

### Debouncing

- Sometimes, buttons get stuck and the contact is still intact for a few ms and as a result, your event is getting triggered even though you're not pressing a button
- To solve this, you can just wait a few ms, or add a cap between the two contacts of a switch to force the voltage to rise slowly. But...it is cheaper to do it in code

### Push Button Checklist

- Do the following if you have plans on using a push button in your circuit

1) Set DDR for input. ie (DDRD &=- ~(1 << PD2))
2) Set the internal pull-up if you don't have a physical pull up (ie PORTD |=(1 << PD2))
3) Read the button voltage in your code either by...
  - if statement (ie if(!(PIND & (1 <<PD2))) )
  - using a macro (ie bit_is_clear(PIND, PD2))
4) Think about whether you want something to happen while the button is pressed or when it becomes pressed. Store the previous state and test for changes if needed
5) If you're trying to detect a single button-press event, consider debouncing and wait a few ms and test if the btn is still pressed

## Timer/Counter Intro

Timer and counters are useful if you need to do multiple things at the same time without using delay functions that waste CPU cycle

What we need is a clock that we can use as a timebase and a counter that'll count up a certain number of clock ticks for us

How it works is kinda long.

Input arrives from either the system clock (or external source) connected to an input pin. This way, the same HW can be used as a timer or a generic counter.

The current count is stored in an internal timer/counter register (TCNTn)

Your code read the coutn from the TCNT register, which yields the current count values.

But if you need to know when a certain count value is reached, you can compare the count value in the Output Compare Register (OCRn) and with this, you can store the value you'ld like for an elapsed time, a freq or a duty cycle in the OCRn and the timer reigster will take care of the rest

As the counter is counting, and the compare unit is comparing the coutn value to your set value, if/when the compare value is reached, a compare event triggers the waveform generator, which does different things depending on the waveform mode and output mode

Waveform Gneerator can be configured to generate three main types of output: counter, timer or PWM

Whether you want pins set, cleared or toggled is determined by the output modes

### Waveform Generation Modes

When you're configuring the timer/counter HW, the first thing you need to do is what mode of oepration you want the timer/counter operating in

**Normal Mode**: In this mode, counter counts up until overflow @ 255 (2^8) or 65535 (2^32). You use this mode most when you're counting clicks, timing an event or clearing and reading TCNT from your code

**CTC Mode**: Clear Timer or Compare Match mode. In this mode, counter resets itself automatically when reaches the value stored in the OCRnA register instead of waiting until it hits 255 or 65535. This is used when we want to set the timer/counter to repeat a given frequency

### Clock scaling

If you don't set a clock prescaler, but enabled the timer, the default is for the timer to use no prescaling. Without prescaling, the timer will be using its default clock.

So if you have a ATmega 328 with a 16MHz clock, it goes through one clock cycle every 1/(16*10^6) seconds (or 0.0625us) and with a 16 bit timer (65535), the internal service routine (ISR) will trigger in 0.0041s (65535 * 0.0625u)

**By using a prescaler, allows you to divide your clock signal by various powers of two, thus increasing your timer period**

An usage for this would be audio frequencies in the range of 100-800 Hz and the CPU clock starts out at 1MHz, you clearly need to divide it down before use

In the datasheets, there are recommended prescales for desired frequencies

### Summary

When configuring timer/counter, the important points to remember are:

- SEt the waveform mode to either Normal mode or CTC mode by setting the appropriate waveform mode bitwise
- Select the clock prescaler speed. You **must** set these bits because the default value leaves the timer/counter prescaler unconnected (not running)
- OPtionaly, select an output mode if you like to set, clear or toggle output pins from your timer/counters
- Instead of togglign pins directly, you can enable an interrupt to trigger on comapre match


In case you need to use a timer, do the following

1) Find the Timer Registers in the datasheet (TCCR1A/B)
2) Find your desired clock cylce
3) Set CS10 to CS12 registers depending on the time you want. Look in the datasheet
