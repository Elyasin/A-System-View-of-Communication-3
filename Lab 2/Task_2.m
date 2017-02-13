graph = [ 0 2 5 1 inf inf;
          2 0 3 2 inf inf;
          5 3 0 3 1 5;
          1 2 3 0 1 inf;
          inf inf 1 1 0 2;
          inf inf 5 inf 2 0];

% number of nodes in the network
N = size(graph,1);

% loop over all nodes
for node = 1:N,
    [neighbors, cost, RT]=initRoutingTable(graph,node);
    disp(['For node ' num2str(node) ':']);
    disp(['The neighbors are [ ' num2str(neighbors') ' ]']);
    disp(['The costs are [ ' num2str(cost') ' ]']);
    disp(['The routing table is:']);
    disp(RT)
end

