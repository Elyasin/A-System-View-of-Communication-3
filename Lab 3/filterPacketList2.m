function filtered_list = filterPacketList2(list)
% FILTERPACKETLIST remove duplicated packets from the packet list
%
%   [FILTERED_LIST] = FILTERPACKETLIST(LIST) receives a packet list (LIST)
%       and return a revised list without duplicated packets (FILTERED LIST)

    
% % % % Revise the following code   % % % 

filtered_list = [];
npacket = size(list,1);

for c=1:npacket;
    packet = list(c,:);
    seq_num = binvec2dec(packet(1:8));
    if c == 1
        filtered_list = [filtered_list; packet];
    else
        if binvec2dec(filtered_list(end,end-23:end-16)) ~= seq_num
            filtered_list = [filtered_list; packet];
        end;
    end;
end
    
    % % % % Do not change the code below % % % %

end
