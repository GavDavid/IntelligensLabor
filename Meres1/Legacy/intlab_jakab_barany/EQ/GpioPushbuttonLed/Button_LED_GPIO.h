/*********************************************************************************

Copyright(c) 2012 Analog Devices, Inc. All Rights Reserved.

This software is proprietary and confidential.  By using this software you agree
to the terms of the associated Analog Devices License Agreement.

*********************************************************************************/

/*!
* @file     Button_LED_GPIO.h
*
* @brief    Primary header file for GPIO service example.
*
* @details  Primary header file for GPIO which contains the processor specific defines.
*
*/


#ifndef _BUTTON_LED_GPIO_H_
#define _BUTTON_LED_GPIO_H_

/*
 * Push button 1 GPIO settings
 */

/* GPIO port to which push button 1 is connected to */
#define PUSH_BUTTON1_PORT           ADI_GPIO_PORT_F

/* GPIO pin within the port to which push button 1 is connected to */
#define PUSH_BUTTON1_PIN            ADI_GPIO_PIN_2

/* Interrupt channel through which the GPIO interrupt is notified */
#define PUSH_BUTTON1_INT_CHNL       ADI_GPIO_MASK_A

/* Label printed on the EZ-Kit */
#define PUSH_BUTTON1_LABEL          "PB1"

/*
 * Push button 2 GPIO settings
 */

/* GPIO port to which push button 2 is connected to */
#define PUSH_BUTTON2_PORT           ADI_GPIO_PORT_F

/* GPIO pin within the port to which push button 2 is connected to */
#define PUSH_BUTTON2_PIN            ADI_GPIO_PIN_3

/* Interrupt channel through which the GPIO interrupt is notified */
#define PUSH_BUTTON2_INT_CHNL       ADI_GPIO_MASK_A

/* Label printed on the EZ-Kit */
#define PUSH_BUTTON2_LABEL          "PB2"


/*
 * LED 1 GPIO settings
 */

/* GPIO port to which LED 1 is connected to */
#define LED1_PORT                   ADI_GPIO_PORT_F

/* GPIO pin within the port to which LED 1 is connected to */
#define LED1_PIN                    ADI_GPIO_PIN_6


/*
 * LED 2 GPIO settings
 */

/* GPIO port to which LED 2 is connected to */
#define LED2_PORT                   ADI_GPIO_PORT_F

/* GPIO pin within the port to which LED 2 is connected to */
#define LED2_PIN                    ADI_GPIO_PIN_7


#endif /* _BUTTON_LED_GPIO_H_ */
