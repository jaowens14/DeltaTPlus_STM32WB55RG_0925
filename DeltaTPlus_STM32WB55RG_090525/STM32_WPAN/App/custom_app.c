/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file    App/custom_app.c
  * @author  MCD Application Team
  * @brief   Custom Example Application (Server)
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2025 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "app_common.h"
#include "dbg_trace.h"
#include "ble.h"
#include "custom_app.h"
#include "custom_stm.h"
#include "stm32_seq.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "DeltaT.h"
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
typedef struct
{
  /* My_P2P_Server */
  uint8_t               Switch_c_Notification_Status;
  uint8_t               Delta_t_ch_Notification_Status;
  /* USER CODE BEGIN CUSTOM_APP_Context_t */
  uint8_t TimerMeasurement_Id;
  /* USER CODE END CUSTOM_APP_Context_t */

  uint16_t              ConnectionHandle;
} Custom_App_Context_t;

/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private defines ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

/* USER CODE END PD */

/* Private macros -------------------------------------------------------------*/
/* USER CODE BEGIN PM */
#define CUSTOM_APP_MEASUREMENT_INTERVAL   (1000000/CFG_TS_TICK_VAL)  /**< 1s */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
/**
 * START of Section BLE_APP_CONTEXT
 */

static Custom_App_Context_t Custom_App_Context;

/**
 * END of Section BLE_APP_CONTEXT
 */

uint8_t UpdateCharData[512];
uint8_t NotifyCharData[512];
uint16_t Connection_Handle;
/* USER CODE BEGIN PV */

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
/* My_P2P_Server */
static void Custom_Switch_c_Update_Char(void);
static void Custom_Switch_c_Send_Notification(void);
static void Custom_Delta_t_ch_Update_Char(void);
static void Custom_Delta_t_ch_Send_Notification(void);

/* USER CODE BEGIN PFP */
static uint32_t HRSAPP_Read_RTC_SSR_SS ( void );
static void Schedule_DeltaT_Update( void );
static void Custom_App_DeltaT_Measurement(void);

/* USER CODE END PFP */

/* Functions Definition ------------------------------------------------------*/
void Custom_STM_App_Notification(Custom_STM_App_Notification_evt_t *pNotification)
{
  /* USER CODE BEGIN CUSTOM_STM_App_Notification_1 */

  /* USER CODE END CUSTOM_STM_App_Notification_1 */
  switch (pNotification->Custom_Evt_Opcode)
  {
    /* USER CODE BEGIN CUSTOM_STM_App_Notification_Custom_Evt_Opcode */

    /* USER CODE END CUSTOM_STM_App_Notification_Custom_Evt_Opcode */

    /* My_P2P_Server */
    case CUSTOM_STM_LED_C_READ_EVT:
      /* USER CODE BEGIN CUSTOM_STM_LED_C_READ_EVT */

      /* USER CODE END CUSTOM_STM_LED_C_READ_EVT */
      break;

    case CUSTOM_STM_LED_C_WRITE_NO_RESP_EVT:
      /* USER CODE BEGIN CUSTOM_STM_LED_C_WRITE_NO_RESP_EVT */

      /* USER CODE END CUSTOM_STM_LED_C_WRITE_NO_RESP_EVT */
      break;

    case CUSTOM_STM_SWITCH_C_NOTIFY_ENABLED_EVT:
      /* USER CODE BEGIN CUSTOM_STM_SWITCH_C_NOTIFY_ENABLED_EVT */

      /* USER CODE END CUSTOM_STM_SWITCH_C_NOTIFY_ENABLED_EVT */
      break;

    case CUSTOM_STM_SWITCH_C_NOTIFY_DISABLED_EVT:
      /* USER CODE BEGIN CUSTOM_STM_SWITCH_C_NOTIFY_DISABLED_EVT */

      /* USER CODE END CUSTOM_STM_SWITCH_C_NOTIFY_DISABLED_EVT */
      break;

    case CUSTOM_STM_REBOOT_REQUEST_CH_WRITE_NO_RESP_EVT:
      /* USER CODE BEGIN CUSTOM_STM_REBOOT_REQUEST_CH_WRITE_NO_RESP_EVT */

      /* USER CODE END CUSTOM_STM_REBOOT_REQUEST_CH_WRITE_NO_RESP_EVT */
      break;

    case CUSTOM_STM_DELTA_T_CH_NOTIFY_ENABLED_EVT:
      /* USER CODE BEGIN CUSTOM_STM_DELTA_T_CH_NOTIFY_ENABLED_EVT */

      /* USER CODE END CUSTOM_STM_DELTA_T_CH_NOTIFY_ENABLED_EVT */
      break;

    case CUSTOM_STM_DELTA_T_CH_NOTIFY_DISABLED_EVT:
      /* USER CODE BEGIN CUSTOM_STM_DELTA_T_CH_NOTIFY_DISABLED_EVT */

      /* USER CODE END CUSTOM_STM_DELTA_T_CH_NOTIFY_DISABLED_EVT */
      break;

    case CUSTOM_STM_NOTIFICATION_COMPLETE_EVT:
      /* USER CODE BEGIN CUSTOM_STM_NOTIFICATION_COMPLETE_EVT */

      /* USER CODE END CUSTOM_STM_NOTIFICATION_COMPLETE_EVT */
      break;

    default:
      /* USER CODE BEGIN CUSTOM_STM_App_Notification_default */

      /* USER CODE END CUSTOM_STM_App_Notification_default */
      break;
  }
  /* USER CODE BEGIN CUSTOM_STM_App_Notification_2 */

  /* USER CODE END CUSTOM_STM_App_Notification_2 */
  return;
}

