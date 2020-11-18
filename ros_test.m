%This line is to reset the connection
rosshutdown;
%This line connects matlab to the ROS network running on 142.66.213.196,
%this will be computer that the speech recognition is running on
%142.66.210.103 is the IP that matlab/simulink will be running on
%NOTE: DO NOT use localhost as the master needs to know the IP of the
%computer running simulink/matlab
rosinit('142.66.213.196', 'NodeHost','142.66.210.103','NodeName','/test_node')
%This subscribes to the custom ROS Topic and returns the custom messages
%created by the speech reconition
sub = rossubscriber('/rero_nlu/intent', 'rero_nlu/Intent', 'DataFormat','struct');
pause(1);

%This loop runs infinitely and returns ROS messages from the subscribed
%topic and then displays them
while true
    msg1 = receive(sub,1000);
    disp(msg1)
end
