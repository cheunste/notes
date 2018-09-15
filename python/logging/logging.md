# Logging

## The Basics

Besdies using print, Python also comes with a logging library that can help you debug your code.

To acutally use logging, you need to import it

```ppython
import logging
```

The eastist way to use logging is the module's basicConfig function and pass it some keywords, if you don't use basicConfig, it will log to stdout in the terminal

It accepts the following:

* filename
* filemode
* format
* datefmt
* level
* stream

Similar to Android, there are 5 levels of logging ( in ascending order):

* DEBUG
* INFO
* WARNING
* ERROR
* CRITICAL

Also, if you run this code multiple times, it will append to the log that already exists. If you want your logger to get overwritten, then pass in
filemode="w"

ex:

```python
import loggign
# add filemode="w" to overwrite
loggging.basicConfig(filename="sample.log",level=logging.INFO)

logging.debug("This is a debug message")
logging.info("inforemational message")
logging.error("An error has happened!")
```

## Multi-Moduel loggign

The downside to what you know right now is that it will be a pain when you do multi modeul logging because the logs created does not mention the modujle where it comes from.

This is where complex logging comes in. 

```python
import logging 
import otherMod2

def main():
    """
    The main entry point of the application
    """

    logger = logging.getLogger("exampleApp")
    logger.setLevel(logging.INFO)

    #create the logging file handler
    fh = logging.FileHandler("new_snake.log")
    formatter = logging.Formatter(&apos;%(asctime)s -%(name)s -%(levelname)s  -%(message)s&apos;)
    fh.setFormatter(formatter)

    #add handler to logger object
    logger.addHandler(fh)

    logger.info("Program started")
    result = otherMod2.add(7,8)
    logger.info("Done!")

if __name__ == "__main__":
    main()
```

You will notice that all references to root have been removed. Instead, it uses our Formatter object which says that we should get a human readable time, the logger name, the logging level and then the message.

These are actually known as LogRecord attributes. For a full list of attributes, google it.

## Configuration Logs

The logging module can be configured 3 different ways
