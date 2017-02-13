n_users = 4;
load('frames.mat'); % load the matrix frames
result = zeros(size(frames,1),3);

for i=1:size(frames,1)
    %% code
    frame = frames(i,:);
    
    %
    % % % % Revise the following code   % % % %
    %
    
    % check the received message
   
    % check if the checksum of the datagram is zero
    rx_checksum = ones(1,4);
    for index=1:4
        parity = mod(frame(index) + frame(index+4) + frame(index+8) + frame(index+12), 2);
        rx_checksum(index) = parity;
    end;
    cs_ok =  isequal(rx_checksum,zeros(1,4));
        
    % check the preamble
    rx_preamble = frame(1:4);
    pre_ok = isequal(rx_preamble, [1 0 1 0]);
        
    %check if the id is between 1 and n_users, both inclusive
    id =bin2num(frame(5:8));
    if id>0 && id<=n_users
        id_ok = 1;
    else
        id_ok = 0;
    end;
        
    % check the whole frame (valid if the above three parts are all valid)
    frame_ok = cs_ok && pre_ok && id_ok;
    if not (frame_ok == 0)
        frame_ok = 1;
    end;

    %
    % % % % Do not change the code below % % % %
    %
    
    result(i,1) = cs_ok;
    result(i,2) = pre_ok;
    result(i,3) = id_ok;
    result(i,4) = frame_ok;
end
display(['Correct preamble: ' num2str(sum(result(:,1))) '/' num2str(size(frames,1))]);
display(['Correct id:       ' num2str(sum(result(:,2))) '/' num2str(size(frames,1))]);
display(['Correct checksum: ' num2str(sum(result(:,3))) '/' num2str(size(frames,1))]);
display(['Correct frames: ' num2str(sum(result(:,4))) '/' num2str(size(frames,1))]);
