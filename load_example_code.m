n = 1000;
max_steps = 1000000000;%
d = zeros(10000000,1);
for i = 1:10000000
[steps, totalS] = collatz(i,max_steps);
d(i,1) = totalS/steps;
end
plot(d)
[B,I] = sort(d,'ascend');   
db = abs(diff(I));
dd = diff(d(I(1:100000)));
plot(dd)	
hold on 
plot(db)
p = polyfit((1:length(db))',db,1);

mean(db)
function [steps, totalS] = collatz(n,max_steps)
  steps = 0;
  totalS = 0;
  no = n;
  start = 0;
  while n~=1
    % the collatz iteration
    if mod(n,2) == 0
      n = n/2;
    else
      n = 3*n + 1;
    end

    if start == 2
        totalS = totalS - (no-n);
    else
        start = start + 1;
        no = n;
    end
    steps=steps+1; % increment the steps counter.
    
    if (steps >= max_steps) && (n~=1) % have we gone too far?
      n = NaN;
      break
    end
  end
end

