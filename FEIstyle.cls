\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{FEIstyle}[2020/05/13 v. 1.6.1 Thesis template - FEI STUBA]

% parse arguments
\DeclareOption{sp}{\def\typPraceSkr{s}}
    \def\isThesis{0}
    \def\typPraceEn{Seminar paper}
    \def\typPrace{Semin\a'arna pr\a'aca}
    \def\typPraceTemp{semin\'{a}rnu pr\'{a}cu}
    \def\typPraceTempII{semin\'{a}rnej práce}

\newcommand*\myset{a4paper,12pt}
\newcommand*\parentclass{article}

\def\FEIenglish{0}
\DeclareOption{en}{
    \def\FEIenglish{1} 
}

\def\FEIgen{0}
\DeclareOption{m}{
    \def\FEIgen{1} 
}
\DeclareOption{z}{
    \def\FEIgen{2} 
}

\ProcessOptions
\ExecuteOptions{dp}
\LoadClass[\myset]{\parentclass}

\usepackage[overload]{textcase}
\usepackage[acronym,nopostdot,nogroupskip,nonumberlist]{glossaries}

% we should use ISO 690 & 690-2 http://www.fei.stuba.sk/sk/kniznica-fei/vzory-bibliografickych-odkazov-a-citovanie.html?page_id=1756 
% package for biblatex https://github.com/michal-h21/biblatex-iso690
\usepackage[backend=biber,style=iso-numeric,autolang=other,bibencoding=utf8,seconds=true]{biblatex}

\ifnum\FEIenglish=0
    \usepackage[slovak]{babel}
\else
    \usepackage[english]{babel}
\fi

\usepackage[utf8]{inputenc}

\usepackage[style=slovak]{csquotes}
\usepackage{microtype}
\usepackage{times}

\usepackage[immediate]{silence}
\WarningFilter[temp]{latex}{Command}
\usepackage{sectsty}
\DeactivateWarningFilters[temp]

\usepackage{chngcntr}
\usepackage{tocloft}
\usepackage{rotating}
\usepackage{anysize}
\usepackage{xifthen}
\usepackage{amsmath}
\usepackage{ifmtarg}
\usepackage{xstring}
\usepackage[compact]{titlesec}
\usepackage{xcolor}
\usepackage{listings}
\usepackage{lmodern}
\usepackage{changepage}
\usepackage{scrextend}
\usepackage{xstring}
\usepackage{url}
\usepackage{enumitem}
\usepackage{caption}
\usepackage{subcaption}
\usepackage[bookmarksopen,colorlinks,plainpages=false,urlcolor=blue,hypertexnames=false,unicode]{hyperref}
\usepackage{algorithm}
\usepackage{algorithmic}
\usepackage[owncaptions]{vhistory}

\renewcommand{\vhhistoryname}{História zmien}
\renewcommand{\vhversionname}{Verzia}
\renewcommand{\vhdatename}{Dátum}
\renewcommand{\vhauthorname}{Autor}
\renewcommand \vhAuthorColWidth{3cm}
\renewcommand{\vhchangename}{Zmeny}

\usepackage{array, makecell}

\renewcommand{\arraystretch}{1.5}
\renewcommand\theadfont{\bfseries}

\usepackage[fontsize=12pt]{fontsize}
\usepackage[a4paper, margin=2.5cm]{geometry}

\newboolean{isThesis}

\IfEqCase*{\isThesis}{
    {0}{\setboolean{isThesis}{false}}
    {1}{\setboolean{isThesis}{true}}
}

% deine global variables
\def\@nedefinovane{! UNDEFINED: \textbackslash}

\def\@skola{Slovensk\a'a technick\a'a  univerzita v Bratislave}
\def\FEIschool#1{\def\@skola{#1}}
\newcommand{\printSkola}{\@skola}
\def\@skolaEn{Slovak University of Technology in Bratislava}
\def\FEIschoolEn#1{\def\@skolaEn{#1}}
\newcommand{\printSkolaEn}{\@skolaEn}

\def\@fakulta{Fakulta elektrotechniky a informatiky}
\def\FEIfaculty#1{\def\@fakulta{#1}}
\newcommand{\printFakulta}{\@fakulta}

\def\@fakultaEn{Faculty of Electrical Engineering and Information Technology}
\def\FEIfacultyEn#1{\def\@fakultaEn{#1}}
\newcommand{\printFakultaEn}{\@fakultaEn}

\def\@autor{\@nedefinovane FEIauthor}
\def\FEIauthor#1{\def\@autor{#1}}
\newcommand{\printAutor}{\@autor}

\def\@lecturer{\@nedefinovane FEIlecturer}
\def\FEIlecturer#1{\def\@lecturer{#1}}
\newcommand{\printLecturer}{\@lecturer}

\def\@ta{\@nedefinovane FEITA}
\def\FEITA#1{\def\@ta{#1}}
\newcommand{\printTa}{\@ta}

\def\@course{\@nedefinovane FEIcourse}
\def\FEIcourse#1{\def\@course{#1}}
\newcommand{\printCourse}{\@course}

\def\@courseEn{\@nedefinovane FEIcourseEn}
\def\FEIcourseEn#1{\def\@courseEn{#1}}
\newcommand{\printCourseEn}{\@courseEn}

\def\@courseTag{\@nedefinovane FEIcourseTag}
\def\FEIcourseTag#1{\def\@courseTag{#1}}
\newcommand{\printCourseTag}{\@courseTag}

\def\@nazov{\@nedefinovane FEItitle}
\def\FEItitle#1{\def\@nazov{#1}}
\newcommand{\printNazov}{\@nazov}

\def\@nazovEn{\@nedefinovane FEItitleEn}
\def\FEItitleEn#1{\def\@nazovEn{#1}}
\newcommand{\printNazovEn}{\@nazovEn}

\def\@den{\number\day}
\def\@mesiac{\number\month}
\def\@rok{\number\year}
\newcommand\FEIdate[3]{\def\@den{#1}
    \def\@mesiac{#2}
    \def\@rok{#3}}
\newcommand{\printDatum}{\@den.\@mesiac.\@rok}

\def\@studijnyProgram{Aplikovan\a'a informatika}
\def\FEIstudyProgramme#1{\def\@studijnyProgram{#1}}
\newcommand{\printStudijnyProgram}{\@studijnyProgram}

\def\@studijnyProgramEn{Applied Informatics}
\def\FEIstudyProgrammeEn#1{\def\@studijnyProgramEn{#1}}
\newcommand{\printStudijnyProgramEn}{\@studijnyProgramEn}

\def\@mesto{Bratislava}
\def\FEIplace#1{\def\@mesto{#1}}
\newcommand{\printMesto}{\@mesto}

\newcommand\projectName{Hotelier}

%definovanie globalnych nastaveni
\pagenumbering{arabic}  
\pagestyle{plain}
\parindent=0.8cm
\parskip=1pt
\linespread{1.0}
\hypersetup{colorlinks, citecolor=black, filecolor=black, linkcolor=black, urlcolor=black}
\sectionfont{\bf\fontsize{22pt}{1.0}\selectfont}
\subsectionfont{\bf\fontsize{16pt}{1.0}\selectfont}
\subsubsectionfont{\bf\fontsize{14pt}{1.0}\selectfont}

\titlespacing*\section{0pt}{24pt}{12pt}
\titlespacing*\subsection{6pt}{12pt}{6pt}
\titlespacing*\subsubsection{12pt}{10pt}{0pt}

\lstset{
  basicstyle=\scriptsize\ttfamily,
  columns=flexible, % removes spaces
  breaklines=true,
  breakatwhitespace=true,
  showstringspaces=false, % removes ␣ character from " "
  captionpos=b % caption below text
}

% http://tex.stackexchange.com/questions/588/how-can-i-change-the-margins-for-only-part-of-the-text
\def\changemargin#1#2{\list{}{\rightmargin#2\leftmargin#1}\item[]}
\let\endchangemargin=\endlist 

\newcommand{\dir}[3]{
\begin{description}[topsep=0pt,leftmargin=0.5cm,style=nextline]
  \item[#1] $\cdot$ #2
\end{description}
\ifx&#3&%
   % #3 is empty
\else
    \vspace{-5mm}
    \begin{changemargin}{0.5cm}{0cm}
        #3
    \end{changemargin}
    \vspace{-4mm}
\fi
}

\newcommand{\file}[2]{
    \begin{description}[topsep=0pt,leftmargin=0.5cm,font=\normalfont\itshape,style=nextline]
        \item[#1] $\cdot$ #2
    \end{description}
}

\newcommand\FEItitlePage{
    \setcounter{page}{1}
    \pagestyle{empty}
    \begin{changemargin}{0.19cm}{0.19cm} 
        \IfEqCase*{\FEIenglish}{
            {0}{
                \def\@skolaTemp{\printSkola}
                \def\@skolaFakulta{\printFakulta}
                \def\@skolaStudPr{\printStudijnyProgram}
                \def\@skolaStudPrCisl{\printNazovStudijnehoOdboru}
                \def\@skolaNazovPrace{\printNazov}
                \def\@skolaTypPrace{\typPrace}
                \def\@tempStudProgr{\v{S}tudijn\a'y program:}
                \def\@tempVedPrace{Ved\a'uci z\a'avere\v{c}nej pr\a'ace:}
                \def\@tempKonzultanta{Konzultant:}
                \ifthenelse{\boolean{isThesis}}
                {}{
                    \def\@skolaCourse{\printCourseTag\enspace--\enspace\printCourse}
                    \def\@skolaLecturer{\printLecturer}
                    \def\@skolaTa{\printTa}
                    \def\@tempCourse{Predmet:}
                    \def\@tempLecturer{Predn\a'a\v{s}aj\a'uci:}
                    \def\@tempTa{Cvi\v{c}iaci:}
                }
            }              
            {1}{
                \def\@skolaTemp{\printSkolaEn}
                \def\@skolaFakulta{\printFakultaEn}
                \def\@skolaStudPr{\printStudijnyProgramEn}
                \def\@skolaStudPrCisl{\printNazovStudijnehoOdboruEn}
                \def\@skolaSkolPrac{\printSkoliacePracoviskoEn}
                \def\@skolaEvCislo{\fontsize{12pt}{1.0}\selectfont Registration number: \printEvidencneCislo}       
                \def\@skolaNazovPrace{\printNazovEn}
                \def\@skolaTypPrace{\typPraceEn}
                \def\@tempStudProgr{Study Programme:}
                %\def\@tempCisloStud{Field Number:}
                \def\@tempNazovStud{Study Field:}
                \def\@tempSkolPracov{Training Workplace:}
                \def\@tempVedPrace{Supervisor:}  
                \def\@tempKonzultanta{Consultant:}
                \ifthenelse{\boolean{isThesis}}
                {}{
                    \def\@skolaCourse{\printCourseTag\enspace--\enspace\printCourseEn}
                    \def\@skolaLecturer{\printLecturer}
                    \def\@skolaTa{\printTa}
                    \def\@tempCourse{Course:}
                    \def\@tempLecturer{Lecturer:}
                    \def\@tempTa{Teaching assistant:}
                }
            }
            }[]
        \begin{center}
            {\fontsize{14pt}{1.0}\selectfont \bf \MakeTextUppercase{\@skolaTemp}\newline \MakeTextUppercase{\@skolaFakulta}}    
        \end{center}
        \vspace{10mm}
        {
            \ifthenelse{\boolean{isThesis}}
            {
                \fontsize{12pt}{1.0}\selectfont \@skolaEvCislo
            }{}
        }    
        \vspace{60mm}
        \begin{center}
            {\fontsize{16pt}{1.0}\selectfont \bf{\MakeTextUppercase{\@skolaNazovPrace}}} \\[1em]
            {\bf\fontsize{16pt}{1.0}\selectfont  \MakeTextUppercase{\@skolaTypPrace}}
        \end{center}
        \vspace{\fill}
        \begin{tabbing}
            \hspace*{5cm}\= \kill
            \@tempStudProgr \> \@skolaStudPr \\
            \ifthenelse{\boolean{isThesis}}
            {
             \@tempNazovStud \> \@skolaStudPrCisl \\
             \@tempSkolPracov \> \@skolaSkolPrac \\
             \@tempVedPrace \> \printVeduciZaverecnejPrace \\
             \IfEqCase*{\@tempKonzultant}{
                    {0}{}
                    {1}{\@tempKonzultanta \> \printKonzultant}
                    }[]
            }{\@tempCourse \> \parbox[t]{9cm}{\@skolaCourse\vspace{1ex}} \\ %TODO use this for abstract minipage
                \@tempLecturer \> \@skolaLecturer \\
                \@tempTa \> \@skolaTa \\
            }
        \end{tabbing}
        \vspace{\fill}
        \begin{flushleft}
            {\fontsize{14pt}{1.0}\selectfont \bf
                \printMesto \
                \@rok
                \hfill
                \printAutor}
        \end{flushleft}
    \end{changemargin}
    \newpage
}
        
\newcommand\FEIcontent{ 
    \pagestyle{plain}
    \addtocontents{toc}{\protect\thispagestyle{plain}}
    \tableofcontents
    \newpage
}
        
\newcommand\listoffiguresandtables{
    \IfEqCase*{\FEIenglish}{
        {0}{\renewcommand{\cftfigpresnum}{Obr\'{a}zok\ }
            \renewcommand{\cfttabpresnum}{Tabu\v{l}ka\ }}
        {1}{\renewcommand{\cftfigpresnum}{Figure\ }
            \renewcommand{\cfttabpresnum}{Table\ }}
        }[] 
    \newlength{\mylenf}
    \settowidth{\mylenf}{\cftfigpresnum}
    \setlength{\cftfignumwidth}{\dimexpr\mylenf+3em}
    \setlength{\cfttabnumwidth}{\dimexpr\mylenf+3em}
    \IfEqCase*{\FEIenglish}{
        {0}{\section*{Zoznam obr\'{a}zkov a tabuliek}}
        {1}{\section*{List of Figures and Tables}}
        }[]    
    \phantomsection
    \@starttoc{lof}
    \bigskip
    \@starttoc{lot}
}
        
\newcommand\FEIlistOfTables{
    \pagestyle{plain}        
    \listoftables
    \newpage
    \pagestyle{plain}
}
        
\newcommand\FEIlistOfFigures{   
    \pagestyle{plain}
    \listoffigures
    \newpage
    \pagestyle{plain}
}

\newcommand\FEIlistOfListings{    
    \IfEqCase*{\FEIenglish}{
        {0}{\def\@zoznamList{Zoznam v\a'ypisov}}
        {1}{\def\@zoznamList{List of listings}}
        }[]
    \renewcommand{\lstlistlistingname}{\bf\fontsize{22pt}{1.0}\selectfont \@zoznamList}
    \pagestyle{plain}
    \lstlistoflistings
    \newpage
    \pagestyle{plain}
}
        
\newcommand\FEIlistOfFiguresAndTables{ 
    \pagestyle{plain}
    \listoffiguresandtables
    \newpage
    \pagestyle{plain}
}

\renewcommand{\glsnamefont}[1]{\textbf{#1}}

\newcommand\FEIglossaries[1]{
    \setglossarystyle{long}
    \makeglossaries
    \loadglsentries{#1}
    \setlength\LTleft{8pt}
}
        
\newcommand\FEIlistOfGlossaries{  
    \pagestyle{plain}
    \IfEqCase*{\FEIenglish}{
        {0}{\def\@zoznamZn{Zoznam skratiek}}
        {1}{\def\@zoznamZn{List of Abbreviations}}
    }[]
    %\addtocontents{lof}{\protect\thispagestyle{plain}}
    %\addtocontents{lot}{\protect\thispagestyle{plain}}
    \printglossary[type=\acronymtype,title={\@zoznamZn}]
    \newpage
    \pagestyle{plain}
}

\newcommand\FEIcore[1]{
    \let\stdsection\section
    \renewcommand\section{\newpage\stdsection}  
    \newpage
    \input{#1}
}

\newcommand\FEIbibliography{    
    \newpage
    \cleardoublepage
    \phantomsection 
    \IfEqCase*{\FEIenglish}{
        {0}{\def\@zoznamBib{Zoznam pou\v{z}itej literat\'{u}ry}}
        {1}{\def\@zoznamBib{Bibliography}}
        }[]
    \addcontentsline{toc}{section}{\@zoznamBib}
    \renewcommand\refname{\@zoznamBib} 

    \renewcommand\multinamedelim{\addcomma\space}
    \renewcommand\finalnamedelim{\addspace\bibstring{and}\space}
    % below you can set padding in bibliography
    \setlength{\bibhang}{0pt}
    \printbibliography
}

\newcounter{listOfAppendix}

\IfEqCase*{\FEIenglish}{
    {0}{\def\@zoznamPri{Pr\'{i}lohy}}
    {1}{\def\@zoznamPri{Appendix}}
    }[]

\newcommand\FEIlistOfAppendix{
    \newpage
    \renewcommand \thesection{\Alph{section}}
    \setcounter{section}{0}
    \setcounter{subsection}{0}
    \setcounter{subsubsection}{0}
    \renewcommand \thetable{\Alph{section}}
    \setcounter{table}{0}
    \counterwithin{table}{section}
    \setcounter{figure}{0}
    \counterwithin{figure}{section}
    \setcounter{algorithm}{0}
    \counterwithin{algorithm}{section}
    \setcounter{lstlisting}{0}
    \counterwithin{lstlisting}{section}
    % \setcounter{page}{1}
    \cleardoublepage
    \phantomsection 
    \addcontentsline{toc}{section}{\@zoznamPri}
    \listofpriloh
}

\newcommand\FEIappendix[2]{ 
    \newpage
    \cleardoublepage    
    \phantomsection 
    \section{#1}    
    \noindent
    \pridajPrilohu{#1}  
    \noindent\input{#2}
}
        
\newlistof{priloh}{pri}{\@zoznamPri}
\newcommand{\pridajPrilohu}[1]{
    \refstepcounter{priloh}
    \addcontentsline{pri}{priloh}{\protect\numberline{\Alph{section}} #1}\par
}
        
\newcommand\FEIpdfInfo{ 
    \hypersetup{pdfinfo={
        Title={\printNazov},
        Author={\printAutor},
        Subject={\typPrace}
    }}
}

\newcommand\DocHistory[1]{ 
    \pagestyle{plain}
    \input{#1}
    \newpage
}
\endinput
