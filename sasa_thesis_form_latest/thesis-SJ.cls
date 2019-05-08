\LoadClass[11pt,a4paper]{report}

\RequirePackage{expl3,xparse,kotex,setspace}
\RequirePackage{geometry,tabu,multirow}
\geometry{paperwidth=210mm,%
paperheight=297mm,%
layoutwidth=185mm,
layoutheight=255mm,
textwidth=140mm,
textheight=214mm,
inner=22.5mm,
outer=22.5mm,
top=20.5mm,
bottom=20.5mm,             
layoutvoffset= 21mm,layouthoffset= 12.5mm}

\RequirePackage{iftex}
\ifXeTeX
\newcommand{\namespacing}{\addhangulfontfeature{InterHangul=1em}}
\else
\fi
\ifLuaTeX
\newcommand{\namespacing}{\addhangulfontfeature{InterHangul=1em}}
\else
\fi
\ifPDFTeX
\newcommand{\namespacing}{\interhchar{1em}}
\else
\fi

\makeatletter
\newcommand{\@kortitle}{}
\newcommand{\@engtitle}{}

\newcommand{\@kornameone}{\empty}
\newcommand{\@engnameone}{}
\newcommand{\@hanjanameone}{}

\newcommand{\@kornametwo}{\empty}
\newcommand{\@engnametwo}{}
\newcommand{\@hanjanametwo}{}


\newcommand{\@kornamethree}{\empty}
\newcommand{\@engnamethree}{}
\newcommand{\@hanjanamethree}{}

\newcommand{\@kornamefour}{\empty}
\newcommand{\@engnamefour}{}
\newcommand{\@hanjanamefour}{}

\newcommand{\@studentnumberone}{}
\newcommand{\@studentnumbertwo}{}
\newcommand{\@studentnumberthree}{}
\newcommand{\@studentnumberfour}{}

