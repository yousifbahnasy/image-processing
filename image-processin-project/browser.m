function varargout = browser(varargin)
% BROWSER MATLAB code for browser.fig
%      BROWSER, by itself, creates a new BROWSER or raises the existing
%      singleton*.
%
%      H = BROWSER returns the handle to a new BROWSER or the handle to
%      the existing singleton*.
%
%      BROWSER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BROWSER.M with the given input arguments.
%
%      BROWSER('Property','Value',...) creates a new BROWSER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before browser_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to browser_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help browser

% Last Modified by GUIDE v2.5 16-Dec-2022 06:11:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @browser_OpeningFcn, ...
                   'gui_OutputFcn',  @browser_OutputFcn, ...
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


% --- Executes just before browser is made visible.
function browser_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to browser (see VARARGIN)

% Choose default command line output for browser
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes browser wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = browser_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in browse.
function browse_Callback(hObject, ~, handles)
% hObject    handle to browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile('*.*', 'Pick a MATLAB code file');
  if isequal(filename,0) || isequal(pathname,0)
     disp('User pressed cancel')
  else
      filename=strcat(pathname,filename);
     
     a= imread(filename);
     
     axes(handles.axes1);
     imshow(a);
     setappdata(0,'a',a)
     setappdata(0,'filename',a);
     handles.a = a;
     guidata(hObject, handles);
  end   
  


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, ~, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 a=getappdata(0,'a');
 imshow( Rgb2Gray(a, 3,[.3,.5,.2]))
 axes(handles.axes1);
     guidata(hObject, handles);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
 imshow(Gray2Binary( a, 127))
 axes(handles.axes1);
     guidata(hObject, handles);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
imshow(a);
 handles.a= a;
     guidata(hObject, handles);
     


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
imshow(Hist(a))
axes(handles.axes1);  
guidata(hObject, handles);

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
 imshow(HISTOEQU(a))
axes(handles.axes1);
     guidata(hObject, handles);



function pushbutton7_Callback(hObject, ~, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
pop=get(handles.noise,'value');

if pop==1
    imshow(saltandpepper(a,.3,.2))
elseif pop==2
    imshow(noise_gussin(a,30,100))
elseif pop==3
   imshow( noise_uniform(a,50,100))
elseif pop==4
    imshow(Reyleigh( a,10,50 ))
elseif pop==5
    imshow(Gamma_noise( a,10,100 ))
else
     imshow(Exponential( a,50 ))
end
axes(handles.axes1);
guidata(hObject, handles);


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
bri=get(handles.brightnes,'value');
if bri==1
   add=a+50;
    imshow(add)
    
elseif bri==2
     mult=a*10;
    imshow(mult)
    
elseif bri==3
    sub=a-30;
    imshow(sub)
    
else
 
     dev=a/3;
    imshow(dev) 
end
axes(handles.axes1);
guidata(hObject, handles);

% --- Executes on button press in radiobutton7.
function radiobutton7_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
 af=fft2(a);
 s=mat2gray(log(1+(abs(af))));
 imshow(s,[])
 axes(handles.axes1);
guidata(hObject, handles);
% Hint: get(hObject,'Value') returns toggle state of radiobutton7


% --- Executes on button press in radiobutton8.
function radiobutton8_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton8
a=getappdata(0,'a');
fi=fft2(a);
 af=fftshift(fi);
  s=mat2gray(log(1+(abs(af)))) ;
   imshow(s,[])
   axes(handles.axes1);
guidata(hObject, handles);


% --- Executes on button press in radiobutton9.
function radiobutton9_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton9
a=getappdata(0,'a');
fi=fft2(a);
fis=fftshift(fi);
af=ifft2(fis);
s=mat2gray(abs(af)) ;
imshow(s,[])
axes(handles.axes1);
guidata(hObject, handles);


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
img=im2double(a);
x=img;
[h,w]=size(a);
c=5;
for i=1:h
    for j=1:w
      x (i,j)=c *log (1+ img(i,j));
    end
end
imshow(x)
axes(handles.axes1);
guidata(hObject, handles);





% --- Executes on button press in Gamma.
function Gamma_Callback(hObject, eventdata, handles)
% hObject    handle to Gamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
img=im2double(a);
y=img;
[h,w]=size(a);
c=5;
for i=1:h
    for j=1:w
      y (i,j)=c *img(i,j)^8;
    end
end
imshow(y)
axes(handles.axes1);
guidata(hObject, handles);


% --- Executes on button press in Negative.
function Negative_Callback(hObject, eventdata, handles)
% hObject    handle to Negative (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
imshow(Negative(a))
axes(handles.axes1);
guidata(hObject, handles);


% --- Executes on button press in inverse_log.
function inverse_log_Callback(hObject, eventdata, handles)
% hObject    handle to inverse_log (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
imshow(InvLog(a, 5))
axes(handles.axes1);
guidata(hObject, handles);


% --- Executes on button press in Stretching.
function Stretching_Callback(hObject, eventdata, handles)
% hObject    handle to Stretching (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
 imshow(Stretching( a, 1, 50 ))
 axes(handles.axes1);
guidata(hObject, handles);

 





% --- Executes on button press in Apply_filter.
function Apply_filter_Callback(hObject, eventdata, handles)
% hObject    handle to Apply_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
val=get(handles.FILTER,'value');
if val==1
    imshow(MEANF1(a))
elseif val==2
    imshow(WEIGHT(a))
    
elseif val==3
  imshow( POINTDETECTION(a))
    
elseif val==4

 imshow(Sharpening(a))
 
elseif val==5
 imshow( MIN(a))
elseif val==6
    imshow(MAX(a))
elseif val==7
    imshow(Median_Filtering(a))
else
imshow(Midpoint_filter(a))
end
axes(handles.axes1);
guidata(hObject, handles);





% --- Executes on button press in Apply_filters.
function Apply_filters_Callback(hObject, eventdata, handles)
% hObject    handle to Apply_filters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
val=get(handles.pass_filter,'value');
if val==1
   imshow( low_ideal_pass(a,50))
elseif val==2
    imshow (high_ideal_pass(a,60))
    
elseif val==3
  imshow (low_butterworth_pass(a,5,2))
    
elseif val==4

 imshow (high_butterworth_pass(a,50,2))
 
elseif val==5
 imshow (low_gaussian_pass(a,15))
elseif val==6

else
imshow (high_gaussian_pass(a,60))
end
axes(handles.axes1);
guidata(hObject, handles);

% --- Executes on selection change in FILTER.
function FILTER_Callback(hObject, eventdata, handles)
% hObject    handle to FILTER (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns FILTER contents as cell array
%        contents{get(hObject,'Value')} returns selected item from FILTER


% --- Executes during object creation, after setting all properties.
function FILTER_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FILTER (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in pass_filter.
function pass_filter_Callback(hObject, eventdata, handles)
% hObject    handle to pass_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pass_filter contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pass_filter


% --- Executes during object creation, after setting all properties.
function pass_filter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pass_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
 imshow (high_gaussian_pass(a,5))
axes(handles.axes1);
guidata(hObject, handles);


% --- Executes on selection change in noise.
function noise_Callback(hObject, eventdata, handles)
% hObject    handle to noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns noise contents as cell array
%        contents{get(hObject,'Value')} returns selected item from noise


% --- Executes during object creation, after setting all properties.
function noise_CreateFcn(hObject, ~, ~)
% hObject    handle to noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
imshow(RGB2Binary(a, 127))
 axes(handles.axes1);
     guidata(hObject, handles);



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
