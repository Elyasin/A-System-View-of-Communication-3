tx_msg = 'Hello World!';           % text message to be transmitted

p_loss = 0.6;         % error probability
d_min = 2;            % minimum delay in unit of time-slot
d_max = 5;            % maximum delay
time_out = 10;        % time out

tx_bs = text2bitseq(tx_msg);           % convert the message to a bit sequence
send_packet_list = packetize(tx_bs);   % list of packets to be sent
num_packets = size(send_packet_list,1);% total number of packets
receiver_packet_list = [];             % list of received packets

% initialize the transport layer parametters
start_transport(p_loss, d_min, d_max);

% send first packet
send_packet_num = 1;          % index of packet to send
packet = send_packet_list(send_packet_num,:);
sender_send_packet(packet);
resetTimeout(time_out); % reset timeout timer
step_transport();

% iterate network 
run = true;
while run,

    % execute one iteration of sender
    send_packet_num = sender_stopwait(send_packet_list,send_packet_num,time_out);
    
    % execute one iteration of receiver
    receiver_packet_list = receiver_stopwait(receiver_packet_list);    
    
    % execute one iteration of transport layer
    if step_transport() || send_packet_num== (num_packets+1),
        % stop because max number of iterations reached or
        % all the packets have been sent
        run = false; 
    end
end
 
noSentPackets = send_packet_num - 1; % Number of packets sent and acknowledged
display (['Simulation Time: ' num2str(getSimTime())]);
display (['Number of packets sent correctly: ' num2str(noSentPackets )]);

% show message before filtering
rx_msg_1 = reconstruct_msg(receiver_packet_list);
display(['The message before filtering is: ' rx_msg_1]);

% show message after filtering
revised_packet_list = filterPacketList2(receiver_packet_list);
rx_msg_2 = reconstruct_msg(revised_packet_list);
display(['The message after filtering is: ' rx_msg_2]);

% plot the traffic in the network
if noSentPackets>0
    transmission_display();
end
