--
--  Copyright (C) 2026 Marcus Gigandet
--
--  SPDX-License-Identifier: GPL-3.0-or-later
--

--  Executable entry point

with Board;
with HAL.GPIO;       use HAL.GPIO;
with RA4M1_HAL;      use RA4M1_HAL;
with RA4M1_HAL.Time; use RA4M1_HAL.Time;
with RA4M1_HAL.UART;

procedure Bibi with SPARK_Mode => On is

   UART_Config : constant RA4M1_HAL.UART.UART_Configuration :=
     (Baud         => 115_200,
      Stop_Bits    => RA4M1_HAL.UART.Stop_Bits_1,
      Parity_Type  => RA4M1_HAL.UART.Parity_None,
      Loopback     => False,
      Enable_FIFOs => False);

begin
   Board.Initialize;

   --  Configure Pin modes to output
   Board.LED_Pin.Set_Mode (Output);
   Board.Left_Motor_Pin.Set_Mode (Output);
   Board.Right_Motor_Pin.Set_Mode (Output);

   --  Configure Pin modes to input
   Board.Sensor_Center_Pin.Set_Mode (Input);

   --  Basic LED blinking loop
   loop
      Delayer.Delay_Milliseconds (1_000);
      Board.LED_Pin.Clear;

      Delayer.Delay_Milliseconds (1_000);
      Board.LED_Pin.Set;
   end loop;

end Bibi;
