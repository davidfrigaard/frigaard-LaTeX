\NeedsTeXFormat{LaTeX2e}[2011/06/27]
\ProvidesClass{frigaardreport}[2013/07/24]
\LoadClass[12pt,a4paper]{article}

% Table of Contents
% -------------------------
% SETUP
% Typography
% Colours
% Language (babel)
% Quotes
% Units
% Titlepage
% Headers and Footers
% Page Layout
% Sectioning
% Table of Contents
% Tables, Figures and Floats
% Footnotes
% Bibliographies
% Links (hyperref)
% -------------------------

% SETUP
% -------------------------
\RequirePackage{etoolbox}
% -------------------------

% Typography
% -------------------------
\RequirePackage[sc,osf]{mathpazo}
\RequirePackage{tgcursor}
\RequirePackage[T1]{fontenc}
\RequirePackage[protrusion= true, expansion]{microtype}
% -------------------------

% Colours
% -------------------------
\RequirePackage{xcolor}
% -------------------------

% Language
% -------------------------
\RequirePackage[english]{babel}
% -------------------------

% Quotes
% -------------------------
\RequirePackage{csquotes}
% -------------------------

% Units
% -------------------------
\RequirePackage{siunitx}
% -------------------------

% Titlepage
% -------------------------
\newtoggle{condensedtitle}
\togglefalse{condensedtitle}
\DeclareOption{condensedtitle}{\toggletrue{condensedtitle}}
\ProcessOptions

