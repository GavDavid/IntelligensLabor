################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
ASM_SRCS += \
../src/conv.asm \
../src/convUH.asm \
../src/conv_var.asm 

C_SRCS += \
../src/DAIsignInit.c \
../src/IRQprocess.c \
../src/SPORTisrDec.c \
../src/init1835viaSPI.c \
../src/initDAI.c \
../src/initPLL.c \
../src/initSPORT.c \
../src/main.c \
../src/processLMS.c 

SRC_OBJS += \
./src/DAIsignInit.doj \
./src/IRQprocess.doj \
./src/SPORTisrDec.doj \
./src/conv.doj \
./src/convUH.doj \
./src/conv_var.doj \
./src/init1835viaSPI.doj \
./src/initDAI.doj \
./src/initPLL.doj \
./src/initSPORT.doj \
./src/main.doj \
./src/processLMS.doj 

ASM_DEPS += \
./src/conv.d \
./src/convUH.d \
./src/conv_var.d 

C_DEPS += \
./src/DAIsignInit.d \
./src/IRQprocess.d \
./src/SPORTisrDec.d \
./src/init1835viaSPI.d \
./src/initDAI.d \
./src/initPLL.d \
./src/initSPORT.d \
./src/main.d \
./src/processLMS.d 


# Each subdirectory must supply rules for building sources it contributes
src/DAIsignInit.doj: ../src/DAIsignInit.c
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore SHARC C/C++ Compiler'
	cc21k -c -file-attr ProjectName="SHARC_Lab_LMS" -proc ADSP-21364 -flags-compiler --no_wrap_diagnostics -si-revision 0.5 -O -Ov100 -g -save-temps -path-output ./$(@D) -DCORE0 -D_DEBUG -structs-do-not-overlap -force-circbuf -no-const-strings -no-multiline -warn-protos -double-size-32 -gnu-style-dependencies -MD -Mo "src/DAIsignInit.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/IRQprocess.doj: ../src/IRQprocess.c
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore SHARC C/C++ Compiler'
	cc21k -c -file-attr ProjectName="SHARC_Lab_LMS" -proc ADSP-21364 -flags-compiler --no_wrap_diagnostics -si-revision 0.5 -O -Ov100 -g -save-temps -path-output ./$(@D) -DCORE0 -D_DEBUG -structs-do-not-overlap -force-circbuf -no-const-strings -no-multiline -warn-protos -double-size-32 -gnu-style-dependencies -MD -Mo "src/IRQprocess.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/SPORTisrDec.doj: ../src/SPORTisrDec.c
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore SHARC C/C++ Compiler'
	cc21k -c -file-attr ProjectName="SHARC_Lab_LMS" -proc ADSP-21364 -flags-compiler --no_wrap_diagnostics -si-revision 0.5 -O -Ov100 -g -save-temps -path-output ./$(@D) -DCORE0 -D_DEBUG -structs-do-not-overlap -force-circbuf -no-const-strings -no-multiline -warn-protos -double-size-32 -gnu-style-dependencies -MD -Mo "src/SPORTisrDec.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/conv.doj: ../src/conv.asm
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore SHARC Assembler'
	easm21k -file-attr ProjectName="SHARC_Lab_LMS" -proc ADSP-21364 -si-revision 0.5 -g -save-temps -DCORE0 -D_DEBUG -gnu-style-dependencies -MM -Mo "src/conv.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/convUH.doj: ../src/convUH.asm
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore SHARC Assembler'
	easm21k -file-attr ProjectName="SHARC_Lab_LMS" -proc ADSP-21364 -si-revision 0.5 -g -save-temps -DCORE0 -D_DEBUG -gnu-style-dependencies -MM -Mo "src/convUH.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/conv_var.doj: ../src/conv_var.asm
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore SHARC Assembler'
	easm21k -file-attr ProjectName="SHARC_Lab_LMS" -proc ADSP-21364 -si-revision 0.5 -g -save-temps -DCORE0 -D_DEBUG -gnu-style-dependencies -MM -Mo "src/conv_var.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/init1835viaSPI.doj: ../src/init1835viaSPI.c
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore SHARC C/C++ Compiler'
	cc21k -c -file-attr ProjectName="SHARC_Lab_LMS" -proc ADSP-21364 -flags-compiler --no_wrap_diagnostics -si-revision 0.5 -O -Ov100 -g -save-temps -path-output ./$(@D) -DCORE0 -D_DEBUG -structs-do-not-overlap -force-circbuf -no-const-strings -no-multiline -warn-protos -double-size-32 -gnu-style-dependencies -MD -Mo "src/init1835viaSPI.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/initDAI.doj: ../src/initDAI.c
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore SHARC C/C++ Compiler'
	cc21k -c -file-attr ProjectName="SHARC_Lab_LMS" -proc ADSP-21364 -flags-compiler --no_wrap_diagnostics -si-revision 0.5 -O -Ov100 -g -save-temps -path-output ./$(@D) -DCORE0 -D_DEBUG -structs-do-not-overlap -force-circbuf -no-const-strings -no-multiline -warn-protos -double-size-32 -gnu-style-dependencies -MD -Mo "src/initDAI.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/initPLL.doj: ../src/initPLL.c
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore SHARC C/C++ Compiler'
	cc21k -c -file-attr ProjectName="SHARC_Lab_LMS" -proc ADSP-21364 -flags-compiler --no_wrap_diagnostics -si-revision 0.5 -O -Ov100 -g -save-temps -path-output ./$(@D) -DCORE0 -D_DEBUG -structs-do-not-overlap -force-circbuf -no-const-strings -no-multiline -warn-protos -double-size-32 -gnu-style-dependencies -MD -Mo "src/initPLL.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/initSPORT.doj: ../src/initSPORT.c
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore SHARC C/C++ Compiler'
	cc21k -c -file-attr ProjectName="SHARC_Lab_LMS" -proc ADSP-21364 -flags-compiler --no_wrap_diagnostics -si-revision 0.5 -O -Ov100 -g -save-temps -path-output ./$(@D) -DCORE0 -D_DEBUG -structs-do-not-overlap -force-circbuf -no-const-strings -no-multiline -warn-protos -double-size-32 -gnu-style-dependencies -MD -Mo "src/initSPORT.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/main.doj: ../src/main.c
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore SHARC C/C++ Compiler'
	cc21k -c -file-attr ProjectName="SHARC_Lab_LMS" -proc ADSP-21364 -flags-compiler --no_wrap_diagnostics -si-revision 0.5 -O -Ov100 -g -save-temps -path-output ./$(@D) -DCORE0 -D_DEBUG -structs-do-not-overlap -force-circbuf -no-const-strings -no-multiline -warn-protos -double-size-32 -gnu-style-dependencies -MD -Mo "src/main.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/processLMS.doj: ../src/processLMS.c
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore SHARC C/C++ Compiler'
	cc21k -c -file-attr ProjectName="SHARC_Lab_LMS" -proc ADSP-21364 -flags-compiler --no_wrap_diagnostics -si-revision 0.5 -O -Ov100 -g -save-temps -path-output ./$(@D) -DCORE0 -D_DEBUG -structs-do-not-overlap -force-circbuf -no-const-strings -no-multiline -warn-protos -double-size-32 -gnu-style-dependencies -MD -Mo "src/processLMS.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


