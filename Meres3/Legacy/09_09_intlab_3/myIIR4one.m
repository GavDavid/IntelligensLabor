function [y, state, memory] = myIIR4one(b, a, state, memory, s)
%OUTPUT: [y, state]
%b                  % Átvitel számlálója
%a                  % Átvitel nezeője
%state              % Állapotváltozók
%s                  % Bemeneti jel
%y                  % Kimeneti jel

% Inicializáció, ha szükséges
    if (length(state) ~= length(a))
        state = zeros(1, length(a));
    end
    if (length(memory) ~= length(b))
        memory = zeros(1, length(b));
    end
        memory = [s(1), memory(1:end-1)];
    
%% Maga a szűrés
    b_sum = 0;
    M = length(b);
    for i = 1:M
        b_sum = b_sum + b(i) * memory(i);
    end

    a_sum = 0;
    N = length(a);
    for i = 2:N
        a_sum = a_sum + a(i) * state(i-1);
    end
%% A szűrés kimenete és az állapotváltozónak az értékadás
    y = (b_sum - a_sum);
    state = [y, state(1:end-1)];
end