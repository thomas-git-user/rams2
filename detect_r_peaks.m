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
    
    display(diff(r_peaks));

    % Remove false peaks
    min_distance = 0.6 * fs;  % Minimum distance between R-peaks (0.6 seconds)

    r_peaks = [r_peaks(1),r_peaks(diff(r_peaks) > min_distance)];
end
