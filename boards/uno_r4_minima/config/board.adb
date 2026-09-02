with R7FA4M1AB.PFS;
with R7FA4M1AB.PMISC;

package body Board is

   procedure Initialize is
   begin
      R7FA4M1AB.PMISC.PMISC_Periph.PWPR :=
        (Reserved => 0,
         PFSWE    => R7FA4M1AB.PMISC.Val_0,
         B0WI     => R7FA4M1AB.PMISC.Val_0);
      R7FA4M1AB.PMISC.PMISC_Periph.PWPR :=
        (Reserved => 0,
         PFSWE    => R7FA4M1AB.PMISC.Val_1,
         B0WI     => R7FA4M1AB.PMISC.Val_0);

      --  Configure the built-in LED on P111 as a GPIO output.
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
   end Initialize;

end Board;
