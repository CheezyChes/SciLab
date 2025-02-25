function Cve = einstein(T_e)
    k = 1.38e-23;
    N = 6.022e23;
    Cve = 3 * k * N * (T_e)^2 * exp(T_e) / (exp(T_e) - 1)^2;
endfunction

function Cdp = petit()
    k = 1.38e-23;
    N = 6.022e23;
    Cdp = 3 * N * k;
endfunction

function Cde = debye(T_d)
    k = 1.38e-23;
    N = 6.022e23;
    Cd = integrate('(x^4 * exp(x)) / ((exp(x) - 1)^2)', 'x', 0, 1/T_d);
    Cde = 9 * N * k * T_d^3 * Cd;
endfunction
c=(%pi/6)^(1/3)
n = 300;
T = linspace(1, 100, n);
Td = 100;
Te = c*Td;
for i = 1:n
    T_e(i) = Te / T(i);
    T_d(i) = T(i) / Td;
    E(i) = einstein(T_e(i));
    D(i) = debye(T_d(i));
    F_e(i) = abs((E(i)-D(i))/D(i))
end

P = petit();

figure(1)
plot(T,P,T,E,T,D,T)
title('Debye vs Einstein Model for specific Heat')
xlabel('$Temperature \ (K)  $')
ylabel('$Specific \ Heat \ at \ constant \ Volume \ (J/mol-K)$')
legend('Dulong-petit','Einstein','Debye','in_lower_right')
xgrid()
figure(2)
plot(T_d, E / (3 * 6.022e23 * 1.38e-23), T_d, D / (3 * 6.022e23 * 1.38e-23));
title('Noarmalised Debye vs Einstein Model for specific Heat')
xlabel('$T/T_D$');
ylabel('$C_V/3Nk$');
legend('Einstein', 'Debye', 'in_lower_right');
xgrid();
figure(3)
loglog(T_d, E / (3 * 6.022e23 * 1.38e-23), T_d, D / (3 * 6.022e23 * 1.38e-23));
title('$loglog \ comparison \ of \ Debye \ and \ Einstein \ Model$')
xlabel('$log(T/T_D)$');
ylabel('$log(C_V/3Nk)$');
legend('Einstein', 'Debye', 'in_lower_right');
figure(4)
title('Fractional Error between debye and einstein model')
plot(T_d,F_e);
xlabel('$T/T_D$');
ylabel('$C_V/3Nk$');
legend('Fractional Error', 'in_lower_right');
xgrid();
