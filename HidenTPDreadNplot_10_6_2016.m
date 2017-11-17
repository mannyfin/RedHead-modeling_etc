clear;clc; clf; close all
%model the data to find energy?
modeldata = 1; %1 = true, 0 = false
compcoverage = 0; %compute the coverage 1 = true, 0 = false
warning off;
set(0,'defaultFigureVisible','off'); %dont show any figures
figure('Visible','off');
stupidshit =0;
tempmin = 120;
tempset= 350; %to what highest temperature value do you want to plot?

 %plot vs time?
 plottime = 0;
 plotcumsignals = 0; %0 = dont plot all signals on one graph (can be any value), 1= true

%custom folder path below for convenience. Change as necessary
% folderpath ='C:\Users\koelgrp.PRINCETON\Desktop\Manny\Manny HDO\Pt(100)\';
folderpath='C:\Users\koelgrp.PRINCETON\Desktop\re\New folder (2)\New folder (2)\';


[FileName,PathName,FilterIndex] = uigetfile([folderpath,'*.csv'], 'Select Hiden .csv file','MultiSelect', 'on');

 tic

z = 1;
% fid = fopen('aceticacidtpd_zerodoseView1.csv');
%This is the case where only 1 file is selected
if FilterIndex ==1 
    if ischar(FileName) ~= 0
    fid = fopen([PathName FileName]);
    singlefile = 1;
    else
       FileNamemat=[FileName];
        for z = 1:numel(FileName)
            fid(z) = fopen([PathName FileName{z}]);
            
        end
    end
else
    disp(sprintf('\nNo file selected\n'));
    toc
    return
end
 %This is the case for multiple files selected
for z = 1:numel(fid)
A = textscan(fid(z), '%s', 'Delimiter', '\t');

 B = strfind(A{1},'Time');
 
 for i = 1:length(B)
     C(i) = isempty(B{i});
 end
 D = find(C==0); %second element extracts Data
 
 names = A{1}(D(2));
 removequotes = strsplit(names{1}, '"'); %2x +1 elements
 %removing quotes
 
 %some programs have some (stupid) issue where the quotes are already
 %removed and the output looks like this: 'Time,ms,Temperature,Hydrogen,Oxygen-16,Water,Carbon m…'
 %lets separate based on the commas then. after line 50, however,
 %removequotes should be the same as names. This is how we can check and do
 %this if needed
 if numel(removequotes)==numel(names) %check
    stupidshit = 1;
     removequotes = strsplit(names{1}, ',');
     %output looks like this now:  'Time'    'ms'    'Temperature'
     %'Hydrogen' etc ...
     columnheaders = removequotes(1:end-1);
     
     for i = 1 :length(columnheaders)
%         columnheaders{i} = removequotes{2*i}; old line of code now copied
        spaced = strfind(columnheaders{i}, ' ');
        hyphened = strfind(columnheaders{i}, '-');
        for w = 1: length(spaced) %replacing spaces with underscores
            if isempty(spaced) == 0
            columnheaders{i}(spaced) = '_';
            end
        end
        for w = 1:length(hyphened)
            if isempty(hyphened) == 0
                columnheaders{i}(hyphened) = '_'; %replacing hyphens with underscores
            end
        end
        %if multiple masses are named the same
        repeatedname =strcmp(columnheaders(i), columnheaders);
        multiples = find(repeatedname(1:i-1)==1);
        multiples_add = 2; 
        if numel(multiples) == 1
            columnheaders{i} = strcat(columnheaders{i}, num2str(multiples_add));
            multiples_add = multiples_add +1;
        end
     end
        %change header from ms to Time
        columnheaders{2} = columnheaders{1}; 
 
        %this is custom and needs to be changed
        columnheaders{3} = 'Temperature'; 
        columnnames = [columnheaders(4:i)]; %just so that i dont get the 'extra legend entries'
        %when i plot the stacked data
        data =  A{1}(D(2)+1:end);
        %  mats = cell2mat(data);
        splitdata = strsplit(data{1});
        %  splitdata2 = strsplit(splitdata{1:end}, ',')
        splitdata2 = strfind(data, ',');
