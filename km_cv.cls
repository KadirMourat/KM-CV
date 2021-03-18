%% Start of file `km-cv.cls'.
% KM CV Class File
%
% This class has been downloaded from:
% https://github.com/KadirMourat/KM-CV
%
% Author:
% Kadir Mourat
%
% Notes:
% 1) This class file defines the structure and layout of the template file (cv.tex).
% 2) It has been written in such a way that under most circumstances you should not need to edit it.
%
% Template license:
% CC BY-SA 4.0 (https://creativecommons.org/licenses/by-sa/4.0/)
%


% Identification
%-------------------------------------------------------------------------------
\ProvidesClass{km_cv}[2021/03/17 KM CV Class]


% Class options
%-------------------------------------------------------------------------------
% Load article class
\LoadClass[12pt]{article}


% 3rd party packages
%-------------------------------------------------------------------------------
% Needed for configuring page layout
\usepackage{geometry}
% Needed for english language support
\usepackage[english]{babel}
% Noto sans font package
\usepackage[sfdefault]{noto}
% Needed for managing colors
\usepackage[dvipsnames]{xcolor}
% Needed for alternative section titles
\usepackage[explicit]{titlesec}
% Needed for fixed length tables
\usepackage{array}
% Needed to use font-awesome icons
\usepackage{fontawesome5}
% Needed for larger font size
\usepackage{anyfontsize}
% Needed for rounding corners of input images
\usepackage{tikz}
% Provides some tools like the \ifdef command or the \listadd command
\usepackage{etoolbox}
% Needed to make footer
\usepackage{fancyhdr}
% Needed for creating hyperlinks
\usepackage{hyperref}


% Layout configuration
%-------------------------------------------------------------------------------
% Configure page margins
\geometry{left=2cm,top=2.5cm,right=2cm,bottom=2.5cm}
% Change section title spacing
\titlespacing*{\section}{0pt}{-1pt}{5pt}
% Supress indenting
\setlength{\parindent}{0pt}
% Set the spacing between two table columns to zero
\setlength{\tabcolsep}{0pt}
% Define raisedrule command
\newcommand{\raisedrule}[2][0em]{\leaders\hbox{\rule[#1]{1pt}{#2}}\hfill}
% Center section title and add rules at both ends
\titleformat{\section}[block]{\filcenter\color{primarycolor}\bfseries\scshape\large}{\raisedrule[0.25em]{1pt}}{0.5em}{#1\enspace\raisedrule[0.25em]{1pt}}
%% Header & Footer
% Set offset to each header and footer
\fancyhfoffset{0em}
% Remove head rule
\renewcommand{\headrulewidth}{0pt}
% Clear all header & footer fields
\fancyhf{}
% Enable if you want to make header or footer using fancyhdr
\pagestyle{fancy}


% Color setup
%-------------------------------------------------------------------------------
% Hyperlink setup
\hypersetup{colorlinks=true, urlcolor=black}
% Define colors
\definecolor{primarycolor}{HTML}{1330A8}%Darkblue
\definecolor{secondarycolor}{HTML}{989898}%Darkgrey
\definecolor{tertiarycolor}{HTML}{1263D0}%Lightblue


% Commands for getting personal information
%-------------------------------------------------------------------------------
% Declare a box for storing the image
\newsavebox{\picbox}

% Define a macro that cuts an image to get rounded corners
% Usage: \cutpic{<rounding radius>}{<width>}{<path>}
\newcommand{\cutpic}[3]{\savebox{\picbox}{\includegraphics[width=#2]{#3}}\tikz\node[draw, rounded corners=#1, line width=0pt, color=white, minimum width=\wd\picbox, minimum height=\ht\picbox, path picture={\node at (path picture bounding box.center) {\usebox{\picbox}};}] {};}

% Add a symbol followed by a text
% Usage: \symbolplustext{<symbol>}{<text>}[<defaultTextColor>]
\newcommand{\symbolplustext}[3][tertiarycolor]{%
	{\small\textcolor{#1}{#2}\,#3}
}

%Add a symbol followed by a hyperlink
% Usage: \symbolpluslink{<symbol>}{<hyperlink>}{<displayedText>}[<defaultTextColor>]
\newcommand{\symbolpluslink}[4][tertiarycolor]{%
	{\small\textcolor{#1}{#2}\,\href{#3}{#4}}
}

% Internal command for adding address symbol plus address
% Usage: \addaddress{<address>}
\newcommand{\addaddress}[1]{\symbolplustext{\faMapMarker*}{#1}}

% Internal command for adding address symbol plus address
% Usage: \addbirthdate{<birthdate>}
\newcommand{\addbirthdate}[1]{\symbolplustext{\faBaby}{#1}}

% Internal command for adding phone symbol plus number
% Usage: \addphone{<phoneNumber>}
\newcommand{\addphone}[1]{\symbolplustext{\faMobile*}{#1}}

% Internal command for adding email symbol plus address
% Usage: \addemail{<email>}
\newcommand{\addemail}[1]{\symbolpluslink{\faAt}{mailto:#1}{#1}}

%Add Linkedin symbol plus hyperlink
% Usage: \addlinkedin{<linkedin>}
\newcommand{\addlinkedin}[1]{%
	\symbolpluslink{\faLinkedin}{http://www.linkedin.com/in/#1}{#1}
}

%Add Xing symbol plus hyperlink
% Usage: \addxing{<xing>}
\newcommand{\addxing}[1]{%
	\symbolpluslink{\faXing}{https://www.xing.com/profile/#1/cv}{#1}
}

%Add Github symbol plus hyperlink
% Usage: \addgithub{<github>}
\newcommand{\addgithub}[1]{%
	\symbolpluslink{\faGithub}{https://github.com/#1}{#1}
}


% Helper commands
%-------------------------------------------------------------------------------
% Print a list of elements and insert a separator between each element
% Usage: \printlist{<list>}[<separator>]
\newcommand{\printlist}[2][\enspace\color{tertiarycolor}\textbullet\enspace]{%
	{\def\listsep{\def\listsep{{#1}}}% Delayed execution of list separator
	\renewcommand{\do}[1]{\listsep##1}\dolistloop#2}
}

% Command for changing style of footer
% Usage: \footerstyle{<text>}
\newcommand*{\footerstyle}[1]{{\fontsize{8pt}{1em}\scshape\color{secondarycolor} #1}}

% Commands for structural elements of CV
%-------------------------------------------------------------------------------
% Make header
% Usage: \makeheader
\newcommand{\makeheader}[0]{%
	% Insert image
    \begin{minipage}[b]{110pt}%
        \hspace*{25pt}\cutpic{25pt}{85pt}{\profilepic}\vspace{5pt}
    \end{minipage}
    % Insert vertical rule separating image and text
    {\hspace*{\fill}\color{primarycolor}{\vrule width 2pt}\hspace*{\fill}}
    % Insert author information
    \begin{minipage}[b][][t]{330pt}%
		% Add name
		\hspace*{7pt}{\fontsize{40}{48}\selectfont\bfseries\color{tertiarycolor}\firstname\,\color{primarycolor}\lastname
		}\\[5pt]
		% Add address
		\addaddress{{\color{secondarycolor}\address}}\newline
		% Add address
		\addbirthdate{{\color{secondarycolor}\birthdate}}\newline
		% Add public accounts
		\printlist{\contactlist}\newline
		% Add public accounts
		\printlist{\publiclist}
    \end{minipage}
}

% Adds a cv entry element
% Usage: \cventry{<title>}{<employer>}{<date>}
\newcommand{\cventry}[3]{%
	\begin{minipage}[t]{.675\textwidth}%
		\hspace{.02\textwidth}
		\scshape{#1}
		\color{secondarycolor}{\itshape\small
			\enspace--\enspace#2
		}
	\end{minipage}
	\begin{minipage}[t]{.3\textwidth}%
		\raggedleft\scshape{\small#3}
	\end{minipage}
	\newline
}

% Add single line item
% Usage: \cvitem{<text>}
\newcommand{\cvitem}[1]{%
	\begin{minipage}[t]{.03\textwidth}%
		\hspace{.03\textwidth}
	\end{minipage}
	\begin{minipage}[t]{.93\textwidth}%
			\footnotesize #1
	\end{minipage}
	\\[0.5ex]
}

% Add text element (multi line elements)
% Usage: \cvtext{<text>}
\newcommand{\cvtext}[1]{%
	\begin{minipage}[t]{.03\textwidth}%
		\hspace{.03\textwidth}
	\end{minipage}
	\begin{minipage}[t]{.93\textwidth}%
		\footnotesize #1
	\end{minipage}
	\\[0.9ex]
}

% Add skill entry
% Usage: \addskills{<generalDescription>}{<skill>}
\newcommand{\addskills}[2]{%
	\mbox{%
		\hspace{1.4em}%
		\begin{tabular}{p{0.93\textwidth}}%
			\hspace{-0.8em}\small{\scshape\textbf{#1:~}}\printlist{#2}
		\end{tabular}
	}\newline
}

% Add publication entry
% Usage: \addskills{<type>}{<bibliography>}
\newcommand{\addpublication}[2]{%
	\mbox{%
		\hspace{1.4em}%
		\begin{tabular}{p{0.93\textwidth}}%
			\hspace{-0.8em}{\small\scshape\textbf{#1:~}}\footnotesize#2
		\end{tabular}
	}\newline
}

% Make footer
% Usage: \makefooter{<leftEntry>}{<centerEntry>}{<rightEntry>}
\newcommand*{\makecvfooter}[0]{%
  \fancyfoot{}
  \fancyfoot[L]{\footerstyle{\today}}
  \fancyfoot[C]{\footerstyle{\firstname~\lastname}}
  \fancyfoot[R]{\footerstyle{\thepage}}
}
