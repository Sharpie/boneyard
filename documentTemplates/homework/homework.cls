\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{homework}[2009/09/07 A Document class for homework and short reports]

% Required to keep some latex installations from
% running out of dimension variables.
\RequirePackage{etex}

% This class is based on Memoir
\LoadClass[12pt,article]{memoir}

% Some extra global variables provided by this class.

% Set to true if we are using Sweave.
\newif\ifSweave

% Initially false.
\Sweavefalse

% An option to toggle it.
\DeclareOption{Sweave}{\Sweavetrue}

% Enforce all options
\ProcessOptions\relax

% Memoir page setup.
\setlrmarginsandblock{1in}{1in}{*}
\setulmarginsandblock{1in}{1in}{*}
\setheadfoot{\baselineskip}{2em}
\setheaderspaces{*}{2em}{*}
\checkandfixthelayout

% Tighten up itemizes and enumerates.
\firmlists

% We load some nice math and symbol packages.
\RequirePackage{amsfonts,amsthm,amssymb}
\RequirePackage{mathrsfs}
\RequirePackage[intlimits]{amsmath}


%Defines several interesting float types, allows definition of new types annnnd...
%Provides the [H] specifier which means "Put it RIGHT HERE"
\RequirePackage{float}

% Graphics packages
\RequirePackage{graphicx,wrapfig}

% Hyperlink support.
\RequirePackage[pdftex,
	plainpages=false,
	pdfpagelabels,
	bookmarks,
	bookmarksnumbered,
	draft=false,
	breaklinks=true]{hyperref}

% The sexiest latex package ever created
\RequirePackage{tikz}

% Libraries for TikZ
\usetikzlibrary{decorations.pathmorphing}
\usetikzlibrary{decorations.text}
\usepgflibrary{decorations.pathreplacing}
\usetikzlibrary{fit}
\usetikzlibrary{calc}
\usetikzlibrary{matrix}
\usetikzlibrary{positioning}

% Bibliography stuff.
\RequirePackage{natbib}
\bibliographystyle{agufull}

% Unit handling

  % In general
  \RequirePackage{siunitx}
  \RequirePackage{xfrac}
  % v2.0 of the siunitx package requires
  % some LaTeX3 support-- it should be
  % loaded automagically.

  % text and math mode.
  \sisetup{per-mode=fraction}
  \newcommand{\siText}{\sisetup{fraction-function=\sfrac}}
  \newcommand{\siMath}{\sisetup{fraction-function=\frac}}
  \siText

  % Chemical formulas
  \RequirePackage[version=3]{mhchem}

% Setup the headers and footers.

% Adds a reference to the last page.
\usepackage{lastpage}

% Adds extra page marks for headers and footers.
\RequirePackage{extramarks}

\makepagestyle{homework}%
\makeevenhead{homework}{\hmwkAuthorName}{\hmwkClass}{\firstxmark}%
\makeoddhead{homework}{\hmwkAuthorName}{\hmwkClass}{\firstxmark}%
\makeevenfoot{homework}{\lastxmark}{}{Page\ \thepage\ of\ \pageref{LastPage}}%
\makeoddfoot{homework}{\lastxmark}{}{Page\ \thepage\ of\ \pageref{LastPage}}%
\makeheadrule{homework}{\textwidth}{\normalrulethickness}
\makefootrule{homework}{\textwidth}{\normalrulethickness}{0ex}


\makepagestyle{firstPage}
\makeevenhead{firstPage}{}{}{}
\makeoddhead{firstPage}{}{}{}
\makeevenfoot{firstPage}{\lastxmark}{}{Page \thepage\ of \pageref{LastPage}}
\makeoddfoot{firstPage}{\lastxmark}{}{Page \thepage\ of \pageref{LastPage}}
\makefootrule{firstPage}{\textwidth}{\normalrulethickness}{0ex}

% Use the homework page style
\pagestyle{homework}

% Layout and length tweaking

  % Paragraphs
  \setlength{\parindent}{0in}
  \setlength{\parskip}{1em}

  % Multiline equation spacing
  \setlength{\jot}{1em}

  % Frame box seperation
  \setlength{\fboxsep}{1ex}

  % Chapter set-up
  \setlength{\beforechapskip}{0.75em}
  \setlength{\afterchapskip}{0em}
  \renewcommand{\chaptitlefont}{\Large\bfseries}

% Title commands.
\newcommand{\hmwkTitle}{Another Assignment}
\newcommand{\hmwkDueDate}{\today}
\newcommand{\hmwkClass}{ENGR 666: Your Former Social Life}
\newcommand{\hmwkAuthorName}{John Doe}

% This command sets the title.
\renewcommand{\maketitle}{
	\thispagestyle{firstPage}
	\vbox{\centering
	{\LARGE\bfseries\hmwkTitle}\\
	\smallskip{\bfseries\hmwkAuthorName}\\
	\small{Due\ on\ \hmwkDueDate}\\
	\small{\itshape\hmwkClass}\vspace{0.5em}	
	}
	\hrule
}

