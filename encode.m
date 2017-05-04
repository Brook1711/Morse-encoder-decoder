clear all;
clc;
chargeOption=input('From file(1), Write text(2):');
if chargeOption == 2
    fileKeyid=fopen('key.txt');
    text=input('Text to encode: ','s');
    key=fgets(fileKeyid);
    j=1;
    textEncripted=text;
    disp(key(1));
    h='a'+'a';
    disp(h);
    for i=1:length(text)
        if j>length(key)
            j=1;
        end
        newV=vowelValue(textEncripted(i))+vowelValue(key(j));
        if(newV>26)
            newV=newV-26;
        end
        textEncripted(i)=newV+96;
        j=+1;
    end
    disp('text encripted:');
    disp(textEncripted);
    fileTxtId=fopen('mensaje.txt','w');
    fprintf(fileTxtId,textEncripted);
    data=textEncripted;
    morseencoder(data,'mensaje.wav');
elseif chargeOption==1
    fileTxtId=fopen('mensaje.txt');
    data=fgets(fileTxtId);
    morseencoder(data,'mensaje.wav');
else
    disp('Invalid option');
    
end


