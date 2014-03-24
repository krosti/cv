\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{paucv}[2014/03/21 Pau CV]

% default font
\renewcommand\familydefault{\sfdefault}

% some variables
\newcommand{\name}[1]{\def\getName{#1}}
\newcommand{\surname}[1]{\def\getSurname{#1}}
\newcommand{\photo}[1]{\def\getPhoto{#1}}
\newcommand{\mail}[1]{\def\getMail{#1}}
\newcommand{\phone}[1]{\def\getPhone{#1}}
\newcommand{\mobile}[1]{\def\getMobile{#1}}
\newcommand{\github}[1]{\def\getGithub{#1}}
\newcommand{\location}[1]{\def\getLocation{#1}}
\newcommand{\birth}[1]{\def\getBirth{#1}}

% don't indent
\setlength\parindent{0pt}

% base class
\LoadClass{article}

% icons
\RequirePackage{fontawesome}

% margins
\RequirePackage[top=0cm,bottom=0cm,left=0cm,right=0cm]{geometry}

% boxes
\RequirePackage{minibox}

% floating text
\RequirePackage{pstricks}

% draw utilities
\usepackage{tikz}

% solarized colors
\RequirePackage{xcolor}
\definecolor{base03}{HTML}{002B36}
\definecolor{base02}{HTML}{073642}
\definecolor{base01}{HTML}{586E75}
\definecolor{base00}{HTML}{657B83}
\definecolor{base0}{HTML}{839496}
\definecolor{base1}{HTML}{93A1A1}
\definecolor{base2}{HTML}{EEE8D5}
\definecolor{base3}{HTML}{FDF6E3}
\definecolor{yellow}{HTML}{B58900}
\definecolor{orange}{HTML}{CB4B16}
\definecolor{red}{HTML}{DC322F}
\definecolor{magenta}{HTML}{D33682}
\definecolor{violet}{HTML}{6C71C4}
\definecolor{blue}{HTML}{268BD2}
\definecolor{cyan}{HTML}{2AA198}
\definecolor{green}{HTML}{859900}

% colors for table
\RequirePackage{colortbl}

% info box command
\newcommand{\makeinfos}{
\begingroup
\begin{center}
\rput[l](0,.05){\tikz{\path[draw=blue,fill=blue](0,0)rectangle(\textwidth,3cm);}}
  \begin{minipage}[l]{.1\textwidth}
    \includegraphics[width=\textwidth]{./img/qrcode.png}
  \end{minipage}
  \begin{minipage}[c]{.5\textwidth}
    \fontsize{30pt}{12pt}\selectfont
    \getName\\
    \fontsize{50pt}{12pt}\selectfont
    \getSurname
  \end{minipage}
  \begin{minipage}[c]{.15\textwidth}
    \includegraphics[width=\textwidth]{\getPhoto}
  \end{minipage}
\end{center}
\rput(.5\textwidth,.75){\fontsize{18pt}{10pt}\selectfont curriculum vit\ae}
\rput(.5\textwidth,-1){
\par\noindent
  \fontsize{15pt}{15pt}\selectfont
  \begin{tabular}{c l c l}
    \faCalendar & \getBirth & \faMobilePhone & \getMobile \\
    \faMapMarker & \getLocation & \faPhone & \getPhone \\
    \faEnvelope & \getMail & \faGithub & \getGithub \\
  \end{tabular}
}
\endgroup}

% sectioning
\newcommand{\sectiontitle}[1]{{\fontsize{18pt}{20pt}\bf\selectfont\par\bigskip\bigskip#1\par\bigskip\bigskip}}
\newcommand{\subsectiontitle}[1]{{\fontsize{16pt}{20pt}\bf\selectfont\par\bigskip\bigskip#1\par\bigskip}}
\RequirePackage{changepage}
\newenvironment{cvsection}{
  \begin{adjustwidth*}{2cm}{2cm}
}{
  \end{adjustwidth*}
}


% timeline 

\newcommand{\timedot}{\rput(.21,0){\tikz{\path[draw=blue,fill=blue](0,0)circle(0.1);}}}
\newcommand{\eventbox}[1]{\minibox{#1}}
\newcommand{\eventtitle}[1]{\fontsize{15pt}{17pt}\selectfont\bf#1\\[.2\baselineskip]}
\newcommand{\eventbody}[1]{\minibox{\fontsize{12pt}{15pt}\selectfont#1}}
\newcommand{\eventdate}[1]{\bf#1}
\newcommand{\event}[3]{\eventdate{#1} & \timedot & & \eventbox{\eventtitle{#2}\eventbody{#3}}\\}
\newcommand{\eventseparator}{&&\\&&\\}

\newenvironment{timeline}{
\begingroup
  \begin{tabular}{r c !{\color{blue}\vrule} c l}
}{
  \end{tabular}
\endgroup}
\endinput