% Set an info box informing the reader that this report uses Sweave.	
\ifSweave
	\newcommand{\SweaveInfo}{
	\definecolor{c9fa29c}{RGB}{159,162,156}
	\definecolor{c7e8eb0}{RGB}{126,142,176}
	\vfill
	\vbox{\centering
		\begin{tikzpicture}
			\begin{scope}[y=0.80pt, x=0.80pt, yscale=-0.75,xscale=0.75]
			% Nice R logo in TikZ by Tobias Wolf
			\path[fill=c9fa29c] (48, 0.0) node[inner sep=0pt](rTop){} .. controls (22.0, 0.0) and
	  ( 0.0,14.0) ..  ( 0.0,32.0) node[inner sep=-4pt, outer sep=0pt](rLef){} .. controls ( 0.0,49.0) and
	  (22.0,64.0) ..  (48.0,64.0) .. controls (74.0,64.0) and
	  (96.0,50.0) ..  (96.0,32.0) .. controls (96.0,14.0) and
	  (74.0, 0.0) ..  (48.0, 0.0) -- cycle(54.0,12.0) .. controls
	  (74.0,12.0) and (93.0,22.0) .. (93.0,34.0) .. controls
	  (93.0,46.0) and (76.0,56.0) .. (56.0,56.0) .. controls
	  (36.0,56.0) and (20.0,46.0) .. (20.0,34.0) .. controls
	  (20.0,22.0) and (34.0,12.0) .. (54.0,12.0) -- cycle;
	\path[fill=c7e8eb0] (37.0,18.0) -- (37.0,72.0) -- (53.0,72.0)
	  .. controls (53.0,72.0) and (53.0,59.0) .. (53.0,51.0) ..
	  controls (57.0,51.0) and (59.0,50.0) .. (62.0,55.0) ..
	  controls (66.0,62.0) and (71.0,72.0) .. (71.0,72.0) -- 
	  (90.0,72.0) node[inner sep=0pt](rBotLef){} .. controls (90.00,72.0) and (78.0,52.0) .. 
	  (77.0,51.0) .. controls (75.16,49.0) and (73.0,49.0) .. 
	  (70.0,48.0) .. controls (76.00,47.0) and (81.35,44.44) ..
	  (83.3,39.0) .. controls (85.00,34.0) and (84.8,27.6398) ..
	  (81.156,23.375) .. controls (78.0,20.0) and (75.0,18.0) ..
	  (67.0,18.0) -- (37.0,18.0) -- cycle(53.0,29.0) --
	  (63.5,29.0) .. controls (65.9853,29.0) and (68.0,31.5) ..
	  (68.0,34.0) .. controls (68.0,36.5) and (66.0,39.0) ..
	  (63.5,39.0) -- (53.0,39.0) -- (53.0,29.0)  -- cycle;
	  			\end{scope}
			
			\node[fit = (rTop) (rBotLef) (rLef), inner sep= 8pt] (rBBox) {};

			\node[text width=0.75\textwidth, font=\footnotesize, right= 0.5 cm of rBBox.east] (spiel) {This document is a product of the Sweave system for reproducible research. Sweave creates dynamic, data-driven reports by combining the R Language for Statistical Computing with the \LaTeX\ Document Preparation System. All materials required to recreate this report may be retrieved from from the following archive:\\ \vbox{\centering \url{http://source.sharpsteen.net/downloader}}\vspace{0.5ex}\hrule\vspace{0.5ex}
			{\scriptsize Generated from \jobname.Rnw on \sweaveDateStamp .}%
			\nocite{rProject}\nocite{Sweave}%
			};
			
			\node[draw=black!60,ultra thick, rounded corners, fit = (rBBox.north west) (spiel.north) (spiel.south east) ]{};
		
		\end{tikzpicture}
	}
}% End \SweaveInfo
\fi


% This is used to trace down (pin point) problems
% in latexing a document:
%\tracingall

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Macros for the layout of homework problems and answers.

% Counters and variables for homework problems.
\newcounter{homeworkProblemCounter}
\newcommand{\homeworkProblemName}{}
\newcommand{\homeworkSectionName}{}

% Disable normal section/chapter numbering
\setsecnumdepth{part}

% Macro for setting header and footer messages stating whether problems are
% continued.
\newcommand{\startHeader}[1]{\extramarks{}{#1 continued on next page\ldots}}

\newcommand{\stopHeader}[1]{\extramarks{#1 (Continued)}{}}

% Provides problem environments.
\newenvironment{homeworkProblem}[1][Problem \arabic{homeworkProblemCounter}]%
  {\stepcounter{homeworkProblemCounter}%
   \renewcommand{\homeworkProblemName}{#1}%
   \chapter{\homeworkProblemName}%
   \startHeader{\homeworkProblemName}}%
  {\stopHeader{\homeworkProblemName}}%
  
 \newenvironment{homeworkSection}[2]{%
   \renewcommand{\homeworkSectionName}{#1}%
  \hangfrom{\large\bfseries\homeworkSectionName\hspace{1em}}\noindent#2}%
  {}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Macro definitions

% Derivatives and partial derivatives
\newcommand{\deriv}[3][]{\ensuremath{\frac{d^{#1} #2}{d #3^{#1}}}}
\newcommand{\pderiv}[3][]{\ensuremath{\frac{\partial ^{#1} #2}{\partial #3^{#1}}}}

%% nice inline fractions
\newcommand{\slanty}[2]{\ensuremath{^{#1}\!\!\hspace{1pt}/\hspace{2pt}\!\!_{#2}}\!\!\!\hspace{4pt}\ }

\newenvironment{variables}%
  {\noindent where:\begin{itemize}}%
  {\end{itemize}}%
  
\newcommand{\var}[2]{
	\item[\ensuremath{#1}]{#2}}

% Boxed answers with hanging indent
\newcommand{\ansBox}[1]{\hangfrom{\quad}\fbox{\vbox{#1}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