%         removecomma = [1 splitdata2{1}]; %ideally this works but we have stupid shit here
        for j = 1:length(data)
            for i = 1: (length(splitdata2{j})-1)%(length(removecomma)-1)
                removecomma = [1 splitdata2{j}];
                %transpose data at the same time
                newdatastuff{j,i,z} = data{j}(removecomma(i)+1:removecomma(i+1)-1);
                numdata{j,i,z}= str2double(newdatastuff{j,i,z});
            end
        end
     
 end
 
 

    if stupidshit ==0 %we dont take shit here
        for i = 1 :((length(removequotes)-1)/2)
            columnheaders{i} = removequotes{2*i};
            spaced = strfind(columnheaders{i}, ' ');
            hyphened = strfind(columnheaders{i}, '-');
            for w = 1: length(spaced) %replacing spaces with underscores
                if isempty(spaced) == 0
                    columnheaders{i}(spaced) = '_';
                end
            end
            for w = 1:length(hyphened)
                if isempty(hyphened) == 0
                    columnheaders{i}(hyphened) = '_'; %replacing hyphens with underscores
                end
            end
            %if multiple masses are named the same
            repeatedname =strcmp(columnheaders(i), columnheaders);
            multiples = find(repeatedname(1:i-1)==1);
            multiples_add = 2; 
            if numel(multiples) == 1
                columnheaders{i} = strcat(columnheaders{i}, num2str(multiples_add));
                multiples_add = multiples_add +1;
            end
        end
 
 %change header from ms to Time
 columnheaders{2} = columnheaders{1}; 
 
 %this is custom and needs to be changed
 columnheaders{3} = 'Temperature'; 
 columnnames = [columnheaders(4:i)]; %just so that i dont get the 'extra legend entries'
 %when i plot the stacked data
 data =  A{1}(D(2)+1:end);
%  mats = cell2mat(data);
 splitdata = strsplit(data{1});
%  splitdata2 = strsplit(splitdata{1:end}, ',')
splitdata2 = strfind(data, ',');
removecomma = [1 splitdata2{1}]; %ideally this works

    for i = 1:(length(removecomma)-1)
        for j = 1:length(data)
            %transpose data at the same time
            newdatastuff{j,i,z} = data{j}(removecomma(i)+1:removecomma(i+1)-1);
            numdata{j,i,z}= str2double(newdatastuff{j,i,z});
        end
    end
    end
end

% numdata = cell2mat(numdata);
% for z = 1:numel(fid)
% numdatatranspose(:,:,z) = numdata(2:i, 1:j,z)'; %transpose
% end
% numdatatranspose = numdata(2:i, 1:j,z)'; %transpose
for z = 1:numel(fid)
[idx1 idx2 idx3]=size(cell2mat(numdata(:,2:i,z)));
numdata2(1:idx1, 1:idx2, z) = zeros(idx1, idx2, idx3);

% numdata(1:j,1:i-1,z) = cell2mat(numdata(:,2:i,z)); %exclude first column which is NaN
numdata2(1:idx1, 1:idx2, z) = cell2mat(numdata(:,2:i,z));
 %convert milliseconds to sec
end
numdata2(:, 1,z) = numdata2(:,1,z)./1000;
%TEMPORARY FIX--REMOVE FIRST 20 ROWS (EXTRA DATA FROM TURNING FILAMENTS ON)
numdataholder = numdata2(21:end,:,:);
clear numdata
numdata2 = numdataholder;

%find what column where Temperature is located to plot it
indextemp = find(strcmp(columnheaders, 'Temperature')==1);
indextime = find(strcmp(columnheaders, 'Time')==1); %same with time
%concatenate and plot
dontplotindex = [indextime(2) indextemp];
% figure(length(columnheaders) +1);
% alldataplot = gca;

% for multispectra = 1:length(fid) %plotting multiple TPD spectra separately


%create colors for plots
colorsforalldataplot = distinguishable_colors(length(columnheaders).*length(fid));
for z = 1:numel(fid)
    for i = 2:(length(columnheaders))
%     dataset = setfield(dataset, columnheaders{i},{z}, numdata2(:,i-1,z));
    if i > length(columnnames)+3
        break
    else
    end
    dataset(z).(columnheaders{i}) = numdata2(:,i-1,z);
    end
