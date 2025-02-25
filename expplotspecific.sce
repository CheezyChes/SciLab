function Cde = debye(T_d)
    k = 1.38e-23;
    N = 6.022e23;
    Cd = integrate('(x^4 * exp(x)) / ((exp(x) - 1)^2)', 'x', 0, 1/T_d);
    Cde = 9 * N * k * T_d^3 * Cd;
endfunction
Tx= [1, 3, 5, 8, 10,15, 20, 25, 30, 35,40, 45, 50, 55, 60, 65, 70, 80, 90, 100,120, 140, 160, 180, 200, 220, 240, 260, 280, 300];

cx = [0.000818, 0.0065, 0.0243, 0.0927, 0.183,0.670, 1.647, 3.066, 4.774, 6.612,8.419, 10.11, 11.66, 13.04, 14.27,15.35, 16.30, 17.87, 19.11, 20.10,21.54, 22.52, 23.22, 23.75, 24.16,24.49, 24.76, 24.99, 25.19, 25.37];
n = 100;
T = linspace(1, 300, n);
Td = 208.46;
Te = c*Td;
for i = 1:n
    T_d(i) = T(i) / Td;
    De(i) = debye(T_d(i));
end
plot(T,De,Tx,cx,'o')
title('Specific Heat Data')
xlabel('$Temperature \ (K)  $')
ylabel('$Specific \ Heat \ at \ constant \ Volume \ (J/mol-K)$')
legend('Predicted Curve by debye model','Data From Handbook of Physics and Chemistry  72nd Edition ','in_lower_right')
xgrid()
