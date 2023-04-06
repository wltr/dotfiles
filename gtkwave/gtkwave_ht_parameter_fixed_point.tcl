set displayed_signals [gtkwave::getDisplayedSignals]
set fixed_point_signals [list]
foreach signal $displayed_signals {
  set idx [string first "underlying_value\[63:0\]" $signal]
  if {$idx != -1} {
    lappend fixed_point_signals $signal
  }
}
gtkwave::unhighlightSignalsFromList $displayed_signals
gtkwave::highlightSignalsFromList $fixed_point_signals
gtkwave::/Edit/Data_Format/Signed_Decimal
gtkwave::/Edit/Data_Format/Fixed_Point_Shift/Specify 28
gtkwave::/Edit/Data_Format/Fixed_Point_Shift/On
gtkwave::unhighlightSignalsFromList $displayed_signals
