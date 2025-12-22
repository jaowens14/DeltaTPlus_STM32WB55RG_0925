/*
 * settings.h
 *
 *  Created on: Dec 20, 2025
 *      Author: jaowe
 */

#ifndef INC_SETTINGS_H_
#define INC_SETTINGS_H_


extern lv_obj_t * settings_screen;

void sensitivity_slider_cb(lv_event_t *e);
void brightness_slider_cb(lv_event_t *e);
lv_obj_t * create_settings_screen(void);


#endif /* INC_SETTINGS_H_ */
