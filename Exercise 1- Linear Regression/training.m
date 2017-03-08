clear ; close all; clc

fprintf("reading data ....\n")
data = load("ex1data1.txt");


x = data (:,1);
y = data (:,2);
m = length(y)
