clc
weights = [-0.00031,-0.00369,-0.00174,0.00255,0.00497,0.05571];
size_gy = size(gy521);
looping_size = size_gy(1);
learning_rate = 0.01;
for x=1:(looping_size-1)
    summation = 0;
    for y=1:6
        summation = summation + (weights(y)*gy521{x,y+1});
    end
    %summation
    if (summation<=0)
        calculated_output = 0;
        output_to_be_used = -1;
    else
        calculated_output = 1;
        output_to_be_used = 1;
    end
    desired_output = gy521{x,8};
    %calculated_output, desired_output
    if (calculated_output~=desired_output)
        %disp('here');
        for z=1:6
            weights(z) = weights(z) + (learning_rate*(desired_output-output_to_be_used))*gy521{x,z+1};
        end
    end
    %weights
end
weights