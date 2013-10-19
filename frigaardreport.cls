\NeedsTeXFormat{LaTeX2e}[2011/06/27]
\ProvidesClass{frigaardreportF}[2013/07/24]
\LoadClass[12pt,a4paper]{article}

% Table of Contents
% -------------------------
% Setup
% Typography
% Language
% Titlepage
% Page Numbering
% Sectioning
% Page Layout
% Table of Contents
% Maths
% Figures, Tables and Floats
% Sidenotes
% Hyperref
% -------------------------

% Setup
% -------------------------
\RequirePackage{etoolbox}

\newcommand{\frigaardLaTeX}{frigaard\LaTeX}
% -------------------------

% Typography
% -------------------------
\RequirePackage[protrusion=true, expansion]{microtype}

\newtoggle{osf}
\toggletrue{osf}
\newtoggle{sans}
\togglefalse{sans}

\DeclareOption{nosf}{\togglefalse{osf}}
\DeclareOption{osf}{\toggletrue{osf}}
\DeclareOption{nsans}{\togglefalse{sans}}
\DeclareOption{sans}{\toggletrue{sans}}
\ProcessOptions

\iftoggle{osf}{\PassOptionsToPackage{osf}{mathpazo}}{}

\RequirePackage[scale=0.9]{tgheros}
\iftoggle{sans}{\renewcommand*\familydefault{\sfdefault}}{}
\RequirePackage[scaled]{beramono}
\RequirePackage[sc]{mathpazo}
\RequirePackage[T1]{fontenc}
% -------------------------