end
   
 y= i-1;
 
 %PLOT STUFF
 
 %individual graphs
 structSize1 = 1:(length(fieldnames(dataset))-2);
 structSizecolor = structSize1;
 for z = 1:length(fid)
      
 %FIND THE TEMPERATURE BOUNDS SET AT THE BEGINNING
    %sometimes might have zeroes appended at the end of the struct
        tempindex = max(find(dataset(z).Temperature>tempset)) ;
        %now finds the zeroes that are between 1 and the highest nonzero
        %temp in the struct
        tempindex = max(find(dataset(z).Temperature(1:tempindex-1)<tempset));
        
        tempminindex = max(find(dataset(z).Temperature(1:tempindex-1)<tempmin));
        %sometimes you may plot something where the tempset is greater than the max temp in the data
        if isempty(tempindex) 
            tempindex = max(find(dataset(z).Temperature));
        end
        if isempty(tempminindex) 
            tempminindex = 1;%set to first element in array if temp min wanted is below temperature in array.
        end
    %this for loop plots EVERYTHING in the file    
    for structSize = 1:(length(fieldnames(dataset))-2); %subtract 2 to not include Time and Temp
        if numel(fid)>1
            structSizecolor =  1:((length(fieldnames(dataset)))*numel(fid));
        end
        
%NOW ADJUST BASELINES
%this is the data
 signal = dataset(z).(columnheaders{structSize+3})(tempminindex:tempindex);
 T = dataset(z).Temperature(tempminindex:tempindex);
 %FOR A FLAT LINE ADDITION/SUBTRACTION
if min(signal) < 0 
 baseline = signal + abs(min(signal));%set baseline equal to zero
elseif min(signal)>0
    baseline = signal - abs(min(signal));
end
%IF YOU GET A FIT THAT STILL DOESNT HAVE A ZERO BASELINE CHECK THE FIRST
%POINT IN THE TEXT FILE. IT MAY BE OFF FROM THE ACTUAL BASELINE DUE CONTROLLER
%ISSUE STARTING UP DURING TPD. IF SO DELETE THAT FIRST POINT

%Linear Averaging and subtraction...good for sloping stuff to subtract
%background

k = 15; %how many to average 

%can be different from beg to end, see line 260, var b where i do k*10 points avg at the end

 for i = 1:length(signal)
    if isfinite(signal(i)) == 0
        signal(i) = signal(i-1);
    end
 end
 %can throw an error if subtraction of k*number is greater than the numel in T
 a = mean(T(1:k));b = mean(T(length(T)-(k*2):end));
% c = 0.96*mean(signal(1:k)); d = 0.985*mean(signal((length(signal)-k):end));
c = 1*mean(signal(1:k)); d = 1*mean(signal((length(signal)-(k*2)):end));
 slope = 1.00*(d- c)./(b-a);
 if slope <1e-12 %dont bother with the correction
     slope = 0;
 end
%  yline = slope.*(T-a)+c;%baseline fit %beginning fit
 yline = slope.*(T-b)+d;%baseline fit %ending fit
baseline = signal-yline;
newbaseline = baseline;

%if you want min at zero
% if min(newbaseline) <0
% newbaseline = newbaseline + abs(min(newbaseline));
% 
% end
baseline = newbaseline;

%UNCOMMENT THESE LINES IF YOU WANT TO PLOT TO SEE THE SUBTRACTION

% if exist('yline','var')
% figure(100+structSize)
% plot(T, baseline, T, newbaseline, T, yline, T, signal);
% legend('baseline','newbaseline','yline','signal');
% end
% figure(500+structSize); plot(T,newbaseline);legend('newbaseline');
% area = trapz(T, newbaseline);

% sigma = 1.3016E15; %this is for Pt(100) %1.434E15 this is for Mo(100)
% ML = area./(2.9970e+05); %(  1.2076e+06)area for H2 on Pt(100)



%ADJUST BASELINES CODE IS ABOVE
%THIS ONLY CHANGES THE BASELINE ELEMENTS, DOES NOT CHANGE WHOLE VECTOR, CAN
%THROW ERRORS
% I do this so that the cumulative plot (all the masses on one plot) has it
% all subtracted.
dataset(z).Temperature(tempminindex:tempindex)= T ;
dataset(z).(columnheaders{structSize+3})(tempminindex:tempindex) = newbaseline;
 %PLOT 'EM IS BELOW
        figure(structSize);
        plot(dataset(z).Temperature(tempminindex:tempindex),dataset(z).(columnheaders{structSize+3})(tempminindex:tempindex), 'Color',colorsforalldataplot(structSizecolor(structSize*z),:));
        %area of the whole thing   
