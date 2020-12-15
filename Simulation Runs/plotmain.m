%%
clear all; 
%%
load('Batch1.mat');
PlotSimulation(cellData,2,0.001,10) % Change mode, panic level and visibility
                              % Consult Paramters.txt
%%
load('Batch2.mat');
PlotSimulation(cellData,2,0.005,10) % Change mode, panic level and visibility
                              % Consult Paramters.txt
%%
load('Batch3.mat');
PlotSimulation(cellData,1,0.001,10) % Change mode, panic level and visibility
                              % Consult Paramters.txt
% ------------------------------------------------------------------------
%%                              
load('Batch4.mat');
PlotSimulation(cellData,2,0.001,5) % Change mode, panic level and visibility
                              % Consult Paramters.txt
%%
load('Batch5.mat');
PlotSimulation(cellData,2,0.005,5) % Change mode, panic level and visibility
                              % Consult Paramters.txt
%%
load('Batch6.mat');
PlotSimulation(cellData,1,0.001,5) % Change mode, panic level and visibility
                              % Consult Paramters.txt

% ------------------------------------------------------------------------
%%
load('Batch7.mat');
PlotSimulation(cellData,2,0.001,15) % Change mode, panic level and visibility
                              % Consult Paramters.txt
%%
load('Batch8.mat');
PlotSimulation(cellData,2,0.005,15) % Change mode, panic level and visibility
                              % Consult Paramters.txt
%%
load('Batch9.mat');
PlotSimulation(cellData,1,0.001,15) % Change mode, panic level and visibility
                              % Consult Paramters.txt

% ------------------------------------------------------------------------
%%                              
load('Batch10.mat');
PlotSimulation(cellData,2,0.001,10) % Number of agents = 1000
%%
load('Batch11.mat');
PlotSimulation(cellData,2,0.005,10) % Number of agents = 1000

%%
load('Batch12.mat');
PlotSimulation(cellData,1,0.001,10) % Number of agents = 1000
 
% ------------------------------------------------------------------------
%%                              
load('Batch13.mat');
PlotSimulation(cellData,2,0.001,10) % Number of agents = 750

%%                             
load('Batch14.mat');
PlotSimulation(cellData,2,0.005,10) % Number of agents = 750

%%                             
load('Batch15.mat');
PlotSimulation(cellData,1,0.001,10) % Number of agents = 750