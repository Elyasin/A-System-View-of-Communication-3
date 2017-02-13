tx_msg = 'Hello!';           % text message to be transmitted

p_loss = 0.4;         % error probability
d_min = 2;            % minimum delay in unit of time-slot
d_max = 5;            % maximum delay
time_out = 30;        % time out

tx_bs = text2bitseq(tx_msg);          % convert the message to a bit sequence
send_packet_list = packetize(tx_bs);  % list of packets to be sent
num_packets = size(send_packet_list,1);% total number of packets
receiver_packet_list = [];            % list of received packets

% initialize the transport layer parameters
start_transport(p_loss, d_min, d_max);

% send first packet
send_packet_num = 1;          % index of packet to send
packet = send_packet_list(send_packet_num,:);
sender_send_packet(packet);
resetTimeout(time_out); % reset timeout timer
step_transport();

run  = true; % set to false when the whole message has been sent
while run,
    
    % % % % sender % % % %
    % execute one iteration of sender
    send_packet_num = sender_stopwait2(send_packet_list,send_packet_num,time_out);
        
    % execute one iteration of receiver
    receiver_packet_list = receiver_stopwait(receiver_packet_list);    
      
    % execute one iteration of transport layer
    if step_transport() || send_packet_num== (num_packets+1),
        % stop because max number of iterations reached or
        % all the packets have been sent
        run = false;
    end
end

% the number of packet correctly sent is equal to
% the index of the next packet to be sent minus one
noSentPackets = send_packet_num - 1; 
display (['Simulation Time: ' num2str(getSimTime())]);
display (['Numb. of packets sent correctly: ' num2str(noSentPackets )]);

% remove duplicated packets
%receiver_packet_list = filterPacketList(receiver_packet_list);
rx_msg = reconstruct_msg(receiver_packet_list)

% plot the traffic in the network
if noSentPackets>0
    transmission_display();
end
