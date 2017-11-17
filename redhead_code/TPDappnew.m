function varargout = TPDappnew(varargin)
% TPDAPPNEW MATLAB code for TPDappnew.fig
%      TPDAPPNEW, by itself, creates a new TPDAPPNEW or raises the existing
%      singleton*.
%
%      H = TPDAPPNEW returns the handle to a new TPDAPPNEW or the handle to
%      the existing singleton*.
%
%      TPDAPPNEW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TPDAPPNEW.M with the given input arguments.
%
%      TPDAPPNEW('Property','Value',...) creates a new TPDAPPNEW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TPDappnew_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TPDappnew_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TPDappnew

% Last Modified by GUIDE v2.5 12-Feb-2016 18:21:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TPDappnew_OpeningFcn, ...
                   'gui_OutputFcn',  @TPDappnew_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before TPDappnew is made visible.
function TPDappnew_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TPDappnew (see VARARGIN)

% Choose default command line output for TPDappnew
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
set(handles.coverage_dep,'Value',1);
axes(handles.equation);
text(0.09,0.5,'$-\frac{1}{\beta}\frac{d\theta}{dt}=-\frac{d\theta}{dT}=\frac{\nu_{n}\theta^{n}}{\beta}exp(\frac{-E_a}{RT})$','Interpreter','LaTex','FontSize',20);

% UIWAIT makes TPDappnew wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TPDappnew_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function initial_temp_Callback(hObject, eventdata, handles)
% hObject    handle to initial_temp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of initial_temp as text
%        str2double(get(hObject,'String')) returns contents of initial_temp as a double


% --- Executes during object creation, after setting all properties.
function initial_temp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to initial_temp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function final_temp_Callback(hObject, eventdata, handles)
% hObject    handle to final_temp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of final_temp as text
%        str2double(get(hObject,'String')) returns contents of final_temp as a double


% --- Executes during object creation, after setting all properties.
function final_temp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to final_temp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function energy_Callback(hObject, eventdata, handles)
% hObject    handle to energy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of energy as text
%        str2double(get(hObject,'String')) returns contents of energy as a double


