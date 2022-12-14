function  minimization( letter)
 
syms a b r1 r2;

%These are the letters among which new coming character will be searched
E=[10	11	11	11	11	11	11	11	10	9	8	7	6	5	4	3	2	2	2	2	2	2	2	2	2	2	2	2	3	4	5	6	7	8	9	10	11	12	13	14	15	16	17	18	19	20	21	21	21	21	21	21	21	21	21	21	21	20	19	18;
   13	14	15	16	17	18	19	20	21	22	23	24	24	24	23	22	21	20	19	18	17	16	15	14	13	12	11	10	9	8	7	7	7	7	7	7	7	7	7	7	7	7	7	8	9	10	11	12	13	14	15	16	17	18	19	20	21	22	23	24];


A=[6	5	4	4	4	4	4	4	4	4	4	5	6	7	8	9	10	11	12	13	14	15	16	17	18	19	20	21	21	21	21	21	21	21	21	21	21	20	19	18	17	16	15	14	13	12	11	10	9	8	18	19	20	21	21	21	21	20	19	18;
   23	22	21	20	19	18	17	16	15	14	13	12	11	10	9	8	7	7	7	7	7	7	7	7	7	8	9	10	11	12	13	14	15	16	17	18	19	20	21	22	23	23	23	23	23	23	23	23	23	23	24	25	26	27	28	29	30	31	31	31];

O=[18	17	16	15	14	13	12	11	10	9	8	7	7	7	7	7	7	7	7	7	7	7	7	7	8	9	10	11	12	13	14	15	16	17	18	19	20	21	22	23	24	25	26	27	27	27	27	27	27	27	27	27	27	27	27	26	25	24	23	22;
   4	4	4	4	4	4	4	4	5	6	7	8	9	10	11	12	13	14	15	16	17	18	19	20	21	22	23	24	24	24	24	24	24	24	24	24	24	24	24	24	23	22	21	20	19	18	17	16	15	14	13	12	11	10	9	8	7	6	5	4];


Y = [7	7	7	7	7	7	7	7	7	7	7	7	8	9	10	11	12	13	14	15	16	17	18	19	20	21	21	21	21	21	21	21	21	21	21	21	21	21	21	21	21	21	21	21	21	21	21	21	20	19	18	17	16	15	14	13	12	11	10	9;
     1	2	3	4	5	6	7	8	9	10	11	12	13	14	15	16	16	16	16	16	16	16	15	14	13	13	12	11	10	9	8	7	6	5	4	3	2	1	14	15	16	17	18	19	20	21	22	23	24	25	25	25	25	25	25	25	25	25	24	23];

Z = [7	8	9	10	11	12	13	14	15	16	17	18	19	20	21	22	23	24	25	26	27	26	25	24	23	22	21	20	19	18	17	16	15	14	13	12	11	10	9	8	9	10	11	12	13	14	15	16	17	18	19	20	21	22	23	24	25	26	27	28;
     6	6	6	6	6	6	6	6	6	6	6	6	6	6	6	6	6	6	6	6	6	7	8	9	10	11	12	13	14	15	16	17	18	19	20	21	22	23	24	25	25	25	25	25	25	25	25	25	25	25	25	25	25	25	25	25	25	25	25	25];

M = [2	2	2	2	2	2	2	2	2	2	2	2	2	2	3	4	5	6	7	8	9	10	11	12	13	14	14	14	14	14	14	14	14	14	14	14	15	16	17	18	19	20	21	22	23	24	25	26	27	28	28	28	28	28	28	28	29	30	31	31;
     23	22	21	20	19	18	17	16	15	14	13	12	11	10	12	11	10	10	10	10	10	10	10	11	12	12	13	14	15	16	17	18	19	20	21	22	12	11	10	10	10	10	10	10	10	10	11	12	13	14	15	16	17	18	19	20	20	20	20	19];

Q = [19	18	17	16	15	14	13	12	11	10	9	8	8	8	8	8	8	8	9	10	11	12	13	14	15	16	17	18	19	20	21	21	21	21	21	21	21	21	21	21	21	21	21	21	21	21	21	21	21	21	21	21	21	21	21	22	23	24	25	26;
     1	1	1	1	1	1	1	1	2	3	4	5	6	7	8	9	10	11	12	13	14	15	15	15	15	15	15	15	14	13	12	11	10	9	8	7	6	5	4	3	13	14	15	16	17	18	19	20	21	22	23	24	25	26	27	26	25	24	23	22];

%A big matrix, which itself contains matrices of each charater
P={E, A, O, Y, Z, M, Q};
%Initilize a vector filled with zeros, which will be filled with errors 
%for each character 
errors= zeros(1,length(P));


%for each pattern find the parameters minimizing the dissimilarity
for i =1 :length(P)
    
    % First, need to transform given  Pattern, thus need to find the
    %parameters

    %Matrix of zeros 2x60
    P_t=sym( zeros(2, size(P{i},2)));
    %predefine inverse matrix 
    H= sym(zeros(4,4));
    B = sym(zeros( 4 ,1));

    %filling final coefficcent matrices
    for j = 1: size(P{i},2)

       R_j = [ P{i}(1,j) -P{i}(2,j); P{i}(2,j) P{i}(1,j)];
       H=H+ [ R_j' *R_j  R_j' ; R_j eye(2)];
       B = B + [ R_j , eye(2)]' * letter(:, j);
       
    end

    %solution
    x_star = inv(H) *B;

    %taking minimizing parameters
    a= x_star(1);
    b= x_star(2);
    r1= x_star(3);
    r2 =x_star(4);

    %Rotation matrix
    T= [a -b; b a];
    %Translation matrix
    r= [r1;r2];

    %Finding transformed pattern 
    for j = 1: size(P{i},2)

        P_t(:,j)= T* P{i}(:,j)+r;

    end
    
    errors(i) =norm(P_t -letter, "fro");  

end

result(errors);
