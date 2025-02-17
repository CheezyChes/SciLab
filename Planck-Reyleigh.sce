clf; 
c = 3e8;    // Speed of light (m/s)
k = 1.38e-23;  // Boltzmann's constant (J/K)
h = 6.63e-34;  // Planck's constant (J.s)
v = 1e10:20e10:1400e12;  
// Function for Planck's Law
function planck = p(t, v)
    planck = (2*h*v.^3 ./ c.^2) .* (1 ./ (exp(h*v ./ (k*t)) - 1));
endfunction

// Function for Rayleigh-Jeans Law
function reyleigh = r(t, v)
    reyleigh = ((2*v.^2*k*t) ./ c.^2);
endfunction
figure(1)
//subplot(2,2,1)
// Plotting Planck's and Rayleigh-Jeans Laws for different temperatures in log-log scale
loglog(v, p(100, v), '-r', 'LineWidth', 2);  // Planck's Law for 100K in red
loglog(v, p(1000, v), '-b', 'LineWidth', 2);  // Planck's Law for 1000K in blue
loglog(v, p(10000, v), '-c', 'LineWidth', 2);  // Planck's Law for 10000K in cyan
legend('100K','1000K','10000K','in_upper_left')
xlabel('Frequency(Hz)')
ylabel('$Spectral \ Radiance\  (W m^{-2} sr^{-1} Hz^{-1})$')
title('$LogLog \ Plot \ of \ Spectral \ Radiance \ and \ Frequency$')
gca.data_bounds =[1e10 1e15, 1e-18 1e-4];  // Adjust axis limits for better visibility
figure(2)
//subplot(2,2,2)
loglog(v,p(1000,v),'-b')
loglog(v, r(1000, v), '-r', 'LineWidth', 2);
legend('Plancks-Law','Reyleigh-Jeans')
xlabel('Frequency(Hz)')
ylabel('$Spectral \ Radiance\  (W m^{-2} sr^{-1} Hz^{-1})$')
title('$LogLog \ Plot \ of \ Spectral \ Radiance \ and \ Frequency$')
gca.data_bounds =[1e10 1e15, 1e-18 1e-4];  // Adjust axis limits for better visibility
figure(3)
//subplot(2,2,3)
plot(v, p(500, v), '-r', 'LineWidth', 2);  // Planck's Law for 100K in red
plot(v, p(600, v), '-b', 'LineWidth', 2);  // Planck's Law for 1000K in blue
plot(v, p(700, v), '-c', 'LineWidth', 2);  // Planck's Law for 10000K in cyan
legend('500K','600K','700K')
xlabel('Frequency(Hz)')
ylabel('$Spectral \ Radiance\  (W m^{-2} sr^{-1} Hz^{-1})$')
title('$Plot \ of \ Spectral \ Radiance \ and \ Frequency \ at \ different \ temperatures \ for Plancks \ Law$')
gca.data_bounds = [0,0;2e14,7e-11];  // Adjust axis limits for better visibility
figure(4)
//subplot(2,2,4)
plot(v, p(500, v), '-r', 'LineWidth', 2);  // Planck's Law for 100K in red
plot(v, r(500, v), '-b', 'LineWidth', 2);  // Reylieghs's Law for 1000K in blue
legend('Plancks Law','Reyliegh Jeans')
xlabel('Frequency(Hz)')
ylabel('$Spectral \ Radiance\  (W m^{-2} sr^{-1} Hz^{-1})$')
title('$Plot \ of \ Spectral \ Radiance \ and \ Frequency \ comparing \ Reyleigh-Jeans \ and \ Plancks \ Law$')
gca.data_bounds = [0,0;2e14,7e-11];  // Adjust axis limits for better visibility
