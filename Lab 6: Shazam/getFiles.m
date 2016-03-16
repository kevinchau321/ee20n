function files = getFiles(dirname)
%gets all the wav files in a directory and returns them in a cell array
%called 'files'

search = strcat(dirname,'/*.wav');
files = dir( search );
files = struct2cell(files);
files = files(1,:);
c = {dirname};
files = strcat( c, '/',files);