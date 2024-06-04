%% User Manual 
% 1. To run the program the function "analyze_ecg" has to be called.
% 2. This function takes to parameters, the first being the data which
% should be processed and the second being the intervals that should be
% analyzed. Keep in mind, that the functions expects data with a sampling
% rate of 200Hz.
% 3. The function then calls the function "detect_r_peaks" which
% finds/detects all R peaks in the data in the given intervals.
% 4. Afterwards the function "calculate_hr_hrv" gets called. This function
% takes the before found R peaks and calculates all the different results.
% 5. After the calculation, the function "display_results" gets called.
% Which takes all the results from the previous function and displays it
% nicely formatted. 

%This is an example of what the initial call of the function and therefore
%start of the program could look like
analyze_ecg('ecg1.mat', [0 10; 20 30; 40 50; 50 60; 60 70; 70 80; 80 90]);

