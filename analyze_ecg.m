function analyze_ecg(ecg_file, intervals)
    % Analyze ECG signal and compute heart rate (HR) and heart rate variability (HRV)
    %
    % Parameters:
    %   ecg_file (string): Path to the Matlab file containing the ECG signal.
    %   intervals (Nx2 matrix): Matrix containing the start and end times for analysis intervals.
    %
    % Example:
    %   analyze_ecg('ecg1.mat', [0 10; 20 30; 40 50]);

    % Load ECG signal
    data = load(ecg_file);
    signal = data.ecg1;  % Using the correct field name
    fs = 200;  % Sampling frequency in Hz

    % Initialize result arrays
    heart_rates = [];
    hrvs_sdnn = [];
    hrvs_sdsd = [];

    % Loop through each interval
    for i = 1:size(intervals, 1)
        start_time = intervals(i, 1);
        end_time = intervals(i, 2);
        start_idx = round(start_time * fs) + 1;
        end_idx = round(end_time * fs);

        interval_signal = signal(start_idx:end_idx);

        % Detect R-peaks
        r_peaks = detect_r_peaks(interval_signal, fs);

        if isempty(r_peaks)
            warning('No R-peaks found in the interval [%d, %d].', start_time, end_time);
            heart_rates = [heart_rates; NaN, NaN, NaN];
            hrvs_sdnn = [hrvs_sdnn; NaN];
            hrvs_sdsd = [hrvs_sdsd; NaN];
            continue;
        end

        % Calculate HR and HRV measures
        [hr, min_hr, max_hr, sdnn, sdsd] = calculate_hr_hrv(r_peaks, fs);

        heart_rates = [heart_rates; hr, min_hr, max_hr];
        hrvs_sdnn = [hrvs_sdnn; sdnn];
        hrvs_sdsd = [hrvs_sdsd; sdsd];
    end

    % Display results for each interval
    display_results(intervals, heart_rates, hrvs_sdnn, hrvs_sdsd);

    %display(length(intervals));
    % If more than 7 intervals, calculate and display summary statistics
    
end