%         dataset(z).wholeareas.(columnheaders{structSize+3})=trapz(dataset(z).Temperature(1:tempindex),dataset(z).(columnheaders{structSize+3})(1:tempindex));   
        title(columnheaders{structSize+3}, 'Interpreter', 'none');
        xlabel('Temperature');
        ylabel('QMS signal (a.u.)')
        if numel(fid)>1
            
%         hdle(structSize)=legend('-DynamicLegend', 'Location', 'best');
%         gca;
%         legend(gca,FileName(z),'Interpreter', 'none');
%         set(hdle(structSize)
        
        hold on
        
%          hdle(i+1- max(dontplotindex)) =legend( '-DynamicLegend', 'Location', 'best');
%             set(hdle(i+1- max(dontplotindex)), 'Interpreter', 'none') ;
%             legend boxoff;
            if z ~=1
                
            legend(FileNamemat,'Interpreter', 'none','Location', 'best');
            end
        else 
            legend({FileName},'Interpreter', 'none','Location', 'best');
           
        end
        
       axis tight %lets make sure the data is plotted first 
    end
       
 end
 
for r=1:y-1 %gotta plot em all
        figure(r)
        
end
if plotcumsignals ==1
 for z = 1:length(fid)
     %sometimes might have zeroes appended at the end of the struct
        tempindex = max(find(dataset(z).Temperature>tempset)) ;
        %now finds the zeroes that are between 1 and the highest nonzero
        %temp in the struct
        tempindex = max(find(dataset(z).Temperature(1:tempindex-1)<tempset));
        %sometimes you may plot something where the tempset is greater than the max temp in the data
        
        tempminindex = max(find(dataset(z).Temperature(1:tempindex-1)<tempmin));
        if isempty(tempindex) 
            tempindex = max(find(dataset(z).Temperature));
        end
         if isempty(tempminindex) 
            tempminindex = 1;%set to first element in array if temp min wanted is below temperature in array.
        end
     
    for structSize = 1:(length(fieldnames(dataset))-2); 
        figure((length(fieldnames(dataset))+z));
        hold on
        plot(dataset(z).Temperature(tempminindex:tempindex),dataset(z).(columnheaders{structSize+3})(tempminindex:tempindex), 'Color',colorsforalldataplot(structSize,:));
        
    end
    axis tight %putting this here because i want all the data plotted first
    %before changing the axes
    if length(fid)>1
            title(FileName(z), 'Interpreter', 'none');
         else %bug fix: if you dont have the if-else, it would only print the first
                %letter of the filename when plotting only 1 file
            title(FileName, 'Interpreter', 'none');
    end
         legend(columnnames, 'Interpreter', 'none', 'Location', 'best');
         xlabel('Temperature');
         ylabel('QMS signal (a.u.)');
 end
end
 toc
 if plottime ==1;
     for z = 1:length(fid)
            for structSize = 1:(length(fieldnames(dataset))-2); 
            figure((length(fieldnames(dataset))*25+z));
             hold on
%               do you care about plotting the temp index? then use line below
%              plot(dataset(z).Time(1:tempindex),dataset(z).(columnheaders{structSize+3})(1:tempindex), 'Color',colorsforalldataplot(structSize,:));

                %if you dont care about temp index then use the line below            
                 plot(dataset(z).Time,dataset(z).(columnheaders{structSize+3}), 'Color',colorsforalldataplot(structSize,:));
                 xlabel('Time');
                
            end
             axis tight %putting this here because i want all the data plotted first
            %before changing the axes
            if length(fid)>1
            title(FileName(z), 'Interpreter', 'none');
            else %bug fix: if you dont have the if-else, it would only print the first
                %letter of the filename when plotting only 1 file
            title(FileName, 'Interpreter', 'none');
            end
            legend(columnnames, 'Interpreter', 'none', 'Location', 'best');
            xlabel('Time (sec)');
            ylabel('QMS signal (a.u.)');
     end
 end
 %b1_1L.csv appears to be the best descriptor of 1ML from the data. I use
 %that to calculate the relative coverage of the other peaks
 
  
if logical(modeldata)
    cd C:\Users\koelgrp.PRINCETON\Desktop\re
    dlmwrite(strcat('data',num2str(z),'.csv'),[dataset(z).Temperature(tempminindex:tempindex),dataset(z).(columnheaders{structSize+3})(tempminindex:tempindex)],'delimiter','\t','precision',6)
    TPDappnew
end

if logical(compcoverage)
 %should put a try catch or something here
 %find which file is 'b0_1L.csv'
 elemt = find(strcmp(FileName,'b0_1L.csv')); 
 %elemt is used to search dataset for rows corresponding to this file
 
 %this is the area under the furfural 1ML curve
MLfurf = trapz(dataset(elemt).Temperature(tempminindex:tempindex),dataset(elemt).furf96(tempminindex:tempindex))
    
%now compute the other furfural areas
for i = 1:z
    cov(i) = trapz(dataset(i).Temperature(tempminindex:tempindex),dataset(i).furf96(tempminindex:tempindex));
end
normalizedcov = cov/MLfurf
end
















    %total graphs per dataset
% %plotting
% % for z = 1:length(fid)
%         if sum(i == dontplotindex) == 0 
%            plotshandle(y)= figure(i- max(dontplotindex));
%             set(gcf,'Visible', 'off');
%             hold on
%             h(i+1- max(dontplotindex)) = gca;
%             
%             %plot max temperature range, in this case it is 550
%             tempindex = max(find(dataset(z).Temperature<550));
% 
%             if ischar(FileName) ~= 0
%                 
% 
% %                 dataset.Temperature = dataset.Temperature(1:tempindex);
%                 plot(dataset(z).Temperature(1:tempindex),numdata2(1:tempindex,i-1,z), 'DisplayName', FileName, 'Color',colorsforalldataplot(i,:));
%                 
%             else
% %                 dataset.Temperature = dataset.Temperature(1:tempindex);
% %                  plot(dataset.Temperature,numdata(1:length(dataset.Temperature),i-1), 'DisplayName', FileName{z}, 'Color',colorsforalldataplot(i,:));
%                 plot(dataset(z).Temperature(1:tempindex),numdata2(1:tempindex,i-1,z), 'DisplayName', FileName{z}, 'Color',colorsforalldataplot(i,:)); 
%             
%             end
%            
%             title(h(i+1- max(dontplotindex)), columnheaders{i}, 'Interpreter', 'none');
%             xlabel('Temperature');
%             ylabel('QMS signal (a.u.)');
% 
%             hdle(i+1- max(dontplotindex)) =legend( '-DynamicLegend', 'Location', 'best');
%             set(hdle(i+1- max(dontplotindex)), 'Interpreter', 'none') ;
%             legend boxoff;
%             
%             %plot of all the data
%             plotshandle(length(columnheaders) + z)= figure(length(columnheaders) + z);
%             set(gcf,'Visible', 'off');
%             figure(length(columnheaders) + z);set(gcf,'Visible', 'off');
%             
%             alldataplot(z) = gca;
%             hold on
%             %plot all the plots with these color orders
%             %make distinguishable colors equal to number of columns. This is more than needed
% 
%             plot(alldataplot(z),dataset(z).Temperature, numdata2(:,i-1,z),'Color',colorsforalldataplot(i,:));
%             
%             if length(fid)>1
%             title(alldataplot(z),FileName(z), 'Interpreter', 'none');
%             else %bug fix: if you dont have the if-else, it would only print the first
%                 %letter of the filename when plotting only 1 file
%             title(FileName, 'Interpreter', 'none');
%             end
%             xlabel('Temperature');
%             ylabel('QMS signal (a.u.)'); 
%             legend(columnheaders(4:i), 'Interpreter', 'none', 'Location', 'best');
%             
%     
%      
%      
%         end
% 
%     end
%     
%     figure(length(columnheaders) + z);
% % end
% % figure(length(columnheaders) + w);
% % title(alldataplot,'TPD');
% %      xlabel('Temperature');
% %      ylabel('QMS signal (a.u.)');
%     
% %    clearvars -except fid columnheaders FileName
% end

% for r=1:y-1
%         figure(r)
% end
% 
% toc
% numdata = numdata{2:i, 1:j}
%  matdata = cell2mat(splitdata)
