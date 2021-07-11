%% Train AC Agent to Swing Up and Balance Pendulum
% 
% 
mdl = 'rlSimplePendulumModel';
open_system(mdl)

%% Create Environment Interface
% Create a predefined environment interface for the pendulum.

env = rlPredefinedEnv('SimplePendulumModel-Discrete')

env.ResetFcn = @(in)setVariable(in,'theta0',pi,'Workspace',mdl);
%% 
% Specify the simulation time |Tf| and the agent sample time |Ts| in seconds
Ts = 0.05;
Tf = 20;

%% 
% Fix the random generator seed for reproducibility.
obsInfo = getObservationInfo(env);
actInfo = getActionInfo(env);

rng(0)
%% Create AC Agent

criticNetwork = [
    featureInputLayer(3,'Normalization','none','Name','state')
    fullyConnectedLayer(32,'Name','CriticStateFC1')
    reluLayer('Name','CriticRelu1')
    fullyConnectedLayer(1, 'Name', 'CriticFC')];

criticOpts = rlRepresentationOptions('LearnRate',1e-2,'GradientThreshold',1);

critic = rlValueRepresentation(criticNetwork,obsInfo,'Observation',{'state'},criticOpts);
%% 
actorNetwork = [
    featureInputLayer(3,'Normalization','none','Name','state')
    fullyConnectedLayer(32, 'Name','ActorStateFC1')
    reluLayer('Name','ActorRelu1')
    fullyConnectedLayer(3,'Name','action')];

actorOpts = rlRepresentationOptions('LearnRate',1e-2,'GradientThreshold',1);

actor = rlStochasticActorRepresentation(actorNetwork,obsInfo,actInfo,...
    'Observation',{'state'},actorOpts);
%%
agentOpts = rlACAgentOptions(...
    'NumStepsToLookAhead',32,...
    'EntropyLossWeight',0.01,...
    'DiscountFactor',0.99);
%% 
agent = rlACAgent(actor,critic,agentOpts);
%% Train Agent

trainOpts = rlTrainingOptions(...
    'MaxEpisodes',200,...
    'MaxStepsPerEpisode', 500,...
    'Verbose',false,...
    'Plots','training-progress',...
    'StopTrainingCriteria','AverageReward',...
    'StopTrainingValue',500,...
    'ScoreAveragingWindowLength',10); 

%% 
doTraining = true;

if doTraining    
    % Train the agent.
    trainingStats = train(agent,env,trainOpts)
else
    % Load pretrained agent for the example.
    load('SimulinkPendulumDQN.mat','agent');
end

%% Simulate AC Agent

simOptions = rlSimulationOptions('MaxSteps',500);
experience = sim(env,agent,simOptions);
totalReward = sum(experience.Reward)
