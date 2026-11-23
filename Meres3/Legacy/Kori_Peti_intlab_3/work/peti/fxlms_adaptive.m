function [e, w] = fxlms_adaptive(mu, M, s, c, x, y)
    % Function implementing the FxLMS algorithm
    % Inputs:
    % mu: step size for gradient update
    % M: number of taps (filter length)
    % s: coefficients of true secondary path S(z) (not directly used for adaptation)
    % c: coefficients of estimated secondary path C(z) (for filtering)
    % x: input to P(z) (reference signal)
    % y: desired output (e.g., the signal we want to cancel)
    % Outputs:
    % e: error signal vector
    % w: adaptive filter weights (approximating P(z))
    
    % Length of input signal
    N = length(x);
    
    % Initialize filter weights w and error signal e
    w = zeros(M, 1);  % Adaptive filter (FxLMS) weights (initially zeros)
    e = zeros(N, 1);  % Error signal
    
    % Initialize filtered input buffer (for filtered-x signal)
    x_hat = zeros(M, 1);  % Filtered reference signal

    % Buffer to store previous inputs for adaptive filtering
    x_buf = zeros(M, 1);  
    
    % Length of the estimated secondary path filter
    L = length(c); 
    
    % Buffer for secondary path filter
    x_s = zeros(L, 1);  % For filtering input x through C(z)

    % FxLMS algorithm loop
    for n = 1:N
        % Step 1: Shift the input buffer and add the new sample
        x_buf = [x(n); x_buf(1:end-1)];  % Update the input buffer
        
        % Step 2: Filter the reference signal x through C(z) (estimated secondary path)
        x_s = [x(n); x_s(1:end-1)];  % Update the buffer for C(z)
        x_hat_new = c' * x_s;  % Filtered reference signal x_hat[n]
        x_hat = [x_hat_new; x_hat(1:end-1)];

        % Step 3: Calculate the output of the adaptive filter w
        y_hat = w' * x_hat;  % Adaptive filter output
        
        % Step 4: Calculate the error signal e(n)
        e(n) = y(n) - y_hat;  % Error signal (desired - filter output)
        
        % Step 5: Update filter weights using the FxLMS update rule
        w = w + mu * e(n) * x_hat;  % Update the weights
    end
end