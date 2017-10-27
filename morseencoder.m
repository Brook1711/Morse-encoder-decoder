function morseencoder(text,filename)
Fs=1500;
load wav;
Dit=wavread('dit.wav');
Dah=wavread('line.wav');
ssp = wav(2121:3133);
lsp = wav(6176:12022);
morsecode=ssp;
A = [Dit;ssp;Dah];
B = [Dah;ssp;Dit;ssp;Dit;ssp;Dit];
C = [Dah;ssp;Dit;ssp;Dah;ssp;Dit];
D = [Dah;ssp;Dit;ssp;Dit];
E = [Dit];
F = [Dit;ssp;Dit;ssp;Dah;ssp;Dit];
G = [Dah;ssp;Dah;ssp;Dit];
H = [Dit;ssp;Dit;ssp;Dit;ssp;Dit];
I = [Dit;ssp;Dit];
J = [Dit;ssp;Dah;ssp;Dah;ssp;Dah];
K = [Dah;ssp;Dit;ssp;Dah];
L = [Dit;ssp;Dah;ssp;Dit;ssp;Dit];
M = [Dah;ssp;Dah];
N = [Dah;ssp;Dit];
O = [Dah;ssp;Dah;ssp;Dah];
P = [Dit;ssp;Dah;ssp;Dah;ssp;Dit];
Q = [Dah;ssp;Dah;ssp;Dit;ssp;Dah];
R = [Dit;ssp;Dah;ssp;Dit];
S = [Dit;ssp;Dit;ssp;Dit];
T = [Dah];
U = [Dit;ssp;Dit;ssp;Dah];
V = [Dit;ssp;Dit;ssp;Dit;ssp;Dah];
W = [Dit;ssp;Dah;ssp;Dah];
X = [Dah;ssp;Dit;ssp;Dit;ssp;Dah];
Y = [Dah;ssp;Dit;ssp;Dah;ssp;Dah];
Z = [Dah;ssp;Dah;ssp;Dit;ssp;Dit];
enie = [Dah;ssp;Dah;ssp;Dit;ssp;Dit];
period = [Dit;ssp;Dah;ssp;Dit;ssp;Dah;ssp;Dit;ssp;Dah];
comma = [Dah;ssp;Dah;ssp;Dit;ssp;Dit;ssp;Dah;ssp;Dah];
question = [Dit;ssp;Dit;ssp;Dah;ssp;Dah;ssp;Dit;ssp;Dit];
slash_ = [Dah;ssp;Dit;ssp;Dit;ssp;Dah;ssp;Dit];
n1 = [Dit;ssp;Dah;ssp;Dah;ssp;Dah;ssp;Dah];
n2 = [Dit;ssp;Dit;ssp;Dah;ssp;Dah;ssp;Dah];
n3 = [Dit;ssp;Dit;ssp;Dit;ssp;Dah;ssp;Dah];
n4 = [Dit;ssp;Dit;ssp;Dit;ssp;Dit;ssp;Dah];
n5 = [Dit;ssp;Dit;ssp;Dit;ssp;Dit;ssp;Dit];
n6 = [Dah;ssp;Dit;ssp;Dit;ssp;Dit;ssp;Dit];
n7 = [Dah;ssp;Dah;ssp;Dit;ssp;Dit;ssp;Dit];
n8 = [Dah;ssp;Dah;ssp;Dah;ssp;Dit;ssp;Dit];
n9 = [Dah;ssp;Dah;ssp;Dah;ssp;Dah;ssp;Dit];
n0 = [Dah;ssp;Dah;ssp;Dah;ssp;Dah;ssp;Dah];
enie=[Dah;ssp;Dah;ssp;Dit;ssp;Dah;ssp;Dah];
text = upper(text);
vars ={'period','comma','question','slash_'};
morsecode=[];
for i=1:length(text)
    if text(i)=='Ñ'||text(i)=='ñ';
        morsecode=[morsecode;[Dah;ssp;Dah;ssp;Dit;ssp;Dah;ssp;Dah]];
    elseif isvarname(text(i))
    morsecode = [morsecode;eval(text(i))];
    elseif ismember(text(i),'.,?/')
        x = findstr(text(i),'.,?/');
        morsecode = [morsecode;eval(vars{x})];
    elseif ~isempty(str2num(text(i)))
        morsecode = [morsecode;eval(['n' text(i)])];
    elseif text(i)==' '
        morsecode = [morsecode;ssp;ssp;ssp];
    end
    morsecode = [morsecode;lsp];
end
%morsecode=resample(morsecode,Fs,1500);
audiowrite(filename,morsecode,8000);
%plot (morsecode);
