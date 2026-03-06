/*
 * settings.cpp
 *
 *  Created on: Dec 20, 2025
 *      Author: jaowe
 */


#include "lvgl.h"
#include "widgets.h"
#include "menu.h"
#include "app_ble.h"

lv_obj_t *settings_screen = NULL;
lv_obj_t *statusLabel = NULL;
lv_timer_t * statusTimer = NULL;

float thermocouple_sensitivity = 1.0f;
uint8_t screen_brightness = 100;

char status[64];




void updateClientStatus(lv_timer_t *timer)
{
  if (settings_screen != NULL)
  {
    getClientStatus(status, 64);

    lv_obj_t *ta = (lv_obj_t *)lv_timer_get_user_data(timer);

    lv_label_set_text(ta, status);
  }
}





static void textarea_event_handler(lv_event_t * e) {
    lv_obj_t * ta = lv_event_get_target_obj(e);
    const char * text = lv_textarea_get_text(ta);

    LV_LOG_USER("Search or Refresh was pressed. The current text is: %s", text);

    // Convert entered text to number
    uint16_t entered_serial = (uint16_t)atoi(text);

    if (entered_serial > 0) {
        // Set the target serial number BEFORE scanning
        setTargetSerialNumber(entered_serial);

        // Update status
        snprintf(status, 64, "Searching for SN: %d...", entered_serial);
        lv_label_set_text(statusLabel, status);

        // Start scan
        start_scan_cb(e);
    }
    else {
        // No serial number entered
        snprintf(status, 64, "Enter serial number first");
        lv_label_set_text(statusLabel, status);
    }



 }

 static void btnm_event_handler(lv_event_t * e)
 {
     lv_obj_t * obj = lv_event_get_target_obj(e);
     lv_obj_t * ta = (lv_obj_t *)lv_event_get_user_data(e);
     const char * txt = lv_buttonmatrix_get_button_text(obj, lv_buttonmatrix_get_selected_button(obj));

     if(lv_strcmp(txt, LV_SYMBOL_BACKSPACE) == 0) lv_textarea_delete_char(ta);
     else if(lv_strcmp(txt, LV_SYMBOL_OK) == 0) lv_obj_send_event(ta, LV_EVENT_READY, NULL);
     else lv_textarea_add_text(ta, txt);

 }


 void start_scan_cb(lv_event_t *e){
 	APP_BLE_Key_Button1_Action();
 }






static void disconnect_cb(lv_event_t *e)
{
	APP_BLE_Disconnect();
}



