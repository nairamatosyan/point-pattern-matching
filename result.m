function result(errors)


Letters = {'E'; 'A'; 'O'; 'Y'; 'Z'; 'M';'Q'};
%Give output by table form
Errors= [errors(1);errors(2);errors(3);errors(4);errors(5);errors(6);errors(7)];
T=table(Letters, Errors);
disp(T);

%find min error among all errors, and assign corresponding letter to be the best
%match of testing letter
fprintf(' The best matching pattern is: ' );
 for i= 1: length(Errors)
     
    if(min(errors)==errors(i))
        disp(Letters{i});
    end
    
end


end

