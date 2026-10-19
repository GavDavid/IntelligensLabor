#include <math.h>
#include "sin2pi_fx.h"

//--------------------------------------------------------------------------//
// Function:	sin2pi_pm_fx16												//
//																			//
// Description: Maps the [-1,1) range into one period of the sine function.	//
//--------------------------------------------------------------------------//
fract sin2pi_pm_fx16(fract x){
   if (x < -0.5r) {
	   return -sin_fx16((x+FRACT_MAX)*2);
   } else if (x > 0.5r) {
	   return sin_fx16((FRACT_MAX-x)*2);
   } else if (x == 0.5r) {
	   return FRACT_MAX;
   } else {
	   return sin_fx16(x*2);
   }
}

//--------------------------------------------------------------------------//
// Function:	sin2pi_01_fx16												//
//																			//
// Description: Maps the [0,1) range into one period of the sine function.	//
//--------------------------------------------------------------------------//
fract sin2pi_01_fx16(fract x){
    if (x < 0.25r) {				/* < 0.25 */
        return sin_fx16(x*4);
    } else if (x < 0.75r) {			/* < 0.75 */
        return -sin_fx16((-0.5r + x) *4);
    } else {
        return sin_fx16((FRACT_MIN + x) *4);
    }
}
