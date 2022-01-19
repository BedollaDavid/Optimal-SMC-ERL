function st = rand_name()


symbols = ['A':'Z'];
st=[];
 MAX_ST_LENGTH = 2;
while(length(st) < MAX_ST_LENGTH)
 stLength = randi(MAX_ST_LENGTH);
 nums = randi(numel(symbols),[1 stLength]);
 st = symbols (nums);
end

st1=st;

symbols = ['a':'z'];
st=[];
 MAX_ST_LENGTH = 2;
while(length(st) < MAX_ST_LENGTH)
 stLength = randi(MAX_ST_LENGTH);
 nums = randi(numel(symbols),[1 stLength]);
 st = symbols (nums);
end

st2=st;


symbols = ['0':'9'];
st=[];
 MAX_ST_LENGTH = 2;
while(length(st) < MAX_ST_LENGTH)
 stLength = randi(MAX_ST_LENGTH);
 nums = randi(numel(symbols),[1 stLength]);
 st = symbols (nums);
end
st=[st1 st st2];

end