%%
clear all; 
%%
load('Batch1.mat');
PlotMain(cellData,2,0.001,10) % Change mode, panic level and visibility
                              % Consult Paramters.txt
%%
load('Batch2.mat');
PlotMain(cellData,2,0.005,10) % Change mode, panic level and visibility
                              % Consult Paramters.txt
%%
load('Batch3.mat');
PlotMain(cellData,1,0.005,10) % Change mode, panic level and visibility
                              % Consult Paramters.txt
% ------------------------------------------------------------------------
%%                              
load('Batch4.mat');
PlotMain(cellData,2,0.001,5) % Change mode, panic level and visibility
                              % Consult Paramters.txt
%%
load('Batch5.mat');
PlotMain(cellData,2,0.005,5) % Change mode, panic level and visibility
                              % Consult Paramters.txt
%%
load('Batch6.mat');
PlotMain(cellData,1,0.005,5) % Change mode, panic level and visibility
                              % Consult Paramters.txt

% ------------------------------------------------------------------------
%%
load('Batch7.mat');
PlotMain(cellData,2,0.001,15) % Change mode, panic level and visibility
                              % Consult Paramters.txt
%%
load('Batch8.mat');
PlotMain(cellData,2,0.005,15) % Change mode, panic level and visibility
                              % Consult Paramters.txt
%%
load('Batch9.mat');
PlotMain(cellData,2,0.001,15) % Change mode, panic level and visibility
                              % Consult Paramters.txt

% ------------------------------------------------------------------------
%%                              
load('Batch10.mat');
PlotMain(cellData,2,0.001,10) % Number of agents = 1000
%%
load('Batch11.mat');
PlotMain(cellData,2,0.005,10) % Number of agents = 1000

%%
load('Batch12.mat');
PlotMain(cellData,1,0.005,10) % Number of agents = 1000
 
% ------------------------------------------------------------------------
%%                              
load('Batch13.mat');
PlotMain(cellData,2,0.001,10) % Number of agents = 750

%%                             
load('Batch14.mat');
PlotMain(cellData,2,0.005,10) % Number of agents = 750

%%                             
load('Batch15.mat');
PlotMain(cellData,1,0.005,10) % Number of agents = 750