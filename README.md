## Invoking Scripts From Services

This is a simple service that invokes a shell script.  It's OSX specific
but the idea should be the same on win32 as well.

## Example output

    [lth@lappro service_invoking_script] $ ../bpsdk/bin/ServiceRunner .
    service initialized: ScriptInvoker v0.0.1
    > a
    allocated: 1
    > i HelloWorld
    "hello world from shell!\n"
    > quit
    shutting down...

enjoy!
lloyd