% Language
% -------------------------
\RequirePackage[english]{babel}
\RequirePackage{csquotes}
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
	\begin{fullwidth}
	\begin{flushleft}
		{\Large\sl\@author} \hfill \ifx \@candidatenum \empty \relax \else {\Large\sl\@candidatenum} \fi \\
		\vspace{2\baselineskip}
		{\LARGE\sl\@title} \\
		\vspace{0.5\baselineskip}
		\ifx \@subtitle \empty	\vspace{\baselineskip} \else {\Large\sl\@subtitle} \\ \fi
		\vspace{2\baselineskip}
		{\Large\sl\@date} \\
		\vspace{5\baselineskip}
	\end{flushleft}
	\end{fullwidth}
	\noindent}}
{\def \maketitle{
	\thispagestyle{empty}
	\begin{fullwidth}
	\begin{flushleft}
		{\Large\sl\@author} \hfill \ifx \@candidatenum \empty \relax \else {\Large\sl\@candidatenum} \fi \\
		\vspace{0.5\baselineskip}
		\ifx \@email \empty	\vspace{\baselineskip} \else {\Large\url{\@email}} \fi
		\vfill
		{\LARGE\sl\@title} \\
		\vspace{\baselineskip}
		\ifx \@email \empty	\vspace{\baselineskip} \else {\Large\sl\@subtitle} \fi
		\vfill \vfill
		{\Large\sl\@date} 
	\end{flushleft}
	\end{fullwidth}
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
\newcommand{\backmatter}{\clearpage\setcounter{page}{0}\pagenumbering{roman}}
\newcommand{\mainmatter}{\clearpage\setcounter{page}{0}\pagenumbering{arabic}}
% -------------------------

% Sectioning
% -------------------------
\RequirePackage{titlesec}

\newtoggle{secbreak}
\togglefalse{secbreak}

\DeclareOption{secbreak}{\toggletrue{secbreak}}
\DeclareOption{nsecbreak}{\togglefalse{secbreak}}
\ProcessOptions

\iftoggle{secbreak}{\newcommand{\sectionbreak}{\clearpage}}{\newcommand{\sectionbreak}{}}

\titleformat{\part}[display]{\vspace{10mm}\slshape\raggedright}{\Large Part \thepart}{0mm}{\LARGE}{}
\titlespacing*{\part}{0mm}{-2\baselineskip}{12.5\baselineskip}

\let\oldpart\part
\renewcommand{\part}{\clearpage\oldpart}

\titleformat{\section}[hang]{\slshape\raggedright}{\Large\thesection.}{5mm}{\Large}{}
\titlespacing*{\section}{0mm}{2\baselineskip}{\baselineskip}

\titleformat{\subsection}[hang]{\slshape\raggedright}{\Large\thesubsection.}{5mm}{\Large}{}
\titlespacing*{\subsection}{0mm}{2\baselineskip}{\baselineskip}

\titleformat{\subsubsection}[hang]{\slshape\raggedright}{\large\thesubsection.}{5mm}{\large}{}
\titlespacing*{\subsubsection}{0mm}{\baselineskip}{\baselineskip}

\titleformat{\paragraph}[runin]{\normalsize\slshape\raggedright}{}{5mm}{}{}

\newcommand{\chapter}{\PackageError{The \protect\chapter\space command is unavaliable in the frigaardreport class.}}
\renewcommand{\subparagraph}{\PackageError{The \protect\subparagraph\space command is unavaliable in the frigaardreport class.}}
% -------------------------

% Page Layout
% -------------------------
\RequirePackage[]{geometry}
\RequirePackage[strict]{changepage}

\newenvironment{fullwidth}{}{}
\def\pagelayout#1{\csname fpl#1\endcsname}

\newcommand{\fplsixtysix}{
	\pagebreak
	\pdfpageheight 297mm
	\pdfpagewidth 210mm
	\setlength{\paperheight}{297mm}
	\setlength{\paperwidth}{210mm}
	\setlength{\headwidth}{130mm}
	\newgeometry{layoutheight=297mm, layoutwidth=210mm, lmargin=40mm, rmargin=40mm}}
\newcommand{\fplpnomargin}{
	\pagebreak
	\pdfpageheight 297mm
	\pdfpagewidth 210mm
	\setlength{\paperheight}{297mm}
	\setlength{\paperwidth}{210mm}
	\setlength{\headwidth}{150mm}
	\newgeometry{layoutheight=297mm, layoutwidth=210mm, lmargin=30mm, rmargin=30mm}}
\newcommand{\fplpmargin}{
	\pagebreak
	\pdfpageheight 297mm
	\pdfpagewidth 210mm
	\setlength{\paperheight}{297mm}
	\setlength{\paperwidth}{210mm}
	\setlength{\headwidth}{150mm}
	\newgeometry{layoutheight=297mm, layoutwidth=210mm, lmargin=30mm, rmargin=30mm, includemp, marginparsep=7mm, marginparwidth=60mm}
	\renewenvironment{fullwidth}{
	\begin{adjustwidth}{}{-67mm}
		\changetext{0mm}{67mm}{0mm}{67mm}{0mm}}
		{\end{adjustwidth}
		\changetext{0mm}{-67mm}{0mm}{-67mm}{0mm}}}
\newcommand{\fpllnomargin}{
	\pagebreak
	\pdfpageheight 210mm
	\pdfpagewidth 297mm
	\setlength{\paperheight}{210mm}
	\setlength{\paperwidth}{297mm}
	\setlength{\headwidth}{237mm}
	\newgeometry{layoutheight=210mm, layoutwidth=297mm, lmargin=30mm, rmargin=30mm}}
\newcommand{\fpllmargin}{
	\pagebreak
	\pdfpageheight 210mm
	\pdfpagewidth 297mm
	\setlength{\paperheight}{210mm}
	\setlength{\paperwidth}{297mm}
	\setlength{\headwidth}{237mm}
	\newgeometry{layoutheight=210mm, layoutwidth=297mm, lmargin=30mm, rmargin=30mm, includemp, marginparsep=5mm, marginparwidth=108mm}
	\renewenvironment{fullwidth}{
			\begin{adjustwidth}{}{-113mm}
			\changetext{0mm}{113mm}{0mm}{113mm}{0mm}}
			{\end{adjustwidth}
			\changetext{0mm}{-113mm}{0mm}{-113mm}{0mm}
			\noindent}}
	
\pagelayout{pnomargin}
% -------------------------

% Table of Contents
% -------------------------
\RequirePackage{titletoc}

\newtoggle{iltoc}
\toggletrue{iltoc}
\newtoggle{fwtoc}
\toggletrue{fwtoc}

\DeclareOption{iltoc}{\toggletrue{iltoc}}
\DeclareOption{fptoc}{\togglefalse{iltoc}}
\DeclareOption{fwtoc}{\toggletrue{fwtoc}}
\DeclareOption{twtoc}{\togglefalse{fwtoc}}
\ProcessOptions

\titlecontents{part}[0mm]{\large\sl}{}{}{\hfill\contentspage}[\addvspace{\baselineskip}]

\titlecontents{section}[10mm]{\large\sl}{\contentslabel{10mm}}{\hspace{-10mm}}{\hfill\contentspage}[\addvspace{0.5\baselineskip}]

\dottedcontents{subsection}[20mm]{\sl}{10mm}{3mm}

\dottedcontents{subsubsection}[30mm]{\sl}{10mm}{3mm}

\setcounter{tocdepth}{3}

\let\oldtoc\tableofcontents

\iftoggle{iltoc}{\renewcommand{\tableofcontents}{\oldtoc\addvspace{4\baselineskip}}}{\renewcommand{\tableofcontents}{\clearpage\oldtoc\clearpage}}
% -------------------------

% Maths
% -------------------------
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
% -------------------------

% Figures, Tables and Floats
% -------------------------
\RequirePackage{booktabs}
\renewcommand{\arraystretch}{1.2}

\RequirePackage{graphicx}

\RequirePackage{float}

\RequirePackage[font={small,sl},margin=1cm,justification={centerlast,justified}]{caption}
% -------------------------

% Sidenotes
% -------------------------
\RequirePackage{sidenotes}
% -------------------------

% Hyperref
% -------------------------
\RequirePackage[linktocpage=true, colorlinks=true, urlcolor=magenta, linkcolor=blue]{hyperref}
% -------------------------