\LoadClass{article}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}

% All the Required Packages
\RequirePackage{fancyhdr}
\RequirePackage[margin=20mm]{geometry}
\RequirePackage{ragged2e}
\RequirePackage{calc}
\RequirePackage{enumitem}
\RequirePackage[none]{hyphenat}
\RequirePackage{xifthen}
\RequirePackage{multicol}
\RequirePackage{ncolor}

% Change line spacing
\linespread{1.3}

% Helper Commands
\newcommand{\vrulefill}[1]{\leavevmode\leaders\hrule height#1\hfill\kern0pt}

% Headings
\newcommand{\heading}[1]{
    \vspace{3em}\noindent\makebox[\linewidth]{\Large\raggedright\bf#1\hspace{0.5em}\vrulefill{0.9pt}}\vspace{0em}
}
\newcommand{\datedheading}[2]{
    \noindent\makebox[\linewidth]{\large\scshape\raggedright#1\hfill\primary#2}
}

% Title and Footer
\newcommand{\firstname}[1]{\def\@firstname{#1}}
\newcommand{\lastname}[1]{\def\@lastname{#1}}
\newcommand{\phone}[1]{\def\@phone{#1}}
\newcommand{\email}[1]{\def\@email{#1}}
\newcommand{\website}[1]{\def\@website{#1}}
\newcommand{\genname}{\def\@name{\@firstname\ \primary\textbf{\@lastname}}}
\newcommand{\details}{
    \genname\noindent
    \begin{minipage}{\linewidth}
        \raggedleft\Huge\@name\\
        \black\large Email:\ \primary\textbf{\@email}\\
        \ifthenelse{\isundefined{\@website}}{}{\black\large Website:\ \primary\textbf{\@website}\\}
        \black\large Phone:\ \primary\textbf{\@phone}\\
        \vspace{1.5em}
    \end{minipage}
}
\newcommand{\headfoot}[0]{
    \genname
    \pagestyle{fancy}\fancyhf{}
    \lhead{}\chead{}\rhead{}
    \ifdefined\@name\lfoot{\@name}\else\lfoot{}\fi
    \cfoot{}\rfoot{Page \thepage}
    \renewcommand{\headrulewidth}{0.15em}
    \renewcommand{\footrulewidth}{0.15em}
    \renewcommand{\headrule}{\hbox to\headwidth{\black\leaders\hrule height \headrulewidth\hfill}}
    \renewcommand{\footrule}{\hbox to\headwidth{\black\leaders\hrule height \footrulewidth\hfill}}
    \pagenumbering{arabic}
}

%Reference
\newcommand{\referenceone}[6]{\def\@refonename{\large#1\ \primary\textbf{#2}\black\normalsize}\def\@refonerole{Position:\ \primary\textbf{#3}\black}\def\@refonejob{Company:\ \primary\textbf{#4}\black}\def\@refoneemail{Email:\ \primary\textbf{#5}\black}\def\@refonephone{Phone:\ \primary\textbf{#6}\black}}
\newcommand{\referencetwo}[6]{\def\@reftwoname{\large#1\ \primary\textbf{#2}\black\normalsize}\def\@reftworole{Position:\ \primary\textbf{#3}\black}\def\@reftwojob{Company:\ \primary\textbf{#4}\black}\def\@reftwoemail{Email:\ \primary\textbf{#5}\black}\def\@reftwophone{Phone:\ \primary\textbf{#6}\black}}
\newcommand{\references}{\vfill\begin{header}{Professional Referees}
        \begin{minipage}[t]{0.5\linewidth}
            \ifx\@refonename\empty\else\@refonename\newline\fi
            \ifx\@refonerole\empty\else\@refonerole\newline\fi
            \ifx\@refonejob\empty\else\@refonejob\newline\fi
            \ifx\@refoneemail\empty\else\@refoneemail\newline\fi
            \ifx\@refonephone\empty\else\@refonephone\newline\fi
        \end{minipage}
        \begin{minipage}[t]{0.5\linewidth}
            \ifx\@reftwoname\empty\else\@reftwoname\newline\fi
            \ifx\@reftworole\empty\else\@reftworole\newline\fi
            \ifx\@reftwojob\empty\else\@reftwojob\newline\fi
            \ifx\@reftwoemail\empty\else\@reftwoemail\newline\fi
            \ifx\@reftwophone\empty\else\@reftwophone\newline\fi
        \end{minipage}
\end{header}}

% List definitions
\newenvironment{listed}[1]
    {\large\raggedright\textbf{#1}\hspace{0.5em}\vrulefill{0.9pt}\vspace{-1em}\begin{multicols}{3}\begin{itemize}[nolistsep]}
    {\end{itemize}\end{multicols}}
\newenvironment{infolist}[1]
    {\begin{minipage}[t]{\linewidth}
            \ifthenelse{\isempty{#1}}{}{\textbf{\underline{#1}}}
            \begin{description}[align=parleft,leftmargin=4.5cm,style=sameline,labelwidth=!,topsep=0pt,itemsep=0ex,partopsep=1ex,parsep=1ex]}
    {\end{description}\end{minipage}}

% Text Environments
\newenvironment{text}
    {\noindent\begin{minipage}[t]{\linewidth}\hspace{0em}\black}
    {\newline\end{minipage}}
\newenvironment{secgroup}[1]
    {\noindent\begin{minipage}[t]{\linewidth}#1\begin{text}}
    {\end{text}\end{minipage}}
\newenvironment{header}[1]
    {\begin{secgroup}{\heading{#1}}}
    {\end{secgroup}}
\newenvironment{subheader}[2]
    {\begin{secgroup}{\datedheading{#1}{#2}}}
    {\end{secgroup}}

\endinput
