function varargout = deteksi_tepi(varargin)
% DETEKSI_TEPI MATLAB code for deteksi_tepi.fig
%      DETEKSI_TEPI, by itself, creates a new DETEKSI_TEPI or raises the existing
%      singleton*.
%
%      H = DETEKSI_TEPI returns the handle to a new DETEKSI_TEPI or the handle to
%      the existing singleton*.
%
%      DETEKSI_TEPI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DETEKSI_TEPI.M with the given input arguments.
%
%      DETEKSI_TEPI('Property','Value',...) creates a new DETEKSI_TEPI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before deteksi_tepi_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to deteksi_tepi_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES
 
% Edit the above text to modify the response to help deteksi_tepi
 
% Last Modified by GUIDE v2.5 06-Dec-2021 00:06:49
 
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @deteksi_tepi_OpeningFcn, ...
                   'gui_OutputFcn',  @deteksi_tepi_OutputFcn, ...
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
 
 
% --- Executes just before deteksi_tepi is made visible.
function deteksi_tepi_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to deteksi_tepi (see VARARGIN)
 
% Choose default command line output for deteksi_tepi
handles.output = hObject;
 
% Update handles structure
guidata(hObject, handles);
 
% UIWAIT makes deteksi_tepi wait for user response (see UIRESUME)
% uiwait(handles.figure1);
 
 
% --- Outputs from this function are returned to the command line.
function varargout = deteksi_tepi_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
% Get default command line output from handles structure
varargout{1} = handles.output;
 
 
% --- Executes on button press in pilihgambar.
function pilihgambar_Callback(hObject, eventdata, handles)
% hObject    handle to pilihgambar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[namefile,namepath]=uigetfile(...
    {'*.bmp; *.jpg; *.png; *.tif', 'File of Type (*.bmp, *.jpg, *.png, *.tif)';
    '*.bmp', 'File Bitmap(*.bmp)';...
    '*.jpg', 'File JPG(*.jpg)';...
    '*.png', 'File PNG(*.png)';...
    '*.tif', 'File TIF(*.tif)';...
    '*.*','All File(*.*)'},...
    'Open Image');
 
if ~isequal(namefile,0)
    handles.data1=imread(fullfile(namepath,namefile));
    axes(handles.axes_citra_asli);
    imshow(handles.data1);
    title(namefile);
    guidata(hObject, handles);
else
    return
end
 
 
 
% --- Executes on button press in sobel.
function sobel_Callback(hObject, eventdata, handles)
% hObject    handle to sobel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image1 = handles.data1;
gray = rgb2gray(image1);
sobel = edge(gray,'sobel');
axes(handles.axes_konversi);
handles.data2 = sobel;
imshow(sobel);
title('Citra Deteksi Tipe Sobel');
 
 
% --- Executes on button press in prewitt.
function prewitt_Callback(hObject, eventdata, handles)
% hObject    handle to prewitt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image2 = handles.data1;
gray = rgb2gray(image2);
prewitt = edge(gray,'prewitt');
axes(handles.axes_konversi);
handles.data2 = prewitt;
imshow(prewitt);
title('Citra Deteksi Tipe Prewitt');

 
% --- Executes on button press in roberts.
function roberts_Callback(hObject, eventdata, handles)
image3 = handles.data1;
gray = rgb2gray(image3);
roberts = edge(gray,'roberts');
axes(handles.axes_konversi);
handles.data2 = roberts;
imshow(roberts);
title('Citra Deteksi Tipe Roberts');
 
% hObject    handle to roberts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
