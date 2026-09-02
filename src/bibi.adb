--  Executable entry point

with Board;
with HAL.UART;
with RA4M1_HAL.GPIO;
with RA4M1_HAL.UART;

procedure Bibi with SPARK_Mode => On is

   UART_Config : constant RA4M1_HAL.UART.UART_Configuration :=
     (Baud         => 115_200,
      Stop_Bits    => RA4M1_HAL.UART.Stop_Bits_1,
      Parity_Type  => RA4M1_HAL.UART.Parity_None,
      Loopback     => False,
      Enable_FIFOs => False);

   Port : RA4M1_HAL.UART.UART_Port;

   Data   : HAL.UART.UART_Data_8b (0 .. 0) := (0 => Character'Pos ('A'));
   Status : HAL.UART.UART_Status;

begin
   Board.Initialize;

   RA4M1_HAL.GPIO.Digital_Write (Board.LED_Pin, True);

   RA4M1_HAL.UART.Configure (This => Port, Config => UART_Config);

   RA4M1_HAL.UART.Transmit
     (This => Port, Data => Data, Status => Status, Timeout => 1_000);

   loop
      for J in 0 .. 1_000 loop
         RA4M1_HAL.GPIO.Digital_Write (Board.LED_Pin, False);
      end loop;

      for J in 0 .. 1_000 loop
         RA4M1_HAL.GPIO.Digital_Write (Board.LED_Pin, True);
      end loop;
   end loop;

end Bibi;
