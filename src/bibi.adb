--  Executable entry point
with Board;
with RA4M1_HAL.GPIO;

procedure Bibi is
begin
   Board.Initialize;

   RA4M1_HAL.GPIO.Digital_Write (Board.LED_Pin, True);

   loop
      for J in 0 .. 1000 loop
         RA4M1_HAL.GPIO.Digital_Write (Board.LED_Pin, False);
      end loop;

      for J in 0 .. 1000 loop
         RA4M1_HAL.GPIO.Digital_Write (Board.LED_Pin, True);
      end loop;
   end loop;
end Bibi;
