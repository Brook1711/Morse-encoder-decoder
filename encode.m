clear all;
clc;
chargeOption=input('From file(1), Write text(2):');
if chargeOption == 2
    text=input('Text to encode: ','s');
    text=strrep(text,' ','');
    fileKeyid=fopen('key.txt');
onlyL=onlyLetters(text);
    if onlyL==-1
        disp('Only letters');
        return;
    end
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
        newL=letterValue(textEncripted(i))+letterValue(key(j));
        if(newL>26)
            newL=newL-26;
        end
        textEncripted(i)=newL+96;
        j=+1;
 
    end
    elseif chargeOption==1
    fileTxId=fopen('mensaje.txt');
    textEncripted=fgets(fileTxId);
else
    disp('Invalid option');
    return; 
end
    disp('text encripted:');
    disp(textEncripted);
    fileTxtId=fopen('mensaje.txt','w');
    fprintf(fileTxtId,textEncripted);
    data=textEncripted;
    morseencoder(data,'mensaje.wav');