\newcommand{\candidatenum}[1]{\def \@candidatenum{#1}} \candidatenum{}
\newcommand{\subtitle}[1]{\def \@subtitle{#1}} \subtitle{}
\newcommand{\email}[1]{\def \@email{#1}} \email{}

\iftoggle{condensedtitle}{
\def \maketitle{%
		\begin{flushleft}
			\pagestyle{empty}
			{\large\sl\@date} \\
			{\large\sl\@author} 
			\hfill
			{\large\sl\@candidatenum} \\
			\vspace{1\baselineskip}
			{\Large\sl\@title} \\
%			\vspace{2\baselineskip}
%			{\large\sl\@subtitle} \\
			\vspace{1\baselineskip}
		\end{flushleft}
}
}{
\def \maketitle{%
	\begin{titlepage}
		\begin{flushleft}
			\pagestyle{empty}
			{\LARGE\sl\@author
			\hfill
			\ifx \@candidatenum \empty
				\relax
			\else 
				{\large\@candidatenum} \\
			\fi	
			} 
			\linebreak[1]
			\ifx \@email \empty
				\vspace{\baselineskip}
			\else
				{\large\url{\@email}}
			\fi
			\vfill
			{\Huge\sl\@title} \\
			\vspace{\baselineskip}
			\ifx \@subtitle \empty
				\relax
			\else
				{\LARGE\sl\@subtitle} \\
			\fi			
			\vfill
			\vfill
			{\LARGE\sl\@date}
			\iftoggle{isdocumenttwosided}{\cleardoublepage}{\newpage}
		\end{flushleft}
	\end{titlepage}}
}


% -------------------------

% Headers and Footers
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

\newcommand{\frontmatter}{\pagebreak\pagenumbering{roman}}
\newcommand{\mainmatter}{\pagebreak\pagenumbering{arabic}}

% -------------------------

% Page Layout
% -------------------------
\newtoggle{isdocumenttwosided}

\DeclareOption{twoside}{
\PassOptionsToClass{twoside}{article}
\toggletrue{isdocumenttwosided}}
\ProcessOptions

\RequirePackage[strict]{changepage}

\newenvironment{fullwidth}{
	\begin{adjustwidth}{}{-67mm}
	\changetext{0mm}{67mm}{0mm}{67mm}{0mm}}
	{\end{adjustwidth}
	\changetext{0mm}{-67mm}{0mm}{-67mm}{0mm}}
	
\newenvironment{marginwidth}{
	\changetext{0mm}{-60mm}{0mm}{-60mm}{0mm}}
	{\changetext{0mm}{60mm}{0mm}{60mm}{0mm}}

\RequirePackage{geometry}

\pdfpageheight 297mm
\pdfpagewidth 210mm
\setlength{\paperheight}{297mm}
\setlength{\paperwidth}{210mm}
\setlength{\headwidth}{150mm}
\geometry{layoutheight=297mm, layoutwidth=210mm, lmargin=30mm, rmargin=30mm}

\def\pagelayout#1{\csname fpl#1\endcsname}
\newcommand{\fplsixtysix}{
	\pagebreak
	\pdfpageheight 297mm
	\pdfpagewidth 210mm
	\setlength{\paperheight}{297mm}
	\setlength{\paperwidth}{210mm}
	\setlength{\headwidth}{130mm}
	\newgeometry{layoutheight=297mm, layoutwidth=210mm, lmargin=40mm, rmargin=40mm}}
\newcommand{\fplnomargin}{
	\pagebreak
	\pdfpageheight 297mm
	\pdfpagewidth 210mm
	\setlength{\paperheight}{297mm}
	\setlength{\paperwidth}{210mm}
	\setlength{\headwidth}{150mm}
	\newgeometry{layoutheight=297mm, layoutwidth=210mm, lmargin=30mm, rmargin=30mm}}
\newcommand{\fplmargin}{
	\pagebreak
	\pdfpageheight 297mm
	\pdfpagewidth 210mm
	\setlength{\paperheight}{297mm}
	\setlength{\paperwidth}{210mm}
	\setlength{\headwidth}{150mm}
	\newgeometry{layoutheight=297mm, layoutwidth=210mm, lmargin=30mm, rmargin=30mm, includemp, marginparsep=7mm, marginparwidth=60mm}}
\newcommand{\fplnomarginlscape}{
	\pagebreak
	\pdfpageheight 210mm
	\pdfpagewidth 297mm
	\setlength{\paperheight}{210mm}
	\setlength{\paperwidth}{297mm}
	\setlength{\headwidth}{237mm}
	\newgeometry{layoutheight=210mm, layoutwidth=297mm, lmargin=30mm, rmargin=30mm}}
\newcommand{\fplmarginlscape}{
	\pagebreak
	\pdfpageheight 210mm
	\pdfpagewidth 297mm
	\setlength{\paperheight}{210mm}
	\setlength{\paperwidth}{297mm}
	\setlength{\headwidth}{237mm}
	\newgeometry{layoutheight=210mm, layoutwidth=297mm, lmargin=30mm, rmargin=30mm, includemp, marginparsep=5mm, marginparwidth=108mm}}
% -------------------------

% Sectioning
% -------------------------
\RequirePackage{titlesec}

\titleformat{\part}[display]{\vspace{10mm}\itshape\rmfamily\raggedright}{\LARGE Part \thepart}{0mm}{\Huge}{}
\titlespacing*{\part}{0mm}{30mm}{30mm}

\let\oldpart\part
\renewcommand{\part}{\clearpage\oldpart}


\titleformat{\section}[hang]{\itshape\rmfamily\raggedright}{\LARGE\thesection.}{5mm}{\LARGE}{}
\titlespacing*{\section}{0mm}{2\baselineskip}{\baselineskip}

\newtoggle{sectionbreakon}
\toggletrue{sectionbreakon}
\DeclareOption{nosectionbreak}{\togglefalse{sectionbreakon}}
\ProcessOptions
\iftoggle{sectionbreakon}{\newcommand{\sectionbreak}{\clearpage}}{\newcommand{\sectionbreak}{}}


\titleformat{\subsection}[hang]{\slshape\rmfamily\raggedright}{\Large\thesubsection.}{5mm}{\Large}{}
\titlespacing*{\subsection}{0mm}{2\baselineskip}{\baselineskip}

\titleformat{\subsubsection}[hang]{\slshape\rmfamily\raggedright}{\large\thesubsection.}{5mm}{\large}{}
\titlespacing*{\subsubsection}{0mm}{\baselineskip}{\baselineskip}

\titleformat{\paragraph}[runin]{\normalsize\slshape\rmfamily\raggedright}{}{5mm}{}{}

\newcommand{\chapter}{\PackageError{The \protect\chapter\space command is unavaliable in the frigaardreport class.}}
\renewcommand{\subparagraph}{\PackageError{The \protect\subparagraph\space command is unavaliable in the frigaardreport class.}}
% -------------------------

% Table of Contents
% -------------------------
\RequirePackage{titletoc}

\titlecontents{part}[0mm]{\large\sl}{}{}{\hfill\contentspage}[\addvspace{\baselineskip}]

\titlecontents{section}[10mm]{\large\sl}{\contentslabel{10mm}}{\hspace{-10mm}}{\hfill\contentspage}[]

\dottedcontents{subsection}[20mm]{\sl}{10mm}{3mm}

\dottedcontents{subsubsection}[30mm]{\sl}{10mm}{3mm}

\setcounter{tocdepth}{3}
% -------------------------

% Tables, Figures, Floats
% -------------------------
\RequirePackage{float}

\RequirePackage{booktabs}
\renewcommand{\arraystretch}{1.2}

\RequirePackage{graphicx}
% -------------------------

% Sidenotes
% -------------------------
\RequirePackage{sidenotes}
% -------------------------

% Bibliographies
% -------------------------
% -------------------------

% Links
% -------------------------
\RequirePackage[linktocpage=true, colorlinks=true, urlcolor=magenta, linkcolor=blue]{hyperref}
% -------------------------