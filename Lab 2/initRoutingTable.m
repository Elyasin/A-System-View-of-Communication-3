function [neighbors, cost, RT] = initRoutingTable(graph,node);
% INITROUTINGTABLE provides the neighbors, the connection cost and 
%                  the initial routing table of one node in a network 
% [NEIGHBORS, COST, RT] = INITROUTINGTABLE(GRAPH,NODE) receives two inputs
%    GRAPH is a NxN matrix that describes the network. 
%        GRAPH(i,j) is the connection cost between nodes i and j.
%    NODE is the index of the node.
%
%    It returns three variables:
%    NEIGHBORS contains the nodes that are directly linked to NODE.
%    COST contains the connection cost to each neighbor.
%    RT is the initial routing table of the node.
  
% number of nodes in the graph
N = size(graph,1);

% % % % Revise the following code   % % % %  
    
% find the neighbors
neighbors = find( graph(node,:) ~= inf & graph(node,:) > 0 )';
        
% find the connection cost of each neighbor
cost = graph(node, neighbors)';

% init the routing table (RT)
RT = [ zeros(N,1), repmat(inf,N,1)];
RT(node,:) = [0,0];
for i=1:size(neighbors)
    RT(neighbors(i),:) = [neighbors(i), cost(i)];
end;

             
% % % % Do not change the code below % % % %  
end