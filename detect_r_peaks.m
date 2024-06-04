function r_peaks = detect_r_peaks(signal, fs)
    % Detect R-peaks in the ECG signal using a simple threshold method
    %
    % Parameters:
    %   signal (vector): ECG signal
    %   fs (scalar): Sampling frequency in Hz
    %
    % Returns:
    %   r_peaks (vector): Indices of detected R-peaks

    threshold = max(signal) * 0.6;  % Define threshold
    r_peaks = find(signal > threshold);

    % Remove false peaks
    min_distance = 0.6 * fs;  % Minimum distance between R-peaks (0.6 seconds)

    r_peaks = [r_peaks(diff(r_peaks) > min_distance)];

    display(r_peaks);
    display(diff(r_peaks));

    % Additional filtering based on physiological HR limits
    min_hr = 30;  % Minimum plausible HR (30 bpm)
    max_hr = 200;  % Maximum plausible HR (200 bpm)
    min_rr_interval = fs * 60 / max_hr;  % Minimum RR interval in samples
    max_rr_interval = fs * 60 / min_hr;  % Maximum RR interval in samples

    % Keep peaks with realistic RR intervals
    valid_rr_intervals = [(diff(r_peaks) > min_rr_interval) & (diff(r_peaks) < max_rr_interval)];
    r_peaks = r_peaks(valid_rr_intervals);
    display(r_peaks);

end
