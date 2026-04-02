function temp_prediction(a)

%This function calculates how fast the temperature is changing using 
%real-time sensor data. It finds the rate of change and predicts the
%temperature after 5 minutes. The values are printed on the screen at each
%step. If the temperature increases faster than 4°C per minute, the red 
%LED turns on. If it decreases faster than 4°C per minute, the yellow LED 
%turns on. Otherwise, the green LED shows that the temperature is stable.

prev_temp = readVoltage(a,'A0');
prev_temp = (prev_temp - 0.5) / 0.01;

pause(1)

while true

    % read current temperature
    voltage = readVoltage(a,'A0');
    temp = (voltage - 0.5) / 0.01;

    % calculate rate (°C/s)
    rate = temp - prev_temp;

    % convert to °C/min
    rate_min = rate * 60;

    % predict temperature after 5 minutes
    future_temp = temp + rate_min * 5;

    % print results
    fprintf('Current Temp: %.2f °C\n', temp);
    fprintf('Rate: %.2f °C/min\n', rate_min);
    fprintf('Predicted Temp (5 min): %.2f °C\n\n', future_temp);

    
  