function display_results(intervals, heart_rates, hrvs_sdnn, hrvs_sdsd)
    % Display the results of HR and HRV analysis
    %
    % Parameters:
    %   intervals (Nx2 matrix): Analysis intervals
    %   heart_rates (Nx3 matrix): Heart rate measures (average, min, max)
    %   hrvs_sdnn (vector): SDNN measures for each interval
    %   hrvs_sdsd (vector): SDSD measures for each interval

    fprintf('Heart Rate (HR) and Heart Rate Variability (HRV) Results:\n');
    fprintf('Interval  Average HR  Min HR  Max HR  SDNN  SDSD\n');
    for i = 1:size(intervals, 1)
        fprintf('[%d, %d]  %.2f  %.2f  %.2f  %.2f  %.2f\n', intervals(i, 1), intervals(i, 2), ...
            heart_rates(i, 1), heart_rates(i, 2), heart_rates(i, 3), hrvs_sdnn(i), hrvs_sdsd(i));
    end

    if size(intervals, 1) > 7
        mean_hr = mean(heart_rates(:, 1), 'omitnan');
        std_hr = std(heart_rates(:, 1), 'omitnan');
        abs_min_hr = min(heart_rates(:, 2), [], 'omitnan');
        abs_max_hr = max(heart_rates(:, 3), [], 'omitnan');
        fprintf('Statistics over more than 7 intervals:\n');
        fprintf('Mean HR: %.2f, HR Standard Deviation: %.2f, Absolute Min HR: %.2f, Absolute Max HR: %.2f\n', ...
            mean_hr, std_hr, abs_min_hr, abs_max_hr);
    end
end
