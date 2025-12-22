/*
 * menu.h
 *
 *  Created on: Dec 20, 2025
 *      Author: jaowe
 */

#ifndef INC_MENU_H_
#define INC_MENU_H_

#include "lvgl.h"
extern lv_obj_t *menu_screen;

lv_obj_t * create_menu_screen(void);
void load_menu_cb(lv_event_t *e);


#endif /* INC_MENU_H_ */