\renewcommand{\title}[2][\empty]{
\ifx#1\empty
\renewcommand{\@kortitle}{#2}
\else
\renewcommand{\@engtitle}{#1}
\renewcommand{\@kortitle}{#2}
\fi
}
\RequirePackage{ifthen}
\newcommand{\referee}[2][1] {%
    \ifthenelse{\equal{#1}{1}}{\newcommand{\@refereeChief} {#2}} {}%
    \ifthenelse{\equal{#1}{2}}{\newcommand{\@refereeSecond}{#2}} {}% 
}


\newcommand{\authorone}[4][\empty]{
	\ifx#1\empty
	\renewcommand{\@kornameone}{#2}
	\renewcommand{\@engnameone}{#3}
	\renewcommand{\@studentnumberone}{#4}
	\else
	\renewcommand{\@hanjanameone}{#1}
	\renewcommand{\@kornameone}{#2}
	\renewcommand{\@engnameone}{#3}
	\renewcommand{\@studentnumberone}{#4}
	\fi}

\newcommand{\authortwo}[4][\empty]{
	\ifx#1\empty
	\renewcommand{\@kornametwo}{#2}
	\renewcommand{\@engnametwo}{#3}
	\renewcommand{\@studentnumbertwo}{#4}
	\else
	\renewcommand{\@hanjanametwo}{#1}
	\renewcommand{\@kornametwo}{#2}
	\renewcommand{\@engnametwo}{#3}
	\renewcommand{\@studentnumbertwo}{#4}
	\fi}

\newcommand{\authorthree}[4][\empty]{
	\ifx#1\empty
	\renewcommand{\@kornamethree}{#2}
	\renewcommand{\@engnamethree}{#3}
	\renewcommand{\@studentnumberthree}{#4}
	\else
	\renewcommand{\@hanjanamethree}{#1}
	\renewcommand{\@kornamethree}{#2}
	\renewcommand{\@engnamethree}{#3}
	\renewcommand{\@studentnumberthree}{#4}
	\fi}


\newcommand{\authorfour}[4][\empty]{
	\ifx#1\empty
	\renewcommand{\@kornamefour}{#2}
	\renewcommand{\@engnamefour}{#3}
	\renewcommand{\@studentnumberfour}{#4}
	\else
	\renewcommand{\@hanjanamefour}{#1}
	\renewcommand{\@kornamefour}{#2}
	\renewcommand{\@engnamefour}{#3}
	\renewcommand{\@studentnumberfour}{#4}
	\fi}

\renewcommand{\date}[2]{\def\@kordate{#1}\def\@engdate{#2}}

\newcommand{\advisor}[2]{\def\@AdvisorKor{#1}
\def\@AdvisorEng{#2}}
\newcommand{\teacher}[2]{\def\@TeacherKor{#1}
\def\@TeacherEng{#2}}



\newcommand{\frontpage}{
\linespread{1.6}
\thispagestyle{empty}
\begin{center}
{\Large 졸업논문 청구논문}

\vspace{3cm}

{\huge \@kortitle}
\vskip 21pt
{\Large \@engtitle}
\vfill

\ifthenelse{\equal{\@kornameone}{\empty}}{}{{\Large\namespacing\@kornameone} \Large ({\namespacing\@hanjanameone}\quad\@engnameone)\par\@studentnumberone\vspace{1cm}\par}
\ifthenelse{\equal{\@kornametwo}{\empty}}{}{{\Large\namespacing\@kornametwo} \Large ({\namespacing\@hanjanametwo}\quad\@engnametwo)\par\@studentnumbertwo\vspace{1cm}\par}
\ifthenelse{\equal{\@kornamethree}{\empty}}{}{{\Large\namespacing\@kornamethree} \Large ({\namespacing\@hanjanamethree}\quad\@engnamethree)\par\@studentnumberthree\vspace{1cm}\par}
\ifthenelse{\equal{\@kornamefour}{\empty}}{}{{\Large\namespacing\@kornamefour} \Large ({\namespacing\@hanjanamefour}\quad\@engnamefour)\par\@studentnumberfour\vspace{1cm}\par}
\par
세종과학예술영재학교\vspace{0.5cm}

\the\year
\end{center}
}

\newcommand{\secondpage}{
\linespread{1.6}
\thispagestyle{empty}
\begin{center}
\phantom{\Large 졸업논문 청구논문}

\vspace{3cm}

{\huge \@kortitle}
\vskip 21pt
{\Large \@engtitle}
\vfill

{{\fontsize{13pt}{13pt}\selectfont 
[논문제출 전 체크리스트]}}
{\fontsize{11pt}{14pt}\selectfont 
\begin{enumerate}
\item 이 논문은 내가 직접 연구하고 작성한 것이다.\hfill □
\item 인용한 모든 자료(책∙논문∙인터넷자료 등)의 인용표시를 바르게 하였다.\hfill □
\item 인용한 자료의 표현이나 내용을 왜곡하지 않았다.\hfill □
\item 정확한 출처제시 없이 다른 사람의 글이나 아이디어를 가져오지 않았다.\hfill □
\item 논문 작성 중 도표나 데이터를 조작(위조 혹은 변조)하지 않았다.\hfill □
\item 다른 친구와 같은 내용의 논문을 제출하지 않았다.  \hfill □ 
\end{enumerate}
}
\end{center}
}

\newcommand{\thirdpage}{
\thispagestyle{empty}
\linespread{1.6}
\begin{center}
{\huge \@engtitle}
\par\vspace{3cm}
\ifthenelse{\equal{\@kornameone}{\empty}}{}{{\fontsize{13pt}{26pt}\selectfont \@studentnumberone\qquad \@engnameone}\par}
\ifthenelse{\equal{\@kornametwo}{\empty}}{}{{\fontsize{13pt}{26pt}\selectfont \@studentnumbertwo\qquad \@engnametwo}\par}
\ifthenelse{\equal{\@kornamethree}{\empty}}{}{{\fontsize{13pt}{26pt}\selectfont \@studentnumberthree\qquad \@engnamethree}\par}
\ifthenelse{\equal{\@kornamefour}{\empty}}{}{{\fontsize{13pt}{26pt}\selectfont \@studentnumberfour\qquad \@engnamefour}\par}
 \par\bigskip 

{\Large\bfseries Sejong Academy of Science and Arts}
\end{center}
\vspace{3cm}

{\Large
A thesis submitted to the Sejong Academy of Science and Arts in partial fulfillment of the requirements for the graduation. The study was conducted in accordance with Code of Research Ethics.\footnote{Declaration of Ethical Conduct in Research: I, as a graduate student of SASA, hereby declare that I have not committed any acts that may damage the credibility of my research. These include, but are not limited to: falsification, thesis written by someone else, distortion of research findings or plagiarism. I affirm that my thesis contains honest conclusions based on my own careful research under the guidance of my thesis advisor.}
}
\vspace{3cm}

\hfill \begin{minipage}{0.8\textwidth}
\Large 
\tabulinesep=0pt
\begin{tabu}{X[1,l,m]  X[1.5,l,m]}
\multicolumn{2}{l}{\@engdate} \\
Thesis Advisor&  \@AdvisorEng\enspace(signature) \\
Teacher& \@TeacherEng \enspace(signature)
\end{tabu}
\end{minipage}
}

\newcommand{\fourthpage}{
\thispagestyle{empty}
\linespread{1.6}
\begin{center}
{\huge \@kortitle}
\vspace{3cm}
\par
\ifthenelse{\equal{\@kornameone}{\empty}}{}{{\LARGE\selectfont \namespacing\@kornameone}}
\ifthenelse{\equal{\@kornametwo}{\empty}}{\par}{\par\vspace{10pt}{\LARGE\selectfont \namespacing\@kornametwo}}
\ifthenelse{\equal{\@kornamethree}{\empty}}{\par}{\par\vspace{10pt}{\LARGE\selectfont \namespacing\@kornamethree}}
\ifthenelse{\equal{\@kornamefour}{\empty}}{\par}{\par\vspace{10pt}{\LARGE\selectfont \namespacing\@kornamefour}}
\par\vspace{3cm}
\begin{spacing}{2}
{\Large 위 논문은 세종과학예술영재학교 졸업논문으로\\
논문 심사 규정을 통과하였음.}
\end{spacing}
\end{center}
\vspace{3cm}

\hfill \begin{minipage}{0.5\textwidth}
\Large 
\tabulinesep=0pt
\begin{tabu}{X[1,l,m]  X[1.5,r,m]}
\multicolumn{2}{l}{\@kordate} \\
심사위원 &  {\namespacing\@refereeChief}\enspace(인) \\
심사위원 &  {\namespacing\@refereeSecond}\enspace(인) \\
지도교사 &  {\namespacing\@TeacherKor}\enspace(인) 
\end{tabu}
\end{minipage}
 } 
%%%%%%% Acknowledgement %%%%%%%%
\newcommand{\Acknowledgement}[1]{\newpage\pagestyle{empty} \begin{center} \LARGE \textbf{#1} \end{center}\vspace{30pt}}

%%%%%%% Abstract %%%%%%%%%%%
\makeatletter
\newcommand{\KoreanAbstract}{\newpage\noindent\pagestyle{plain}
\linespread{1.6} \vskip 20pt
\begin{center}
\Large\bfseries\@kortitle
\end{center}
\vskip 30pt
\begin{center}
\large 초  록 
\end{center}
\vskip 30pt 
}
\newcommand{\EnglishAbstract}{\newpage\noindent\pagestyle{plain}
\linespread{1.2} \vskip 20pt
\begin{center}
\Large\bfseries\@engtitle
\end{center}
\vskip 30pt 
\begin{center}
\large Abstract 
\end{center}
\vskip 30pt 
}

\newcommand{\KoreanKeywords}[1]{\vfill \noindent\textbf{주제어(키워드, 색인어)}\enspace #1}
\newcommand{\EnglishKeywords}[1]{\vfill \noindent \textbf{Keywords:} #1}
\makeatother




\AtBeginDocument{\frontpage

\newpage
\secondpage
\newpage
\thirdpage
\newpage
\fourthpage}


%%%% chapter, section, tableofcontents %%%%%%

\RequirePackage{etoolbox}
\makeatletter
\patchcmd{\chapter}{\if@openright\cleardoublepage\else\clearpage\fi}{}{}{}
\makeatother

\RequirePackage{titlesec,tocloft,chngcntr,sectsty,chngcntr}
\chaptertitlefont{\huge}
\tocloftpagestyle{empty}

\renewcommand\cftchapafterpnum{\vskip10pt}
\renewcommand\cftsecafterpnum{\vskip8pt}
\renewcommand\cftchapnumwidth{0.7cm}
\renewcommand{\thechapter}{\Roman{chapter}}
\counterwithout{section}{chapter}
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}

\titleformat{\chapter}{\huge\bfseries}{\thechapter}{14pt}{\huge\bfseries}

\renewcommand{\contentsname}{\centering\Large목차}
\renewcommand{\listtablename}{\centering\Large표 목차}
\renewcommand{\listfigurename}{\centering\Large그림 목차}
\makeatletter
%\renewcommand*\l@chapter{\@dottedtocline{1}{1.5em}{2.3em}}

\makeatother

\newcommand{\mainpartstart}{\linespread{1.4}}

%%%% table option %%%%%%%%5
\renewcommand{\arraystretch}{1.5}
\RequirePackage[tableposition=top]{caption}



%%% Captions %%%%
\renewcommand{\figurename}{그림}
\renewcommand{\tablename}{표}
\setlength{\belowcaptionskip}{10pt plus 3pt minus 2pt}


%%%Bibliography%%%

\renewcommand{\bibname}{\bfseries\huge\thechapter\hspace{14pt} 참고 문헌}

\newcommand{\makebibliography}{%
\stepcounter{chapter}
\addcontentsline{toc}{chapter}{\thechapter\hspace{0.25cm}참고 문헌} 
\bibliographystyle{ieeetr}
\bibliography{sasa}%sasa.bib 파일이 필요 
}