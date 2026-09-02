with RA4M1_HAL.GPIO;

package Board
  with SPARK_Mode => On
is
   LED_Pin     : constant RA4M1_HAL.GPIO.GPIO_Pin := (Port => 1, Number => 11);
   UART_RX_Pin : constant RA4M1_HAL.GPIO.GPIO_Pin := (Port => 3, Number => 1);
   UART_TX_Pin : constant RA4M1_HAL.GPIO.GPIO_Pin := (Port => 3, Number => 2);

   procedure Initialize;
end Board;
