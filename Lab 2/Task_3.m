% load neighbors,costs and RT
load RT_initial.mat

N = size(RT,1);      % nodes in the network
max_time = 3;        % number of iterations

% define node whose routing table to display
shownode = 1;
disp(['Initial routing table for node ' num2str(shownode) ':'])
disp(RT{shownode})

% simulate the broadcasting step for "max_time" iterations
for time=1:max_time
    % loop over all nodes in the network
    for n=1:N
        % for each node, loop over all neighbors
        for i=1:length(neighbors{n})

            % define the neighbor node index
            linked = neighbors{n}(i);
            
            % cost of the connection between node n and linked
            cost = costs{n}(i); 

            % update the routing table of node n using the routing table of 
            % the neighbor node and the cost of the connection
            RT{n} = updateRoutingTable(linked, cost, RT{linked}, RT{n});      
   
        end
    end
    % show the new routing table for one node
    disp(['Routing table for node ' num2str(shownode)...
        ' at time ' num2str(time) ':'])
    disp(RT{shownode})
end