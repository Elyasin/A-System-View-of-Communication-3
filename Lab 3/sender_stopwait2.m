function send_packet_num = sender_stopwait(send_packet_list,...
    send_packet_num,time_out)
% SENDER_STOPWAIT execute one step of the stop and wait protocol 
%   
%   SEND_PACKET_NUM = SENDER_STOPWAIT(SEND_PACKET_LIST,...
%                                     SEND_PACKET_NUM, TIME_OUT)
%   Inputs:
%       SEND_PACKET_LIST: list of the packets to be sent
%       SEND_PACKET_NUM: index of packet waiting to be acknowledged
%       TIME_OUT: length of the time out
%
%   The sender checks whether the timeout has expired or an 
%   acknowledgement has been received. If the timeout has expired, it
%   should resend packet SEND_PACKET_NUM. If the an acknolwedgement is
%   received, the sender checks whether the acknowledgement is for packet
%   SEND_PACKET_NUM, and if so, increments SEND_PACKET_NUM and sends the 
%   next packet.
%
%   The number of packets successfuly sent is equal to SEND_PACKET_NUM-1. 
%   All the packets have been sent when SEND_PACKET_NUM is greater than 
%   the length of SEND_PACKET_LIST.

% If the timeout has expired, set send equal to true.
send = timeoutExpired();

% check for acknowledgement of previous packet
% send_ack is empty if no acknowlegment has been received
send_ack = sender_get_ack();

% % % % Revise the following code % % % %

if ~isempty(send_ack)
    ack_num = binvec2dec(send_ack);
    if ack_num == send_packet_num,
        % successful package reception, send next packet
         send_packet_num = send_packet_num + 1;
        send = true;
    end
end

% % % % Do not change the code below % % % %

% send a new packet if there are still packets
if send && (send_packet_num <= size(send_packet_list,1))
    packet = send_packet_list(send_packet_num,:);
    sender_send_packet(packet);
    resetTimeout(time_out); % reset timeout timer
end

end