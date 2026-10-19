/*********************************************************************************

Copyright(c) 2012 Analog Devices, Inc. All Rights Reserved.

This software is proprietary and confidential.  By using this software you agree
to the terms of the associated Analog Devices License Agreement.

*********************************************************************************/
/*
* Use the GPIO service to Toggle LED's when the push buttons are pressed on the EZ-kit.
*/

#include <services/gpio/adi_gpio.h>
#include <services/int/adi_int.h>
#include <stdio.h>
#include "Button_LED_GPIO.h"


/* Managed drivers and/or services include */
#include "system/adi_initialize.h"

#define GPIO_MEMORY_SIZE (ADI_GPIO_CALLBACK_MEM_SIZE*2)

/* Macro for reporting errors */
#define REPORT_ERROR printf

/* used for exit timeout */
#define MAXCOUNT (2000000000u)

static uint8_t gpioMemory[GPIO_MEMORY_SIZE];

static bool bError;
static uint64_t count;

static void CheckResult(ADI_GPIO_RESULT result)
{
    if (result != ADI_GPIO_SUCCESS) {
        REPORT_ERROR("GPIO failure\n");
        bError = true;
    }
}

void gpioCallback(ADI_GPIO_PORT ePort, uint32_t Data, void *pCBParam)
{
    if (ePort == PUSH_BUTTON1_PORT)
    {
        if (Data & PUSH_BUTTON1_PIN)
        {
            //push button 1 - toggle LED
            adi_gpio_Toggle(LED1_PORT, LED1_PIN);
        }
        else if (Data & PUSH_BUTTON2_PIN)
        {
            //push button 2 - toggle LED
            adi_gpio_Toggle(LED2_PORT, LED2_PIN);
        }
    }

    /* reset the exit counter */
    count = 0u;
}

int main(void)
{
    int i;
    uint32_t gpioMaxCallbacks;
    ADI_INT_STATUS  eIntResult;

    // init the GPIO service
    ADI_GPIO_RESULT result = adi_gpio_Init(
            (void*)gpioMemory,
            GPIO_MEMORY_SIZE,
            &gpioMaxCallbacks);

    /* Initialize managed drivers and/or services */
    adi_initComponents();
    CheckResult(result);

    /*
     * Setup Push Button 1
     */

    // set GPIO input

    result = adi_gpio_SetDirection(
        PUSH_BUTTON1_PORT,
        PUSH_BUTTON1_PIN,
        ADI_GPIO_DIRECTION_INPUT);
    CheckResult(result);

    result = adi_gpio_SetInputEdgeSense(
        PUSH_BUTTON1_PORT,
        PUSH_BUTTON1_PIN,
        ADI_GPIO_SENSE_RISING_EDGE);
    CheckResult(result);

    result = adi_gpio_EnableInterruptMask(
        PUSH_BUTTON1_PORT,
        PUSH_BUTTON1_PIN,
        PUSH_BUTTON1_INT_CHNL,
        true);
    CheckResult(result);

    // register gpio callback
    result = adi_gpio_RegisterCallback(
        PUSH_BUTTON1_PORT,
        PUSH_BUTTON1_PIN,
        gpioCallback,
        (void*)0);
    CheckResult(result);

    /*
     * Setup Push Button 2
     */

    // set GPIO input

    result = adi_gpio_SetDirection(
        PUSH_BUTTON2_PORT,
        PUSH_BUTTON2_PIN,
        ADI_GPIO_DIRECTION_INPUT);
    CheckResult(result);

    result = adi_gpio_SetInputEdgeSense(
        PUSH_BUTTON2_PORT,
        PUSH_BUTTON2_PIN,
        ADI_GPIO_SENSE_RISING_EDGE);
    CheckResult(result);

    result = adi_gpio_EnableInterruptMask(
        PUSH_BUTTON2_PORT,
        PUSH_BUTTON2_PIN,
        PUSH_BUTTON2_INT_CHNL,
        true);
    CheckResult(result);

    // register gpio callback
    result = adi_gpio_RegisterCallback(
        PUSH_BUTTON2_PORT,
        PUSH_BUTTON2_PIN,
        gpioCallback,
        (void*)0);
    CheckResult(result);

    /*
     * Setup LED's
     */

    // set GPIO output LED 0
    result = adi_gpio_SetDirection(
        LED1_PORT,
        LED1_PIN,
        ADI_GPIO_DIRECTION_OUTPUT);
    CheckResult(result);

    // set GPIO output LED 1
    result = adi_gpio_SetDirection(
        LED2_PORT,
        LED2_PIN,
        ADI_GPIO_DIRECTION_OUTPUT);
    CheckResult(result);

    count = 0u;
    printf("\nPress %s or %s to toggle LED's on the EZ-Kit \n\n", PUSH_BUTTON1_LABEL, PUSH_BUTTON2_LABEL);

    /* wait for push button interrupts - exit the loop after a while */
    while(count < MAXCOUNT)
    {
        count++;
    }

    if (bError) {
        printf("Error configuring the push buttons or LED's\n");
    } else {
        printf("All done\n");
    }

    return 0;
}


