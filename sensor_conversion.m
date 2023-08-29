function [actual_value, sensor_output] = sensor_conversion(mode, value, word_length, frac_length, min_value, max_value)
    % Create a fixed-point object based on the word length and fractional length
    FISensor = fi(0, 0, word_length, frac_length); % Unsigned fixed-point object
    
    % Calculate the maximum digital value the fixed-point representation can hold
    max_digital = 2^word_length - 1;
    
    % Calculate the scale factor
    scale_factor = max_digital / (max_value - min_value);
    
    % Initialize return values
    actual_value = NaN;
    sensor_output = NaN;
    
    if strcmp(mode, 'toActual')
        % Convert sensor output to actual value
        sensor_output = value; % Assume the input 'value' is the sensor output
        FISensor.data = sensor_output;
        actual_value = double(FISensor) / scale_factor + min_value;
        
    elseif strcmp(mode, 'toSensor')
        % Convert actual value to sensor output
        actual_value = value; % Assume the input 'value' is the actual sensor reading
        sensor_output = round((actual_value - min_value) * scale_factor);
        FISensor.data = sensor_output;
        
    else
        disp('Invalid mode. Use either "toActual" or "toSensor"');
        return;
    end
    
    % Display the Fixed-Point and Actual Values
    if ~isnan(actual_value)
        disp(['Actual value: ', num2str(actual_value)]);
    end
    
    if ~isnan(sensor_output)
        disp(['Sensor output: ', num2str(sensor_output)]);
        disp(['Fixed-point representation: ', FISensor.bin]);
    end
end
