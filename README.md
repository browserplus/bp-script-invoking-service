## Invoking Scripts From Services

This is a simple service that invokes a shell script or batch file.
The output of the script is captured inside the ruby environment and
can then be manipulated, returned, whatever.


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
