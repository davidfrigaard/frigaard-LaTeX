\NeedsTeXFormat{LaTeX2e}[2011/06/27]
\ProvidesClass{frigaardreportF}[2013/07/24]
\LoadClass[12pt,a4paper]{article}

% Table of Contents
% -------------------------
% Setup
% Typography
% Titlepage
% Page Numbering
% -------------------------

% Setup
% -------------------------
\RequirePackage{etoolbox}
% -------------------------

% Typography
% -------------------------
\RequirePackage[sc,osf]{mathpazo}
\RequirePackage{tgcursor}
\RequirePackage[T1]{fontenc}
\RequirePackage[protrusion=true, expansion]{microtype}
% -------------------------

% Titlepage
% -------------------------
\newtoggle{iltitle}
\toggletrue{iltitle}

\DeclareOption{iltitle}{\toggletrue{iltitle}}
\DeclareOption{fptitle}{\togglefalse{iltitle}}
\ProcessOptions

\newcommand{\cnum}[1]{\def \@candidatenum{#1}} \cnum{}
\newcommand{\subtitle}[1]{\def \@subtitle{#1}} \subtitle{}
\newcommand{\email}[1]{\def \@email{#1}} \email{}

\iftoggle{iltitle}
{\def \maketitle{
	\thispagestyle{empty}
	\begin{flushleft}
		{\large\sl\@author} \hfill \ifx \@candidatenum \empty \relax \else {\large\sl\@candidatenum} \fi \\
		\vspace{2\baselineskip}
		{\Large\sl\@title} \\
		\vspace{0.5\baselineskip}
		\ifx \@subtitle \empty	\vspace{\baselineskip} \else {\large\sl\@subtitle} \\ \fi
		\vspace{2\baselineskip}
		{\large\sl\@date} \\
		\vspace{5\baselineskip}
	\end{flushleft}}}
{\def \maketitle{
	\thispagestyle{empty}
	\begin{flushleft}
		{\large\sl\@author} \hfill \ifx \@candidatenum \empty \relax \else {\large\sl\@candidatenum} \fi \\
		\ifx \@email \empty	\vspace{\baselineskip} \else {\large\url{\@email}} \fi
		\vfill
		{\Large\sl\@title} \\
		\vspace{\baselineskip}
		\ifx \@email \empty	\vspace{\baselineskip} \else {\large\sl\@subtitle} \fi \\
		\vfill \vfill
		{\large\sl\@date} \\
	\end{flushleft}
	\clearpage
	\setcounter{page}{1}}}
% -------------------------

% Page Numbering
% -------------------------
\RequirePackage{fancyhdr}

\let \ps@plain \ps@fancy
\fancyhead{}
\fancyfoot{}
\fancyhead[RO,LE]{}
\fancyfoot[RO,LE]{\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\pagestyle{plain}

\newcommand{\frontmatter}{\setcounter{page}{0}\pagenumbering{roman}}
\newcommand{\backmatter}{\setcounter{page}{0}\pagenumbering{roman}}
\newcommand{\mainmatter}{\setcounter{page}{0}\pagenumbering{arabic}}
% -------------------------