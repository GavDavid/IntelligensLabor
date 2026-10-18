REM set JAVA_PATH_1="C:\Program Files\Java\jre1.5.0_06\bin\"
REM set JAVA_PATH_1="c:\Program Files\Java\jre6\bin\"
set JAVA_PATH_1="c:\Program Files (x86)\Java\jre6\bin\"


%JAVA_PATH_1%java.exe -classpath .;./comm.jar;./win32com.dll;./javax.comm.properties RezDataColl --mode data 

REM Parameters:
REM   --help                     : display help
REM   --com  com port identifier : set serial port
REM   --baud baud rate           : set baud rate
REM   --mode mode_of_operation   : set the mode of operation [data | rezdata | DSP]

