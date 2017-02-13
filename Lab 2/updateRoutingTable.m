function RT_self = updateRoutingTable(linked, cost, RT_linked, RT_self)
% UPDATEROUTINGTABLE updates the routing table (RT_SELF) of a node given the 
%    routing table (RT_LINKED) broadcasted by a linked node (LINKED) .
%  RT_SELF = UPDATERT(LINKED, COST, RT_LINKED, RT_SELf) has four inputs:
%    linked   : index of the linked node (between 1 and n, 
%               where n is the size of the routing table)
%    cost     : cost of the connection between the linked node and the node itself
%    RT_linked: routing table of the linked node
%    RT_self  : routing table of the node itself.
%  UPDATEROUTINGTABLE uses the cost and the routing table of the linked node to update its own
%    routing table, which is returned as an output.

% number of nodes in the network
n_nodes = size(RT_self,1); 

% update the routing table of the node n
for k=1:n_nodes     
  
    % % % % Revise the following code   % % % %  

    if RT_self(k,2) > cost + RT_linked(k,2)
        RT_self(k,1) = linked;
        RT_self(k,2) = cost + RT_linked(k,2);
    end
  
    % % % % Do not change the code below % % % % 
end          

end