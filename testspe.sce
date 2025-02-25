T= [1, 3, 5, 8, 10,15, 20, 25, 30, 35,40, 45, 50, 55, 60, 65, 70, 80, 90, 100,120, 140, 160, 180, 200, 220, 240, 260, 280, 300];

c = [0.000818, 0.0065, 0.0243, 0.0927, 0.183,0.670, 1.647, 3.066, 4.774, 6.612,8.419, 10.11, 11.66, 13.04, 14.27,15.35, 16.30, 17.87, 19.11, 20.10,21.54, 22.52, 23.22, 23.75, 24.16,24.49, 24.76, 24.99, 25.19, 25.37];
function Cde = debye(T_d)
    k = 1.38e-23;
    N = 6.022e23;
    Cd = integrate('(x^4 * exp(x)) / ((exp(x) - 1)^2)', 'x', 0, 1/T_d);
    Cde = 9 * N * k * T_d^3 * Cd;
endfunction
// Optimization target
Td = linspace(1,300,50) ;  // Initial guess for Td
n = length(T);

// Array to store deviation results
errors = zeros(n, 1);
deviations = zeros(n, 1);

// Loop over the data points
for j=1:length(Td)
    for i = 1:n
    T_d = T(i) / Td(j);  // Scale temperature
    d = debye(T_d);   // Calculate the Debye value
    errors(i) = d - c(i);  // Calculate the deviation
    deviations(i) = errors(i)^2;  // Square of the deviation
    end
  total_deviation(j) = sum(deviations);
end
[b,e]=min(total_deviation)
disp('The Debye temperature is %f',Td(e))
for m=1:n
    T_exp = T(i)/Td(e)
    D_exp = debye(T_exp)
end
//Handbook of Physics and Chemistry ‐ 72nd Edition, page 5‐71
