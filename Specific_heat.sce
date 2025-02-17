funcprot(0)
function Cve=einstein(T_e)
    k = 1.38e-23
    N = 6.022e23
    Cve = 3*k*N*(T_e)^2*(exp(T_e))/(exp(T_e)-1)^2
endfunction
function Cdp=petit()
    k = 1.38e-23
    N = 6.626e23
    Cdp = 3*N*k
endfunction
function Cde=debye(T_d)
    k = 1.38e-23
    N = 6.626e23
    Cd = integrate('(x^4 * exp(x)) / ((exp(x) - 1)^2)','x',0,1/T_d)
    Cde= 9*N*k*T_d^3*Cd
endfunction
n=50
T = linspace(1,500,n)
Te = 309
Td = 343
Ti = [40, 60, 80, 100, 120, 140, 160, 180, 200, 220, 240, 260, 280, 300, 320, 340, 360, 380, 400, 420, 440, 460, 480];
Cp = [0.3876,0.3905,0.3940,0.3970,0.3993,0.4020,0.4045,0.4071,0.4094,0.4117,0.4138,0.4158,0.4178,0.4197,0.4216,0.4234,0.4253,0.4271,0.4289,0.4307,0.4325,0.4343,0.4362]
for i=1:n
    T_e(i) = Te/T(i)
    E(i) = einstein(T_e(i))
    T_d(i)= T(i)/Td
    D(i)=debye(T_d(i))
end
for i=1:n
    P(i)=petit()
end
plot(T,P,T,E,T,D,Ti,Cp*63.55,'black--o')
xlabel('$Temperature \ (K)  $')
ylabel('$Specific \ Heat \ at \ constant \ Volume \ (J/mol-K)$')
legend('Dulong-petit','Einstein','Debye','$C. R. \ Brooks \ \textit{et al}.$','in_lower_right')
xgrid()
