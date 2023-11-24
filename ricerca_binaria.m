function indice = ricerca_binaria(current_array, v)

L = length(current_array);
inizio = 1;
fine = L;
trovato = false;
indice = -1;
while and(not(trovato),inizio<=fine)
    % la funzione floor approssima per difetto all'intero più vicino
    % la funzione ceil approssima per eccesso all'intero più vicino
    meta = floor((fine + inizio )/2);
    if current_array(meta) == v
        trovato = true;
        indice = meta;
    elseif current_array(meta) > v
        fine = meta-1;
    else 
        inizio = meta+1;
    end
end

end