################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/ISR.c \
../src/initialize.c \
../src/main.c \
../src/process_data.c \
../src/sin2pi_fx.c \
../src/uart.c 

SRC_OBJS += \
./src/ISR.doj \
./src/initialize.doj \
./src/main.doj \
./src/process_data.doj \
./src/sin2pi_fx.doj \
./src/uart.doj 

C_DEPS += \
./src/ISR.d \
./src/initialize.d \
./src/main.d \
./src/process_data.d \
./src/sin2pi_fx.d \
./src/uart.d 


# Each subdirectory must supply rules for building sources it contributes
src/ISR.doj: ../src/ISR.c
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore Blackfin C/C++ Compiler'
	ccblkfn -c -file-attr ProjectName="BlackFin_FIR_fract" -proc ADSP-BF537 -flags-compiler --no_wrap_diagnostics -si-revision 0.3 -O -Ov100 -g -save-temps -path-output ./$(@D) -DCORE0 -D_DEBUG -structs-do-not-overlap -no-circbuf -no-const-strings -no-multiline -warn-protos -double-size-32 -decls-strong -cplbs -gnu-style-dependencies -MD -Mo "src/ISR.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/initialize.doj: ../src/initialize.c
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore Blackfin C/C++ Compiler'
	ccblkfn -c -file-attr ProjectName="BlackFin_FIR_fract" -proc ADSP-BF537 -flags-compiler --no_wrap_diagnostics -si-revision 0.3 -O -Ov100 -g -save-temps -path-output ./$(@D) -DCORE0 -D_DEBUG -structs-do-not-overlap -no-circbuf -no-const-strings -no-multiline -warn-protos -double-size-32 -decls-strong -cplbs -gnu-style-dependencies -MD -Mo "src/initialize.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/main.doj: ../src/main.c
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore Blackfin C/C++ Compiler'
	ccblkfn -c -file-attr ProjectName="BlackFin_FIR_fract" -proc ADSP-BF537 -flags-compiler --no_wrap_diagnostics -si-revision 0.3 -O -Ov100 -g -save-temps -path-output ./$(@D) -DCORE0 -D_DEBUG -structs-do-not-overlap -no-circbuf -no-const-strings -no-multiline -warn-protos -double-size-32 -decls-strong -cplbs -gnu-style-dependencies -MD -Mo "src/main.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/process_data.doj: ../src/process_data.c
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore Blackfin C/C++ Compiler'
	ccblkfn -c -file-attr ProjectName="BlackFin_FIR_fract" -proc ADSP-BF537 -flags-compiler --no_wrap_diagnostics -si-revision 0.3 -O -Ov100 -g -save-temps -path-output ./$(@D) -DCORE0 -D_DEBUG -structs-do-not-overlap -no-circbuf -no-const-strings -no-multiline -warn-protos -double-size-32 -decls-strong -cplbs -gnu-style-dependencies -MD -Mo "src/process_data.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/sin2pi_fx.doj: ../src/sin2pi_fx.c
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore Blackfin C/C++ Compiler'
	ccblkfn -c -file-attr ProjectName="BlackFin_FIR_fract" -proc ADSP-BF537 -flags-compiler --no_wrap_diagnostics -si-revision 0.3 -O -Ov100 -g -save-temps -path-output ./$(@D) -DCORE0 -D_DEBUG -structs-do-not-overlap -no-circbuf -no-const-strings -no-multiline -warn-protos -double-size-32 -decls-strong -cplbs -gnu-style-dependencies -MD -Mo "src/sin2pi_fx.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/uart.doj: ../src/uart.c
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore Blackfin C/C++ Compiler'
	ccblkfn -c -file-attr ProjectName="BlackFin_FIR_fract" -proc ADSP-BF537 -flags-compiler --no_wrap_diagnostics -si-revision 0.3 -O -Ov100 -g -save-temps -path-output ./$(@D) -DCORE0 -D_DEBUG -structs-do-not-overlap -no-circbuf -no-const-strings -no-multiline -warn-protos -double-size-32 -decls-strong -cplbs -gnu-style-dependencies -MD -Mo "src/uart.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


