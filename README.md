# Sensor Data Conversion in MATLAB
we usually use different sensors In Embedded System design, the actual value of these sensors need scaling on the fixed point number
This MATLAB function, sensor_conversion, provides a generalized way to convert between fixed-point sensor outputs and actual physical values. The function takes into account the word length, fractional length, and physical range of the sensor values to accurately perform the conversion.

## Requirements
MATLAB environment

## How to Use
Copy the function sensor_conversion.m into your MATLAB working directory.
Call the function in your MATLAB script or command window.
Function Signature
'''
[actual_value, sensor_output] = sensor_conversion(mode, value, word_length, frac_length, min_value, max_value)
'''
## Parameters
mode: String, either 'toActual' for converting sensor output to actual value or 'toSensor' for the reverse.
value: The value to be converted.
word_length: The word length of the fixed-point representation.
frac_length: The fractional length of the fixed-point representation.
min_value: The minimum physical value the sensor can measure.
max_value: The maximum physical value the sensor can measure.


## Examples
To convert from sensor output to actual value:
'''
% Convert a 16-bit sensor output of 6550 to its actual value
% using a Q15.1 format and physical range of 300 to 1100
[actual_value, ~] = sensor_conversion('toActual', 6550, 16, 1, 300, 1100);
'''

To convert from an actual value to sensor output:
'''
% Convert an actual value of 800 to a 16-bit sensor output
% using a Q15.1 format and physical range of 300 to 1100
[~, sensor_output] = sensor_conversion('toSensor', 800, 16, 1, 300, 1100);
'''