void Custom_APP_Notification(Custom_App_ConnHandle_Not_evt_t *pNotification)
{
  /* USER CODE BEGIN CUSTOM_APP_Notification_1 */

  /* USER CODE END CUSTOM_APP_Notification_1 */

  switch (pNotification->Custom_Evt_Opcode)
  {
    /* USER CODE BEGIN CUSTOM_APP_Notification_Custom_Evt_Opcode */

    /* USER CODE END P2PS_CUSTOM_Notification_Custom_Evt_Opcode */
    case CUSTOM_CONN_HANDLE_EVT :
      /* USER CODE BEGIN CUSTOM_CONN_HANDLE_EVT */

      /* USER CODE END CUSTOM_CONN_HANDLE_EVT */
      break;

    case CUSTOM_DISCON_HANDLE_EVT :
      /* USER CODE BEGIN CUSTOM_DISCON_HANDLE_EVT */

      /* USER CODE END CUSTOM_DISCON_HANDLE_EVT */
      break;

    default:
      /* USER CODE BEGIN CUSTOM_APP_Notification_default */

      /* USER CODE END CUSTOM_APP_Notification_default */
      break;
  }

  /* USER CODE BEGIN CUSTOM_APP_Notification_2 */

  /* USER CODE END CUSTOM_APP_Notification_2 */

  return;
}

void Custom_APP_Init(void)
{
  /* USER CODE BEGIN CUSTOM_APP_Init */
	UTIL_SEQ_RegTask( 1<< CFG_TASK_UPDATE_DELTA_T_ID, UTIL_SEQ_RFU, Custom_App_DeltaT_Measurement);
	HW_TS_Create(CFG_TIM_PROC_ID_ISR, &(Custom_App_Context.TimerMeasurement_Id), hw_ts_Repeated, Schedule_DeltaT_Update);
    HW_TS_Start(Custom_App_Context.TimerMeasurement_Id, CUSTOM_APP_MEASUREMENT_INTERVAL);

  /* USER CODE END CUSTOM_APP_Init */
  return;
}

/* USER CODE BEGIN FD */

/* USER CODE END FD */

/*************************************************************
 *
 * LOCAL FUNCTIONS
 *
 *************************************************************/