% --- Executes during object creation, after setting all properties.
function energy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to energy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function order_Callback(hObject, eventdata, handles)
% hObject    handle to order (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of order as text
%        str2double(get(hObject,'String')) returns contents of order as a double
ord=str2num(get(hObject,'String'));
switch ord;
    case 2
        set(handles.frequency,'String',1E-2);
    case 1
        set(handles.frequency,'String',1E13);
    case 0.5
        set(handles.frequency,'String',3E20);
    case 0
        set(handles.frequency,'String',1E28);
end

% --- Executes during object creation, after setting all properties.
function order_CreateFcn(hObject, eventdata, handles)
% hObject    handle to order (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function coverage_Callback(hObject, eventdata, handles)
% hObject    handle to coverage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of coverage as text
%        str2double(get(hObject,'String')) returns contents of coverage as a double


% --- Executes during object creation, after setting all properties.
function coverage_CreateFcn(hObject, eventdata, handles)
% hObject    handle to coverage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function mono_Callback(hObject, eventdata, handles)
% hObject    handle to mono (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mono as text
%        str2double(get(hObject,'String')) returns contents of mono as a double


% --- Executes during object creation, after setting all properties.
function mono_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mono (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

axes(handles.TPDplot);

nstep=10000;
i=0;
To=str2num(get(handles.initial_temp,'String'));
Tf=str2num(get(handles.final_temp,'String'));
Ea=str2num(get(handles.energy,'String'));
mono=str2num(get(handles.mono,'String'));
coverage=str2num(get(handles.coverage,'String'));
v=str2num(get(handles.frequency,'String'));
B=str2num(get(handles.ramp_rate,'String'));
n=str2num(get(handles.order,'String'));
exa=str2num(get(handles.exp_1,'String'));
exb=str2num(get(handles.exp_2,'String'));
exc=str2num(get(handles.exp_3,'String'));
oldT=To;
oldy=0;
y=0;
amount=mono*coverage;
contents = get(handles.coverage_dep,'Value');
for i=1:length(amount)
      theta=amount(i);
      for j=0:nstep;
           T=To+j*(Tf-To)/nstep;
           deltaT=T-oldT;
           switch theta
               case 0
                   preexp=0;
               otherwise
                   preexp=v*theta^n/B;
           end
           oldy=y;
           switch contents
               case 1
                   Ee=Ea;
               case 2
                   Ee=(Ea-exa*(theta/mono));
               case 3 
                   Ee=(Ea-((9*exa^2*(theta/mono)^1.5)/(1+9*exb*(theta/mono)^1.5)^2));
               case 4
                   Ee=(Ea-((theta/mono)^1.5)*9*((exa*(theta/mono)-exb)^2));
               case 5
                   Ee=(Ea-(exa*(theta/mono)^3+exb*(theta/mono)^2+exc*(theta/mono)));
               case 6
                   Ee=(Ea-(exa*(theta/mono)^exb));
           end
           y=preexp*exp(-Ee/(0.008314*T));
           yy(j+1,i)=y;
           xx(j+1)=T;
           AdE(j+1,i)=Ee;
           cov(j+1,i)=theta/mono;
           dip(j+1,i)=exa/(1+9*exb*(theta/mono)^1.5);
           if y>oldy ;
                Tp(i,1)=T;
                yp(i)=y;
           end;
           theta=theta-y*(deltaT);
           oldT=T;
           if theta<=0;
                theta=0;
           end;
      end  
end;
yp;
yyy=yy;
[~,ind]=max(yy);
% xdata = handles.xdata;
% ydata = handles.ydata;

 xdata = getappdata(0, 'xdata');
 ydata = getappdata(0, 'ydata');
% xdata = getappdata(0, 'VarName1')
% ydata = getappdata(0,'VarName2')
exist('xdata')

 h1 =  plot(xx,yyy)
 hold on
if exist('xdata')==1
   
%  h1 = plot(xx,yyy,'r');% hold on;
    h3 = plot(xdata, ydata,'r')
%  h1 =  plot(xx,yyy);

else
%     delete(h1)
%      h1 =plot(xx,yyy)
     
end
hold off
h = findobj('type','line')
% gca
set(handles.tp_temp,'String',Tp);
xt=transpose(xx);
curves=horzcat(xt,yyy,AdE,cov,dip);
handles.data_to_output =curves;
% Choose default command line output for TPDappnew
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% --- Executes on selection change in coverage_dep.
function coverage_dep_Callback(hObject, eventdata, handles)
% hObject    handle to coverage_dep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns coverage_dep contents as cell array
%        contents{get(hObject,'Value')} returns selected item from coverage_dep
contents = cellstr(get(hObject,'String'));
axes(handles.equation);
switch contents{get(hObject,'Value')}
    case 'None'
        cla;
        set(handles.exp_2,'Enable','off');
        set(handles.exp_1,'Enable','off');
        set(handles.exp_3,'Enable','off');
        set(handles.A,'String',' ');
        set(handles.B,'String',' ');
        set(handles.C,'String',' ');
        text(0.09,0.5,'$-\frac{1}{\beta}\frac{d\theta}{dt}=-\frac{d\theta}{dT}=\frac{\nu_{n}\theta^{n}}{\beta}exp(\frac{-E_a}{RT})$','Interpreter','LaTex','FontSize',18);
    case 'Linear'
        cla;
        set(handles.exp_1,'Enable','on');
        set(handles.exp_2,'Enable','off');
        set(handles.exp_3,'Enable','off');
        set(handles.A,'String','a');
        set(handles.B,'String',' ');
        set(handles.C,'String',' ');
        text(0.12,0.5,'$-\frac{d\theta}{dT}=\frac{\nu_{n}\theta^{n}}{\beta}exp(\frac{-(E_a-a\theta)}{RT}\ )$','Interpreter','LaTex','FontSize',18)
    case 'Albano'
        cla;
        set(handles.exp_1,'Enable','on');
        set(handles.exp_2,'Enable','on');
        set(handles.exp_3,'Enable','off');
        set(handles.A,'String','u');
        set(handles.B,'String','a');
        set(handles.C,'String',' ');
        text(0.03,0.5,'$-\frac{d\theta}{dT}=\frac{\nu_{n}\theta^{n}}{\beta}exp(\frac{-(E_a-(\frac{9u^{2}\theta^{3/2}}{(1+9a\theta^{3/2}\ )^{2}}\ )}{RT}\ )$','Interpreter','LaTex','FontSize',18)
    case 'Modified Albano'
        cla;
        set(handles.A,'String','A');
        set(handles.B,'String','b');
        set(handles.C,'String',' ');
        set(handles.exp_1,'Enable','on');
        set(handles.exp_2,'Enable','on');
        set(handles.exp_3,'Enable','off');
        text(0.03,0.5,'$-\frac{d\theta}{dT}=\frac{\nu_{n}\theta^{n}}{\beta}exp(\frac{-(E_a-9(A\theta+b)^{2}\theta^{3/2}}{RT})$','Interpreter','LaTex','FontSize',18)
    case 'Work Function'
        cla;
        set(handles.A,'String','A');
        set(handles.B,'String','B');
        set(handles.C,'String','C');
        set(handles.exp_1,'Enable','on');
        set(handles.exp_2,'Enable','on');
        set(handles.exp_3,'Enable','on');
        text(0,0.5,'$-\frac{d\theta}{dT}=\frac{\nu_{n}\theta^{n}}{\beta}exp(\frac{-(E_a-(A\theta^{3}+B\theta^{2}+C\theta))\ }{RT}\ )$','Interpreter','LaTex','FontSize',18)
    case 'Power'
        cla;
        set(handles.A,'String','A');
        set(handles.B,'String','b');
        set(handles.C,'String',' ');
        set(handles.exp_1,'Enable','on');
        set(handles.exp_2,'Enable','on');
        set(handles.exp_3,'Enable','off');
        text(0.12,0.5,'$-\frac{d\theta}{dT}=\frac{\nu_{n}\theta^{n}}{\beta}exp(\frac{-(E_a-A\theta^b)}{RT}\ )$','Interpreter','LaTex','FontSize',20)
end
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function coverage_dep_CreateFcn(hObject, eventdata, handles)
% hObject    handle to coverage_dep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Test.
function Test_Callback(hObject, eventdata, handles)
% hObject    handle to Test (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
To = str2num(get(handles.initial_temp,'String'))
Tf = str2num(get(handles.final_temp,'String'))



function frequency_Callback(hObject, eventdata, handles)
% hObject    handle to frequency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of frequency as text
%        str2double(get(hObject,'String')) returns contents of frequency as a double


% --- Executes during object creation, after setting all properties.
function frequency_CreateFcn(hObject, eventdata, handles)
% hObject    handle to frequency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ramp_rate_Callback(hObject, eventdata, handles)
% hObject    handle to ramp_rate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ramp_rate as text
%        str2double(get(hObject,'String')) returns contents of ramp_rate as a double


% --- Executes during object creation, after setting all properties.
function ramp_rate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ramp_rate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function exp_1_Callback(hObject, eventdata, handles)
% hObject    handle to exp_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of exp_1 as text
%        str2double(get(hObject,'String')) returns contents of exp_1 as a double


% --- Executes during object creation, after setting all properties.
function exp_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to exp_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function exp_2_Callback(hObject, eventdata, handles)
% hObject    handle to exp_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of exp_2 as text
%        str2double(get(hObject,'String')) returns contents of exp_2 as a double


% --- Executes during object creation, after setting all properties.
function exp_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to exp_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function exp_3_Callback(hObject, eventdata, handles)
% hObject    handle to exp_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of exp_3 as text
%        str2double(get(hObject,'String')) returns contents of exp_3 as a double


% --- Executes during object creation, after setting all properties.
function exp_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to exp_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in output.
function output_Callback(hObject, eventdata, handles)
% hObject    handle to output (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val=get(handles.coverage_dep,'Value');
switch val
    case 1
        fileID = fopen('matlab_model.txt','w');
        fprintf(fileID,'%2s\n','TPD simulation with no coverage dependence');
        fclose(fileID);
    case 2
        a=str2num(get(handles.exp_1,'String'));
        fileID = fopen('matlab_model.txt','w');
        fprintf(fileID,'%2s\n','TPD simulation with linear coverage dependence');
        fprintf(fileID,'%2s %6.3f\n','A=',a);
        fclose(fileID);
    case 3
        a=str2num(get(handles.exp_1,'String'));
        b=str2num(get(handles.exp_2,'String'));
        fileID = fopen('matlab_model.txt','w');
        fprintf(fileID,'%2s\n','TPD simulation with Albano coverage dependence');
        fprintf(fileID,'%2s %4.3f %3s %4.3f\n','u=',a,'a=',b);
        fclose(fileID);
    case 4
        a=str2num(get(handles.exp_1,'String'));
        b=str2num(get(handles.exp_2,'String'));
        fileID = fopen('matlab_model.txt','w');
        fprintf(fileID,'%2s\n','TPD simulation with Modified Albano coverage dependence');
        fprintf(fileID,'%2s %4.3f %3s %4.3f\n','A=',a,'b=',b);
        fclose(fileID);
    case 5
        a=str2num(get(handles.exp_1,'String'));
        b=str2num(get(handles.exp_2,'String'));
        c=str2num(get(handles.exp_3,'String'));
        fileID = fopen('matlab_model.txt','w');
        fprintf(fileID,'%2s\n','TPD simulation with Work Function coverage dependence');
        fprintf(fileID,'%2s %4.3f %3s %4.3f %3s %4.3f\n','A=',a,'B=',b,'C=',c);
        fclose(fileID);
    case 6
        a=str2num(get(handles.exp_1,'String'));
        b=str2num(get(handles.exp_2,'String'));
        c=str2num(get(handles.exp_3,'String'));
        fileID = fopen('matlab_model.txt','w');
        fprintf(fileID,'%2s\n','TPD simulation with Power coverage dependence');
        fprintf(fileID,'%2s %4.3f %3s %4.3f %3s %4.3f\n','A=',a,'b=',b);
        fclose(fileID);
end
initcov=str2num(get(handles.coverage,'String'));
initcov=transpose(initcov);
fileID = fopen('matlab_model.txt','a');
fprintf(fileID,'%2s\t','T');
fclose(fileID);
dlmwrite('matlab_model.txt',initcov,'-append','delimiter','\t')
dlmwrite('matlab_model.txt',handles.data_to_output,'-append','delimiter','\t');


function A_Callback(hObject, eventdata, handles)
% hObject    handle to A (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of A as text
%        str2double(get(hObject,'String')) returns contents of A as a double


% --- Executes during object creation, after setting all properties.
function A_CreateFcn(hObject, eventdata, handles)
% hObject    handle to A (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function B_Callback(hObject, eventdata, handles)
% hObject    handle to B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of B as text
%        str2double(get(hObject,'String')) returns contents of B as a double


% --- Executes during object creation, after setting all properties.
function B_CreateFcn(hObject, eventdata, handles)
% hObject    handle to B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function C_Callback(hObject, eventdata, handles)
% hObject    handle to C (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of C as text
%        str2double(get(hObject,'String')) returns contents of C as a double


% --- Executes during object creation, after setting all properties.
function C_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tp_energy_Callback(hObject, eventdata, handles)
% hObject    handle to tp_energy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tp_energy as text
%        str2double(get(hObject,'String')) returns contents of tp_energy as a double



% --- Executes during object creation, after setting all properties.
function tp_energy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tp_energy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tp_temp_Callback(hObject, eventdata, handles)
% hObject    handle to tp_temp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tp_temp as text
%        str2double(get(hObject,'String')) returns contents of tp_temp as a double



% --- Executes during object creation, after setting all properties.
function tp_temp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tp_temp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in units_kj.
function units_kj_Callback(hObject, eventdata, handles)
% hObject    handle to units_kj (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.units_kc,'Value',0);

% Hint: get(hObject,'Value') returns toggle state of units_kj


% --- Executes on button press in units_kc.
function units_kc_Callback(hObject, eventdata, handles)
% hObject    handle to units_kc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.units_kj,'Value',0);
% Hint: get(hObject,'Value') returns toggle state of units_kc


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in tp_calc.
function tp_calc_Callback(hObject, eventdata, handles)
% hObject    handle to tp_calc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
v=str2num(get(handles.frequency,'String'));
n=str2num(get(handles.order,'String'));
B=str2num(get(handles.ramp_rate,'String'));
Tpk=str2num(get(handles.tp_temp,'String'));
mono=str2num(get(handles.mono,'String'));
coverage=str2num(get(handles.coverage,'String'));
unit_test=get(handles.units_kj,'Value');
thetao=mono*coverage;
switch unit_test
    case 0
        corr=4.18;
    case 1
        corr=1;
end
switch n
    case 0.5
        Ep=lambertw(v*Tpk/(B*thetao^0.5))*0.008314*Tpk/corr;
        set(handles.tp_energy,'string',Ep);
    case 1    
        Ep=lambertw(Tpk*v/B)*Tpk*0.008314/corr;
        set(handles.tp_energy,'string',Ep);   
    case 2
        Ep=lambertw(thetao*v*Tpk/B)*0.008314*Tpk/corr
        set(handles.tp_energy,'string',Ep);
end



% --- Executes on button press in importdata.
function importdata_Callback(hObject, eventdata, handles)
% hObject    handle to importdata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile({'*.txt';'.xls';'*.m';'*.*'},'File Selector');
%% Import data from text file.
% Script for importing data from the following text file:
%
%    C:\Users\Manolis1\Desktop\65sdose.txt
%
% To extend the code to different selected data or a different text file,
% generate a function instead of a script.

% Auto-generated by MATLAB on 2016/02/12 08:10:12

%% Initialize variables.

delimiter = '\t';

%% Format string for each line of text:
%   column1: double (%f)
%	column2: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%f%f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter,  'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Allocate imported array to column variable names
VarName1 = dataArray{:, 1};
VarName2 = dataArray{:, 2};


%% Clear temporary variables
clearvars filename delimiter formatSpec fileID dataArray ans;

axes(handles.TPDplot); h3 = plot(VarName1,VarName2); hold on
[data, ind] = max(VarName2);
Tp = VarName1(ind);
set(handles.tp_temp,'String',Tp);
 setappdata(0,'xdata',VarName1);
 setappdata(0,'ydata',VarName2);

guidata(hObject, handles);


% --------------------------------------------------------------------
function uipushtool1_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in clearaxes.
function clearaxes_Callback(hObject, eventdata, handles)
% hObject    handle to clearaxes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.TPDplot, 'reset');
if isappdata(0,'xdata')==1
rmappdata(0,'xdata');
end
if isappdata(0,'ydata')==1
rmappdata(0,'ydata');
end

