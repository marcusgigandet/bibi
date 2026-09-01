--  Executable entry point
with RA4M1_HAL;
with RA4M1_HAL.GPIO;
with R7FA4M1AB;
with R7FA4M1AB.PMISC;
with R7FA4M1AB.PFS;

procedure Bibi is
   LED_Pin : constant RA4M1_HAL.GPIO.GPIO_Pin := (Port => 1, Number => 11);
begin
   R7FA4M1AB.PMISC.PMISC_Periph.PWPR :=
     (Reserved => 0,
      PFSWE    => R7FA4M1AB.PMISC.Val_0,
      B0WI     => R7FA4M1AB.PMISC.Val_0);
   R7FA4M1AB.PMISC.PMISC_Periph.PWPR :=
     (Reserved => 0,
      PFSWE    => R7FA4M1AB.PMISC.Val_1,
      B0WI     => R7FA4M1AB.PMISC.Val_0);

   -- Configure the LED GPIO pin to output mode
   --  P111: PODR=0, PDR=1 (output), PMR=0 (GPIO)
   R7FA4M1AB.PFS.PFS_Periph.P1PFS (0) :=
     (PODR       => R7FA4M1AB.PFS.Val_0,
      PIDR       => R7FA4M1AB.PFS.Val_0,
      PDR        => R7FA4M1AB.PFS.Val_1,
      Reserved   => False,
      PCR        => R7FA4M1AB.PFS.Val_0,
      Reserved_1 => False,
      NCODR      => R7FA4M1AB.PFS.Val_0,
      Reserved_2 => 0,
      DSCR       => R7FA4M1AB.PFS.Val_0,
      Reserved_3 => False,
      EOR        => R7FA4M1AB.PFS.Val_0,
      EOF        => R7FA4M1AB.PFS.Val_0,
      ISEL       => R7FA4M1AB.PFS.Val_0,
      ASEL       => R7FA4M1AB.PFS.Val_0,
      PMR        => R7FA4M1AB.PFS.Val_0,
      Reserved_4 => 0,
      PSEL       => 0,
      Reserved_5 => 0);

   loop
      RA4M1_HAL.GPIO.Digital_Write (LED_Pin, True);
   end loop;
end Bibi;
