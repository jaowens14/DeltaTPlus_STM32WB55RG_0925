/*
 * meter.h
 *
 *  Created on: Dec 20, 2025
 *      Author: jaowe
 */

#ifndef INC_METER_H_
#define INC_METER_H_
#include "lvgl.h"

extern lv_obj_t *meter_screen;

void brookes_meter(void);
float getBottomOfCircleYValue(float x_value, float x_offset, float y_offset, float radius);
float getTopOfCircleYValue(float x_value, float x_offset, float y_offset, float radius);
void updateSettingLabel(void);
void updateBatteryLabel(void);
void updateNeedle(void);
void updateChargingLabel(void);
void chargeHandler(void);
void gauge(void);
void header(void);
void updateLeftandRightTempLabels(void);
void point_at_distance(float x0, float y0, float x1, float y1, float distance, float *out_x, float *out_y);
lv_obj_t *create_meter_screen(void);


#endif /* INC_METER_H_ */
