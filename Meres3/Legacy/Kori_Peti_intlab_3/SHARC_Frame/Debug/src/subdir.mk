################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
ASM_SRCS += \
../src/conv.asm 

C_SRCS += \
../src/DAIsignInit.c \
../src/IRQprocess.c \
../src/SPORTisr.c \
../src/init1835viaSPI.c \
../src/initDAI.c \
../src/initPLL.c \
../src/initSPORT.c \
../src/main.c \
../src/process.c 

SRC_OBJS += \
./src/DAIsignInit.doj \
./src/IRQprocess.doj \
./src/SPORTisr.doj \
./src/conv.doj \
./src/init1835viaSPI.doj \
./src/initDAI.doj \
./src/initPLL.doj \
./src/initSPORT.doj \
./src/main.doj \
./src/process.doj 

ASM_DEPS += \
./src/conv.d 

C_DEPS += \
./src/DAIsignInit.d \
./src/IRQprocess.d \
./src/SPORTisr.d \
./src/init1835viaSPI.d \
./src/initDAI.d \
./src/initPLL.d \
./src/initSPORT.d \
./src/main.d \
./src/process.d 


# Each subdirectory must supply rules for building sources it contributes
src/DAIsignInit.doj: ../src/DAIsignInit.c
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore SHARC C/C++ Compiler'
	cc21k -c -file-attr ProjectName="SHARC_Frame" -proc ADSP-21364 -flags-compiler --no_wrap_diagnostics -si-revision 0.5 -O -Ov100 -g -save-temps -path-output ./$(@D) -DCORE0 -D_DEBUG -structs-do-not-overlap -force-circbuf -no-const-strings -no-multiline -warn-protos -double-size-32 -gnu-style-dependencies -MD -Mo "src/DAIsignInit.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/IRQprocess.doj: ../src/IRQprocess.c
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore SHARC C/C++ Compiler'
	cc21k -c -file-attr ProjectName="SHARC_Frame" -proc ADSP-21364 -flags-compiler --no_wrap_diagnostics -si-revision 0.5 -O -Ov100 -g -save-temps -path-output ./$(@D) -DCORE0 -D_DEBUG -structs-do-not-overlap -force-circbuf -no-const-strings -no-multiline -warn-protos -double-size-32 -gnu-style-dependencies -MD -Mo "src/IRQprocess.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/SPORTisr.doj: ../src/SPORTisr.c
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore SHARC C/C++ Compiler'
	cc21k -c -file-attr ProjectName="SHARC_Frame" -proc ADSP-21364 -flags-compiler --no_wrap_diagnostics -si-revision 0.5 -O -Ov100 -g -save-temps -path-output ./$(@D) -DCORE0 -D_DEBUG -structs-do-not-overlap -force-circbuf -no-const-strings -no-multiline -warn-protos -double-size-32 -gnu-style-dependencies -MD -Mo "src/SPORTisr.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/conv.doj: ../src/conv.asm
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore SHARC Assembler'
	easm21k -file-attr ProjectName="SHARC_Frame" -proc ADSP-21364 -si-revision 0.5 -g -save-temps -DCORE0 -D_DEBUG -gnu-style-dependencies -MM -Mo "src/conv.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/init1835viaSPI.doj: ../src/init1835viaSPI.c
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore SHARC C/C++ Compiler'
	cc21k -c -file-attr ProjectName="SHARC_Frame" -proc ADSP-21364 -flags-compiler --no_wrap_diagnostics -si-revision 0.5 -O -Ov100 -g -save-temps -path-output ./$(@D) -DCORE0 -D_DEBUG -structs-do-not-overlap -force-circbuf -no-const-strings -no-multiline -warn-protos -double-size-32 -gnu-style-dependencies -MD -Mo "src/init1835viaSPI.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/initDAI.doj: ../src/initDAI.c
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore SHARC C/C++ Compiler'
	cc21k -c -file-attr ProjectName="SHARC_Frame" -proc ADSP-21364 -flags-compiler --no_wrap_diagnostics -si-revision 0.5 -O -Ov100 -g -save-temps -path-output ./$(@D) -DCORE0 -D_DEBUG -structs-do-not-overlap -force-circbuf -no-const-strings -no-multiline -warn-protos -double-size-32 -gnu-style-dependencies -MD -Mo "src/initDAI.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/initPLL.doj: ../src/initPLL.c
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore SHARC C/C++ Compiler'
	cc21k -c -file-attr ProjectName="SHARC_Frame" -proc ADSP-21364 -flags-compiler --no_wrap_diagnostics -si-revision 0.5 -O -Ov100 -g -save-temps -path-output ./$(@D) -DCORE0 -D_DEBUG -structs-do-not-overlap -force-circbuf -no-const-strings -no-multiline -warn-protos -double-size-32 -gnu-style-dependencies -MD -Mo "src/initPLL.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/initSPORT.doj: ../src/initSPORT.c
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore SHARC C/C++ Compiler'
	cc21k -c -file-attr ProjectName="SHARC_Frame" -proc ADSP-21364 -flags-compiler --no_wrap_diagnostics -si-revision 0.5 -O -Ov100 -g -save-temps -path-output ./$(@D) -DCORE0 -D_DEBUG -structs-do-not-overlap -force-circbuf -no-const-strings -no-multiline -warn-protos -double-size-32 -gnu-style-dependencies -MD -Mo "src/initSPORT.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/main.doj: ../src/main.c
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore SHARC C/C++ Compiler'
	cc21k -c -file-attr ProjectName="SHARC_Frame" -proc ADSP-21364 -flags-compiler --no_wrap_diagnostics -si-revision 0.5 -O -Ov100 -g -save-temps -path-output ./$(@D) -DCORE0 -D_DEBUG -structs-do-not-overlap -force-circbuf -no-const-strings -no-multiline -warn-protos -double-size-32 -gnu-style-dependencies -MD -Mo "src/main.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/process.doj: ../src/process.c
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore SHARC C/C++ Compiler'
	cc21k -c -file-attr ProjectName="SHARC_Frame" -proc ADSP-21364 -flags-compiler --no_wrap_diagnostics -si-revision 0.5 -O -Ov100 -g -save-temps -path-output ./$(@D) -DCORE0 -D_DEBUG -structs-do-not-overlap -force-circbuf -no-const-strings -no-multiline -warn-protos -double-size-32 -gnu-style-dependencies -MD -Mo "src/process.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


