%Name: Sienna Sacramento
%CS 560 Spring 2020
%Professor Hasan
%Assignment 1 Question 1
%This program compares the complexity of inesertion and merge sort 

clear;

%prompte user for input: array length n
%msg = 'Please enter array length n: ';
%n = input(msg);

n = [5,10,20,30,50];
insertTime = [0,0,0,0,0]; 
mergeTime = [0,0,0,0,0];

for x = 1: length(n)
    A = randi(100,n(x),1);

    timerVal = tic;
    tic
    %call insertion and merge sort
    A = insertion(A);
    toc
    insertTime(x) = toc;
    disp(insertTime); 
end

for x = 1: length(n)
    A = randi(100,n(x),1);

    timerVal = tic;
    tic
    %call insertion and merge sort
    A = mergeSort(A,1,length(A));
    toc
    mergeTime(x) = toc;
    disp(insertTime); 
end

plot(n,insertTime);

hold on

plot(n,mergeTime);

hold off

%insertion sort
function A = insertion(A)
    for j = 2: length(A)
        key = A(j);
        %insert A(j) into the sorted sequence A[1..j-1]
        i = j-1;
        while (i > 0 && A(i) > key)
            A(i+1) = A(i);
            i = i-1;
        end
        A(i+1) = key;
    end
end

%merge sort
function A = mergeSort(A,p,r)
    if p < r
        q = floor((p+r)/2);
        A = mergeSort(A,p,q);
        A = mergeSort(A,q+1,r);
        A = merge(A,p,q,r);
    end
end

%function merge
function A = merge(A, p, q, r)
    n1 = q - p + 1;
    n2 = r - q;
    L = [];
    R = [];
    
    for i = 1: n1
        L(i) = A(p+i-1);
    end
    for j = 1: n2
        R(j) = A(q+j);
    end
    
    L(n1+1) = 100;
    R(n2+1) = 100;
    
    i = 1;
    j = 1;
    for k = p: r
        if L(i) <= R(j)
        A(k) = L(i);
        i = i + 1;
        else
            A(k)= R(j);
            j = j + 1;
        end  
    end
end