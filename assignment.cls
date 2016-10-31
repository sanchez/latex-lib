\LoadClass{article}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{assignment}

\RequirePackage[margin=20mm]{geometry}
\RequirePackage{calc}
\RequirePackage[none]{hyphenat}
\RequirePackage[default]{sourcesanspro}
\RequirePackage[framemethod=TikZ,xcolor]{mdframed}
\RequirePackage{titlesec}
\RequirePackage[document]{ragged2e}
\RequirePackage{ncolor}
\RequirePackage{float}
\RequirePackage{fancyhdr}
\RequirePackage{titlepage}

% Options
\DeclareOption{number}{\def\@secnumber}
\DeclareOption{rule}{\def\@headrule}
\ProcessOptions\relax

% Line Spacing
\linespread{1.3}

% Helper Commands
\newcommand{\vrulefill}[1]{\leavevmode\leaders\hrule height#1\hfill\kern0pt}

% Section style
\setcounter{tocdepth}{3}
\newcounter{heading}
\newcommand{\heading}[1]{
    \noindent\begin{minipage}{\textwidth}
        \stepcounter{heading}
        \noindent\primary\Large\bfseries
        \ifdefined\@secnumber
        \theheading\quad
        \fi
        #1
        \ifdefined\@headrule
        \ \vrulefill{0.12em}
        \fi
        \addcontentsline{toc}{section}{\ifdefined\@secnumber\theheading\quad\fi#1}
    \end{minipage}}
\newcounter{subheading}
\newcommand{\subheading}[1]{
    \addcontentsline{toc}{subsection}{\ifdefined\@secnumber\thesubheading\quad\fi#1}
    \noindent\begin{minipage}{\textwidth}
        \stepcounter{subheading}
        \noindent\primary\large\bfseries
        \ifdefined\@secnumber
        \thesubheading\quad
        \fi
        #1
        %\ifdefined\@headrule
        %\ \vrulefill{0.12em}
        %\fi
    \end{minipage}}
%\newcommand{\tmpsection}[1]{\section{#1}}
%\ifdefined\@secnumber
%\renewcommand{\tmpsection}[1]{\section[#1]{\thesection\qquad#1}}
%\fi
%\newcommand{\heading}[1]{\color{primary}\tmpsection{#1}
%    %\ifdefined\@headrule
%    \vspace{-2em}\hspace{\widthof{\tmpsection{#1}}}
%    \vrulefill{0.9pt}
%    %\fi
%    \color{black}\newline}
%\titleformat{\section}[runin]
%    {\Large\bfseries}{\thesection}{1em}{}
%\newcommand{\heading}[1]{\color{primary}\section{#1}\vrulefill{0.12em}\color{black}\newline}

\newcommand{\headfoot}{
    \pagestyle{fancy}\fancyhf{}
    \lhead{}\chead{}\rhead{}
    \lfoot{\code}\cfoot{\username (\snum)}\rfoot{Page \thepage}
    \renewcommand{\headrulewidth}{0.15em}
    \renewcommand{\footrulewidth}{0.15em}
    \renewcommand{\headrule}{\hbox to\headwidth{\black\leaders\hrule height\headrulewidth\hfill}}
    \renewcommand{\footrule}{\hbox to\headwidth{\black\leaders\hrule height\footrulewidth\hfill}}
    \pagenumbering{arabic}
}

