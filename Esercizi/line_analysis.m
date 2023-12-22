function [num_dots,dots_size, white_space] = line_analysis(line_p)

%     Presenti disturbi, allora binarizziamo l'immagine
%     for i = 1:length(line_p)
%         if(line_p(i)>230) %Scegliamo 230 perchè essendo sulla backlight, qualsiasi elemento leggermente diverso dal bianco viene binarizzato a nero
%             line_p(i) = 255;
%         else
%             line_p(i) = 0;
%         end
%     end
    
    plot(line_p);
    num_dots = 0;
    lung_white = 0;
    lung_black = 0;
    lung_temp_black = 0;
    lung_temp_white = 0;
    actual_dot = line_p(1);
    fronte_p = false; % passaggio da nero a bianco
    fronte_n = false; % passaggio da bianco a nero

    if(actual_dot==0)
        lung_temp_white = lung_temp_white + 1;
    else
        lung_temp_black = lung_temp_black + 1;
    end
    
    for i = 2:length(line_p)
        if(line_p(i)<actual_dot) %set fronte negativo
            fronte_n = true;
        end
        
        if(line_p(i)>actual_dot) %set fronte positivo
            fronte_p = true;
        end
    
        if(line_p(i)==0)
            lung_temp_black = lung_temp_black + 1; %Aumenta dot neri temporanei
        else
            lung_temp_white = lung_temp_white + 1; %Aumenta dot bianchi temporanei
        end

        if(fronte_p) %Passa da nero a bianco
            if(fronte_n) %Se è già passato da bianco a nero conta, altrimenti resetta la temporanea
                lung_black = lung_black + lung_temp_black;
                num_dots = num_dots + 1;
                lung_temp_black = 0;
            else
                lung_temp_black = 0;
            end
        end

        if(fronte_n && num_dots>0) %spazio tra due bottoni, non contano le code, perchè la coda all'inizio (num_dots=0) mentre quella finale non conta perchè non incontra il fronte negativo
            lung_white = lung_white + lung_temp_white;
            lung_temp_white = 0;
        end 
       %Unico problema, se poi avessi una coda alla fine?

        if(fronte_p) %Se passa da nero a bianco resetta i fronti
            fronte_n = false;
            fronte_p = false;
        end

        actual_dot = line_p(i);
    end
    
    if(num_dots > 0)
        dots_size = lung_black / num_dots;
    else
        dots_size = 0; 
    end

    if(num_dots>1)
        white_space = lung_white/(num_dots-1);
    else
        white_space = -1; % No sense se c'è solo un bottone o zero
    end

%0 nero
%255 bianco 
%attento alle code, fai controllo dot coi booleani (salita e discesa)
