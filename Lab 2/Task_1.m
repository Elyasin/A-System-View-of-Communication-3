% parameters
timeout = 5;
start_node_list = [1 1 1 1 1 2 2 2 2 3 3 3 4 4 5];
dest_node_list  = [2 3 4 5 6 3 4 5 6 4 5 6 5 6 6];
path = zeros(length(start_node_list),timeout);

% load the routing table
load RT.mat

% loop over all source/dest pairs
for pcount = 1:length(start_node_list)
    start_node = start_node_list(pcount); % set the start node
    dest_node = dest_node_list(pcount);   % set the destination node
   
    %initialize the current node and the time
    time = 0;
    curr_node= start_node;
    % main loop to find the path
    while curr_node>0  && time<timeout;
        time = time+1;
        path(pcount,time) =  curr_node;
    
        % % % % Revise the following code   % % % %
        % update the current node
    
        curr_node = RT{curr_node}(dest_node,1);

        % % % % Do not change the code below % % % %
    
    end
end
%display the paths
path