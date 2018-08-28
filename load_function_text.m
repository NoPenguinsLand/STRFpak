function out = load_function_text(function_name);
function_path = which(function_name);
%function_path
newStr = function_path(1,1:8);
if newStr == 'built-in'
    function_path = extractBetween(function_path,'(',')');
    function_path = function_path{1,1};
end
%function_path
fid = fopen(function_path);
if fid > 0
    out = char(fread(fid,inf,'char')');
    fclose(fid);
else
    out = function_name;
end
