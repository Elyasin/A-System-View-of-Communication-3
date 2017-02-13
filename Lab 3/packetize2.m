function packets = packetize2(bs)
%PACKETIZE   separate bit sequence into packets
%   PACKETS = PACKETIZE(BS) separates BS into 24 bit packets, where each
%   packet has the format
%       [PACKET_NUM  LAST_PACKET  DATA]
%           PACKET_NUM = 8 bit number indicated packet order number (starts
%               from one)
%           LAST_PACKET = 8 bit number indicating packet number of last
%               packet (number of packets)
%           DATA = 8 bit data from BS
%   If BS is longer than 8*255, then it is truncated.  If BS is not a
%   multiple of 8, the last set of bits are discarded.
%   PACKETS is a TOTAL_PACKETS by 24 array

% % % % Revise the following code   % % % %

n = floor(length(bs)/8);
packets = zeros(n,24);
for i=1:n
    packets(i,:) = [dec2binvec(i) dec2binvec(n) bs(i*8-7:i*8)];
end;

% % % % Do not change the code below % % % %

end