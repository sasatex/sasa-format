\LoadClass[10pt,a4paper]{report}

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

\newcommand{\@korname}{}
\newcommand{\@engname}{}
\newcommand{\@hanjaname}{}

\newcommand{\@studentnumber}{}

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

\renewcommand{\author}[3][\empty]{
\ifx#1\empty
\renewcommand{\@korname}{#2}
\renewcommand{\@engname}{#3}
\else
\renewcommand{\@hanjaname}{#1}
\renewcommand{\@korname}{#2}
\renewcommand{\@engname}{#3}
\fi}

\renewcommand{\date}[2]{\def\@kordate{#1}\def\@engdate{#2}}

\newcommand{\advisor}[2]{\def\@AdvisorKor{#1}
\def\@AdvisorEng{#2}}
\newcommand{\teacher}[2]{\def\@TeacherKor{#1}
\def\@TeacherEng{#2}}

\newcommand{\studentnumber}[1]{\renewcommand{\@studentnumber}{#1}}

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
{\Large\namespacing\@korname} \Large ({\namespacing\@hanjaname}\quad \@engname)

\@studentnumber\vspace{1cm}

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
\vspace{3cm}

{\fontsize{13pt}{26pt}\selectfont \@studentnumber\qquad \@engname} \bigskip 

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

{\LARGE\selectfont \namespacing\@korname}
\vspace{3cm}
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
\linespread{1.6} \addcontentsline{toc}{chapter}{초록}\vskip 20pt
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
\linespread{1.2} \addcontentsline{toc}{chapter}{Abstract}\vskip 20pt
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


%%%% tableofcontents %%%%%%
\makeatletter
%\renewcommand*\l@chapter{\@dottedtocline{1}{1.5em}{2.3em}}

\makeatother

\newcommand{\mainpartstart}{\linespread{1.2}}

%%%% table option %%%%%%%%5
\RequirePackage[tableposition=top]{caption}
