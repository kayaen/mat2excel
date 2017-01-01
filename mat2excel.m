addpath('Data');
folder  = [pwd '\Data'];   
list    = dir(fullfile(folder, '*.m'));
for(i=1:1:length(list))
    run(list(i).name);
end

kisi_num = input('number of person to investigate');%1;       %incelenecek kisi sayisini girin [1den 13e kadar]
har_num = input('number of movement to investigate'); %1;        %incelenecek hareket sayisini girin [1den 7ye kadar]
A=[]; 
disp('Select the persons');%***simdi yazdiginiz kisi sayisi kadar kisileri numara olarak secin, daha sonra hareketleri sececeksiniz
kisiler = {'ahat'; 'edca'; 'enka'; 'erev'; 'erka'; 'erkap'; 'erto'; 'haka'; 'mcoz'; 'meoz'; 'muer'; 'okul'; 'shev'};
disp('Select the movements'); %simdi hareketleri secin
hareketler = {'repo'; 'point'; 'hook'; 'pinch'; 'oppo'; 'tip'; 'cylin'};
if kisi_num==0;
    inp_1='';
else 
    for(i=1:1:kisi_num)
        inp_kisi(i)= input('1.ahat 2.edca 3.enka 4.erev 5.erka 6.erkap 7.erto 8.haka 9.mcoz 10.meoz 11.muer 12.okul 13.shev \n Kisi no girin: ');
        inp_1{i}=kisiler{inp_kisi(i)};            
    end
end

if har_num ==0;
    inp_2='';    
else
    for(i=1:1:har_num)
        inp_har(i)= input('1.repo 2.point 3.hook 4.pinch 5.oppo 6.tip 7.cylin \nHareket adini girin: ');
        inp_2{i}=hareketler{inp_har(i)};
    end
end

for(i=1:1:kisi_num)
    for(j=1:1:har_num)                      
        sv=[inp_1{i} '*' inp_2{j}];         %kisi ve hareket adina bagli olarak ilgili arama degiskeni olusturulur.
        gerekli_var=who(sv);                   % arama yapilir (ornegin enka*repo aramasi tum setlerde vardir)
        size_var=size(gerekli_var);         % arama sonucunun uzunlugu alinir (setlerde toplam kac tane enka*repo var)
        for(t=1:1:size_var(1))            
            A = [A; eval(gerekli_var{t})];
        end
        fname = [inp_1{i} '_' inp_2{j} '.xlsx'];
        xlswrite(fname,A)
        A = [];
    end
end

