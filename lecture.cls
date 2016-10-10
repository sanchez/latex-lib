\LoadClass{article}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lecture}

% All the Required Packages
\RequirePackage{fancyhdr}
\RequirePackage[margin=20mm]{geometry}
\RequirePackage{ragged2e}
\RequirePackage{calc}
\RequirePackage{enumitem}
\RequirePackage[none]{hyphenat}
\RequirePackage{xifthen}
\RequirePackage{multicol}
\RequirePackage[default]{sourcesanspro}
\RequirePackage[framemethod=TikZ,xcolor]{mdframed}
\RequirePackage{ncolor}

% Change line spacing
\linespread{1.3}

% Helper Commands
\newcommand{\vrulefill}[1]{\leavevmode\leaders\hrule height#1\hfill\kern0pt}

% Header and Foot
\newcommand{\headfoot}[0]{
    \pagestyle{fancy}\fancyhf{}
    \lhead{\@code}\chead{}\rhead{Daniel\ \primary\textbf{Fitzmaurice}\black}
    \lfoot{Lecture\ \thelecture}\cfoot{}\rfoot{Page\ \thepage}
    \renewcommand{\headrulewidth}{0.15em}\renewcommand{\footrulewidth}{0.15em}
    \renewcommand{\headrule}{\hbox to\headwidth{\primary\leaders\hrule height \headrulewidth\hfill}}
    \renewcommand{\footrule}{\hbox to\headwidth{\primary\leaders\hrule height \footrulewidth\hfill}}
    \pagenumbering{arabic}
}
\newcommand{\course}[1]{\def\@code{#1}\headfoot}

% Headers
\newcounter{lecture}
\newcommand{\lecture}[1]{
    \stepcounter{lecture}
    \newpage
    \vspace{0em}\noindent
    \begin{minipage}{\linewidth}
        \vspace{0.3em}
        \huge\raggedright\textbf{Lecture\ \thelecture\ --\ \primary#1\black}
        \hspace{0.5em}\vrulefill{0.9pt}\vspace{0.3em}
    \end{minipage}
}
\newcommand{\header}[1]{
    \begin{minipage}[t]{\linewidth}\hspace{2em}\Large\primary\textbf{#1}\end{minipage}
}
\newcommand{\heading}[1]{
    \noindent\begin{minipage}[t]{\linewidth}\noindent\Large\primary\textbf{#1}\hspace{1em}\vrulefill{0.9pt}\normalsize\black\end{minipage}
}
\newcommand{\subheading}[1]{
    \noindent\begin{minipage}[t]{\linewidth}\noindent\large\textbf{#1}\hspace{1em}\vrulefill{0.9pt}\normalsize\end{minipage}
}

% Notes box
\newcommand{\@marginwidth}{1em}
\newcommand{\@linewidth}{0.4em}
\newcommand{\@cornersize}{10pt}
\newmdenv[innerleftmargin=\@marginwidth,innertopmargin=\@marginwidth,innerbottommargin=\@marginwidth,innerrightmargin=\@marginwidth,linewidth=\@linewidth,outerlinewidth=0pt,innerlinewidth=0pt,roundcorner=\@cornersize,linecolor=primary]{notebox}
\newenvironment{note}[1]
    {\noindent\begin{minipage}[t]{\linewidth}\begin{notebox}\header{#1}\begin{text}}
    {\end{text}\end{notebox}\end{minipage}}

% Environments
\newenvironment{text}
    {\noindent\begin{minipage}[t]{\linewidth}\hspace{0em}\black}
    {\newline\end{minipage}}
