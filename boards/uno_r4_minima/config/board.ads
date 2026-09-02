with RA4M1_HAL.GPIO;

package Board is
   LED_Pin : constant RA4M1_HAL.GPIO.GPIO_Pin := (Port => 1, Number => 11);

   procedure Initialize;
end Board;
