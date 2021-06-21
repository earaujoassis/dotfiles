set theApplication to (path to frontmost application as Unicode text)
set appWidth to 1620 as integer
set appHeight to 980 as integer
set xAxisDefault to 300 as integer
set yAxisDefault to 300 as integer

tell application theApplication
    set currentDimension to bounds of the front window
end tell
    
set xAxis to item 1 of currentDimension
set yAxis to item 2 of currentDimension

tell application theApplication
    activate
    reopen
    set the bounds of the first window to {xAxis, yAxis, appWidth + xAxis, appHeight + yAxis}
end tell
