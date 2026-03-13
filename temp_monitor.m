function temp_monitor(a)

time = [];
temperature = [];

i = 1;

figure

while true
    
    voltage = readVoltage(a,'A0');
    
    temp = (voltage - 0.5) / 0.01;
    
    temperature(i) = temp;
    time(i) = i;
    
    plot(time,temperature)
    
    xlabel('Time')
    ylabel('Temperature')
    
    drawnow
    
    if temp >= 18 && temp <= 24
        
        writeDigitalPin(a,'D8',1)
        writeDigitalPin(a,'D9',0)
        writeDigitalPin(a,'D10',0)
        
    elseif temp < 18
        
        writeDigitalPin(a,'D9',1)
        pause(0.5)
        writeDigitalPin(a,'D9',0)
        pause(0.5)
        
    else
        
        writeDigitalPin(a,'D10',1)
        pause(0.25)
        writeDigitalPin(a,'D10',0)
        pause(0.25)
        
    end
    
    pause(1)
    
    i = i + 1;

end

end