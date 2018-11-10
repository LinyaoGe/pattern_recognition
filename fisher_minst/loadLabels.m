function labels = loadLabels(filename)
    fp = fopen(filename, 'rb');
    magic = fread(fp, 1, 'int32', 0, 'ieee-be');
    numLabels = fread(fp, 1, 'int32', 0, 'ieee-be');
    labels = fread(fp, inf, 'unsigned char');
    
    fclose(fp);
end