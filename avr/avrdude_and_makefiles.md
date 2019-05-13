# Using AVRDUDE

For mac, this is part of the crossAVR pack

avrddude -p m168p -c usbtiny

Editing the make file makes this a lost easier, if you have it in the make makefile
you can then enter make flash and it should compile

If your Makefile is complete with all the necessary settings (usually just the ISP and the uC type) you can use

make flash 

in the terminal to compile and flash it.

# Configuring the makefile

MCU

This is the type of AVR chip you’re using. In our case, we’re using an ATmega168, so it reads atmega168. For a complete list of supported chips, type avr-gcc -target-help and about halfway down you’ll find a list of “Known MCU names.”

F_CPU

This definition tells the compiler what clock speed your chip is running at. If you don’t have an external clock source, like a crystal, this is either 1000000 or 8000000 for the ATmega chips—one megahertz or eight megahertz. Getting this right will matter for the timing of serial communication, and anything else where timing is key.

BAUD

This is the baud rate that you’re going to use for computer-to-AVR serial communications, and 9,600 baud is a good conservative default.

LIBDIR

The code for this book reuses a common base for many projects. Instead of copying these files into each project’s folder, the common files are stored in a directory that I’ve called AVR-Programming-Library. By default, it’s located two directories above each project. If you move things around, you’ll need to change this variable to point at the new location of the AVR-ProgrammingLibrary. Later on, if your code doesn’t rely on this library, you can leave the variable blank or change it to fit.

PROGRAMMER_TYPE

The two “programmer” options are for AVRDUDE, along with information about what chip we’re programming from MCU. Here, you enter the type of flash programmer that you’re using, and the makefile passes it to AVRDUDE using the -c option. If you’re using a USBTiny or USBasp, for instance, you enter that here. If you’re using the Arduino as a flash programmer, enter avrisp.

PROGRAMMER_ARGS

The other “programmer” option is for any of the other necessary AVRDUDE options. If you’re using a USBTiny or USBasp, you won’t have to enter anything here; just leave the line blank. If you are using a serial-based programmer, you’ll need to specify the serial port and baud rate using the -P and -b options, respectively.

# Avrdude Options
-c <programmer>

Here you specify the type of flash programmer that you’re using. Many serial programmers, including the ArduinoISP, use the generic av risp type (not the arduino type, which programs the Arduino itself). There are also configurations for both usbasp and usbtiny programmers. If you’d like to see the full list, type avrdude -c ?.

-p <partno>

Here you specify the type of AVR chip that you’re programming for. In our case “m168” is an ATmega168 chip or “m168p” if you’ve got that version.

-P <port>

If you’re not using a native USB programmer (for instance, if you’re using an ArduinoISP), you’ll need to know which serial port the programmer is connected to. See “Common AVRDUDE Configurations” on page 39 for details. On Windows, it’s usually something like COM3; on Linux and Mac OS, it’s in the /dev/tty* lineup.

-b <baud>

This sets the baud rate if you’re using a serial programmer. You’ll have to know what speed your programmer wants, or use trial and error.

-n

Write-nothing mode. This one lets you test out commands without worrying that you’ll accidently mess up the chip.

-t

Terminal mode. This mode lets you talk to the AVR chip directly. After the programmer has connected, type sig to read the AVR’s device signature, which makes a quick test of basic communication between the programmer and chip. Type help to see all the options.

-C <config-file>

This lets you use a nonstandard configuration file. If the version of AVRDUDE that you’ve got doesn’t support a particular chip or programmer, you can often fix it by getting a more recent configuration file. I’ve included mine in the book’s software bundle.

-U

This the command that reads or writes to memory. You’ll almost always be calling this from a makefile, but if you’d like to dump the memory of an AVR chip to a file, or flash in a .hex file that someone has already compiled for you, this is how you’d do it.