lv_obj_t * create_settings_screen(void)
{
  // Create settings screen
  settings_screen = lv_obj_create(NULL);
  lv_obj_set_style_bg_color(settings_screen, lv_color_hex(WEB_LIGHT_TAN), 0);

  // Create container for settings content
  lv_obj_t *settings_container = lv_obj_create(settings_screen);
  //lv_obj_set_size(settings_container, ST7789_WIDTH - 20, ST7789_HEIGHT - 20);

  lv_obj_set_width(settings_container, lv_obj_get_width(settings_screen) - 4);
  lv_obj_set_height(settings_container, LV_SIZE_CONTENT);

  //lv_obj_center(settings_container);
  lv_obj_set_style_bg_color(settings_container, lv_color_hex(WEB_LIGHT_TAN), 0);
  lv_obj_set_style_bg_opa(settings_container, LV_OPA_COVER, 0); // ADD THIS

  lv_obj_set_style_border_color(settings_container, lv_color_hex(WEB_LIGHT_TAN), 0);
  lv_obj_set_style_border_width(settings_container, 2, 0);
  lv_obj_set_style_radius(settings_container, 5, 0);
  lv_obj_set_style_pad_all(settings_container, 3, 0);
  lv_obj_clear_flag(settings_container, LV_OBJ_FLAG_SCROLLABLE);


  // TITLE
  lv_obj_t *title = lv_label_create(settings_container);
  lv_label_set_text(title, "Connections");
  lv_obj_set_style_text_font(title, &lv_font_montserrat_14, 0);
  lv_obj_set_style_text_color(title, lv_color_hex(Charcoal), 0);
  lv_obj_align(title, LV_ALIGN_TOP_MID, 0, 0);


  // TEXT AREA
  lv_obj_t * ta = lv_textarea_create(settings_container);
  lv_textarea_set_one_line(ta, true);
  lv_textarea_set_placeholder_text(ta, "Scope serial number...");  // Add placeholder text
  lv_obj_set_width(ta, 192);  // Set explicit width to match button matrix
  lv_obj_scroll_to_x(ta, 0, LV_ANIM_OFF);  // Scroll to the beginning

  lv_obj_align_to(ta, title, LV_ALIGN_OUT_BOTTOM_MID , 0, 5);

  lv_obj_add_event_cb(ta, textarea_event_handler, LV_EVENT_READY, ta);
  lv_obj_add_state(ta, LV_STATE_FOCUSED); /*To be sure the cursor is visible*/
  lv_obj_set_style_border_color(ta, lv_color_hex(WEB_LIGHT_TAN), 0);


  // STATUS
  statusLabel = lv_label_create(settings_container);
  lv_obj_clear_flag(statusLabel, LV_OBJ_FLAG_CLICKABLE);
  lv_obj_clear_flag(statusLabel, LV_OBJ_FLAG_SCROLLABLE);
  lv_label_set_text(statusLabel, ".....Loading.....");
  lv_obj_set_size(statusLabel, LV_SIZE_CONTENT, LV_SIZE_CONTENT);
  lv_obj_align_to(statusLabel, ta, LV_ALIGN_OUT_BOTTOM_LEFT, 0, 10);


  // BTNM
  static const char * btnm_map[] = {"1", "2", "3", "\n",
                                        "4", "5", "6", "\n",
                                        "7", "8", "9", "\n",
                                        LV_SYMBOL_BACKSPACE, "0", LV_SYMBOL_OK, ""
                                       };

  lv_obj_t * btnm = lv_buttonmatrix_create(settings_container);
  lv_obj_set_size(btnm, 216, 180);

  lv_obj_align_to(btnm, ta, LV_ALIGN_OUT_BOTTOM_MID , 0, 28);

  lv_obj_add_event_cb(btnm, btnm_event_handler, LV_EVENT_VALUE_CHANGED, ta);
  lv_obj_remove_flag(btnm, LV_OBJ_FLAG_CLICK_FOCUSABLE); /*To keep the text area focused on button clicks*/
  lv_buttonmatrix_set_map(btnm, btnm_map);
  lv_obj_set_style_border_color(btnm, lv_color_hex(WEB_LIGHT_TAN), 0);

  lv_obj_set_style_bg_color(btnm, lv_color_hex(Charcoal), LV_PART_ITEMS | LV_STATE_DEFAULT);
  lv_obj_set_style_bg_color(btnm, lv_color_hex(WEB_ORANGE), LV_PART_ITEMS | LV_STATE_PRESSED);
  lv_obj_set_style_text_color(btnm, lv_color_hex(0xFFFFFF), LV_PART_ITEMS | LV_STATE_DEFAULT);

  lv_obj_set_style_bg_color(btnm, lv_color_hex(WEB_LIGHT_TAN), 0);
  lv_obj_set_style_shadow_color(btnm, lv_color_hex(0x000000), 0);


//#endif

  // Back button
    lv_obj_t *back_btn = lv_btn_create(settings_container);
    lv_obj_set_size(back_btn, 40, 40);
    lv_obj_set_style_bg_color(back_btn, lv_color_hex(Charcoal), 0);
    lv_obj_set_style_radius(back_btn, 5, 0);
    lv_obj_align_to(back_btn, btnm, LV_ALIGN_OUT_BOTTOM_LEFT, 0, 0);

    lv_obj_t *back_label = lv_label_create(back_btn);
    lv_label_set_text(back_label, LV_SYMBOL_SETTINGS);
    lv_obj_center(back_label);
    lv_obj_set_style_text_color(back_label, lv_color_hex(0xFFFFFF), 0);

    lv_obj_add_event_cb(back_btn, load_menu_cb, LV_EVENT_CLICKED, NULL);

    // Disconnect button
    lv_obj_t *disconnect_btn = lv_btn_create(settings_container);
    lv_obj_set_size(disconnect_btn, 40, 40);
    lv_obj_set_style_bg_color(disconnect_btn, lv_color_hex(Charcoal), 0);
    lv_obj_set_style_bg_color(disconnect_btn, lv_color_hex(0xCC3333), LV_STATE_PRESSED);
    lv_obj_set_style_radius(disconnect_btn, 5, 0);
    lv_obj_align_to(disconnect_btn, btnm, LV_ALIGN_OUT_BOTTOM_RIGHT , 0, 0);

    lv_obj_t *disconnect_label = lv_label_create(disconnect_btn);
    lv_label_set_text(disconnect_label, LV_SYMBOL_CLOSE);
    lv_obj_center(disconnect_label);
    lv_obj_set_style_text_color(disconnect_label, lv_color_hex(0xFFFFFF), 0);

    lv_obj_add_event_cb(disconnect_btn, disconnect_cb, LV_EVENT_CLICKED, NULL);
//#endif


  if (statusTimer == NULL)
  {
	  statusTimer = lv_timer_create(updateClientStatus, 1000, statusLabel);
  }

  else
  {
    // Update user data if timer already exists
    lv_timer_set_user_data(statusTimer, statusLabel);
  }


  lv_obj_null_on_delete(&settings_screen);


  return settings_screen;
}







