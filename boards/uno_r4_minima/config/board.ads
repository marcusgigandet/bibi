with RA4M1_HAL.GPIO;

package Board
  with SPARK_Mode => On
is
   LED_Pin     : aliased RA4M1_HAL.GPIO.GPIO_Point := (Port => 1, Pin => 11);
   UART_RX_Pin : aliased RA4M1_HAL.GPIO.GPIO_Point := (Port => 3, Pin => 1);
   UART_TX_Pin : aliased RA4M1_HAL.GPIO.GPIO_Point := (Port => 3, Pin => 2);

   Left_Motor_Pin  : aliased RA4M1_HAL.GPIO.GPIO_Point :=
     (Port => 3, Pin => 4);
   Right_Motor_Pin : aliased RA4M1_HAL.GPIO.GPIO_Point :=
     (Port => 1, Pin => 7);

   Sensor_Center_Pin : aliased RA4M1_HAL.GPIO.GPIO_Point :=
     (Port => 0, Pin => 14);

   procedure Initialize;
end Board;