/* My_P2P_Server */
__USED void Custom_Switch_c_Update_Char(void) /* Property Read */
{
  uint8_t updateflag = 0;

  /* USER CODE BEGIN Switch_c_UC_1*/

  /* USER CODE END Switch_c_UC_1*/

  if (updateflag != 0)
  {
    Custom_STM_App_Update_Char(CUSTOM_STM_SWITCH_C, (uint8_t *)UpdateCharData);
  }

  /* USER CODE BEGIN Switch_c_UC_Last*/

  /* USER CODE END Switch_c_UC_Last*/
  return;
}

void Custom_Switch_c_Send_Notification(void) /* Property Notification */
{
  uint8_t updateflag = 0;

  /* USER CODE BEGIN Switch_c_NS_1*/

  /* USER CODE END Switch_c_NS_1*/

  if (updateflag != 0)
  {
    Custom_STM_App_Update_Char(CUSTOM_STM_SWITCH_C, (uint8_t *)NotifyCharData);
  }

  /* USER CODE BEGIN Switch_c_NS_Last*/

  /* USER CODE END Switch_c_NS_Last*/

  return;
}

__USED void Custom_Delta_t_ch_Update_Char(void) /* Property Read */
{
  uint8_t updateflag = 0;

  /* USER CODE BEGIN Delta_t_ch_UC_1*/

  /* USER CODE END Delta_t_ch_UC_1*/

  if (updateflag != 0)
  {
    Custom_STM_App_Update_Char(CUSTOM_STM_DELTA_T_CH, (uint8_t *)UpdateCharData);
  }

  /* USER CODE BEGIN Delta_t_ch_UC_Last*/

  /* USER CODE END Delta_t_ch_UC_Last*/
  return;
}

void Custom_Delta_t_ch_Send_Notification(void) /* Property Notification */
{
  uint8_t updateflag = 0;

  /* USER CODE BEGIN Delta_t_ch_NS_1*/

  /* USER CODE END Delta_t_ch_NS_1*/

  if (updateflag != 0)
  {
    Custom_STM_App_Update_Char(CUSTOM_STM_DELTA_T_CH, (uint8_t *)NotifyCharData);
  }

  /* USER CODE BEGIN Delta_t_ch_NS_Last*/

  /* USER CODE END Delta_t_ch_NS_Last*/

  return;
}

/* USER CODE BEGIN FD_LOCAL_FUNCTIONS*/
static void Custom_App_DeltaT_Measurement(void)
{
/* USER CODE BEGIN HRSAPP_Measurement */
  //uint32_t measurement;

  //measurement = ((HRSAPP_Read_RTC_SSR_SS()) & 0x07) + 65;
  //HRSAPP_Context.MeasurementvalueChar.MeasurementValue = measurement;
  //UpdateCharData = measurement;
#if (BLE_CFG_HRS_ENERGY_EXPENDED_INFO_FLAG != 0)
  if((HRSAPP_Context.MeasurementvalueChar.Flags & HRS_HRM_ENERGY_EXPENDED_PRESENT) &&
     (HRSAPP_Context.ResetEnergyExpended == 0))
    HRSAPP_Context.MeasurementvalueChar.EnergyExpended += 5;
  else if(HRSAPP_Context.ResetEnergyExpended == 1)
    HRSAPP_Context.ResetEnergyExpended = 0;
#endif

  Custom_STM_App_Update_Char(CUSTOM_STM_DELTA_T_CH, (uint8_t *)&myDeltaTCharValue);

/* USER CODE END HRSAPP_Measurement */
  return;
}

static void Schedule_DeltaT_Update( void )
{
  /**
   * The code shall be executed in the background as aci command may be sent
   * The background is the only place where the application can make sure a new aci command
   * is not sent if there is a pending one
   */
  UTIL_SEQ_SetTask( 1<<CFG_TASK_UPDATE_DELTA_T_ID, CFG_SCH_PRIO_0);
/* USER CODE BEGIN HrMeas */

/* USER CODE END HrMeas */

  return;
}

static uint32_t HRSAPP_Read_RTC_SSR_SS ( void )
{
  return ((uint32_t)(READ_BIT(RTC->SSR, RTC_SSR_SS)));
}
/* USER CODE END FD_LOCAL_FUNCTIONS*/
