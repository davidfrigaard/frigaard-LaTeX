\NeedsTeXFormat{LaTeX2e}[2011/06/27]
\ProvidesClass{frigaardtute}[2013/07/24]
\LoadClass[12pt,a4paper]{article}

\RequirePackage[x11names,table]{xcolor}
\RequirePackage[protrusion=true, expansion]{microtype}

\RequirePackage[english]{babel}
\RequirePackage{csquotes}

\newcommand{\david}{\noindent David Frigaard \hfill \today \\
	}
	
\let\oldenumerate\enumerate
\renewcommand{\enumerate}{
	\oldenumerate
	\setlength{\itemsep}{1pt}
	\setlength{\parskip}{0pt}
	\setlength{\parsep}{0pt}
}
\renewcommand{\theenumi}{\alph{enumi}}
