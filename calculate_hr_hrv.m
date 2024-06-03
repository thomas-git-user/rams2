function [hr, min_hr, max_hr, sdnn, sdsd] = calculate_hr_hrv(r_peaks, fs)
    % Calculate heart rate and heart rate variability measures
    %
    % Parameters:
    %   r_peaks (vector): Indices of detected R-peaks
    %   fs (scalar): Sampling frequency in Hz
    %
    % Returns:
    %   hr (scalar): Average heart rate in bpm
    %   min_hr (scalar): Minimum heart rate in bpm
    %   max_hr (scalar): Maximum heart rate in bpm
    %   sdnn (scalar): Standard deviation of NN intervals (ms)
    %   sdsd (scalar): Standard deviation of differences of successive NN intervals (ms)

    rr_intervals = diff(r_peaks) / fs;  % RR intervals in seconds
    hr = 60 ./ rr_intervals;  % Heart rate in bpm

    avg_hr = mean(hr);
    min_hr = min(hr);
    max_hr = max(hr);

    % Calculate HRV measures
    sdnn = std(rr_intervals) * 1000;  % SDNN in ms
    sdsd = std(diff(rr_intervals)) * 1000;  % SDSD in ms

    % Output variables
    hr = avg_hr;
    min_hr = min_hr;
    max_hr = max_hr;
end
