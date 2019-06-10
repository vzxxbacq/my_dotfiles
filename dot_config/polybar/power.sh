echo - | awk "{printf \"%.1f\",                     
$((                                                                                                                 
  $(cat /sys/class/power_supply/BAT0/capacity
))  }" ; echo " W"
