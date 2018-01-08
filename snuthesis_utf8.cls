%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 서울대학교 데이터마이닝연구실 구성원들의 박사학위논문 작성을 위해 아래 저작자의 자료를 일부 수정하였습니다.
%% Author: zeta709 (zeta709@gmail.com) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Options
%%
%% ko: 한글 논문을 작성한다.
%%
%% indentfirst: indentfirst 패키지를 사용한다.
%% noindentfirst: indentfirst 패키지를 사용하지 않는다.
%% 이것은 각 section의 첫 단락에서 들여쓰기를 할 지 말 지 결정하는 옵션이다.
%% 한글 논문에서는 사용하는 것이 기본이고,
%% 영문 논문에서는 사용하지 않는 것이 기본이다.
%%
%% easy: 편리한 설정을 위한 옵션이다.
%%
%% draft, final, leqno, fleqn, openright, openay,
%% openbib, oneside, twoside: report class에 전달한다.
%% 이 옵션들의 의미는 LaTeX 입문서에 설명되어 있다.
%%
%% nonfrench, finemath, strictcharcheck: kotex package에 전달한다.
%% 이 옵션들의 의미는 ko.TeX 사용 설명서에 설명되어 있다.
%%
%% under: 학사
%% ms, master: 석사
%% phd, doctor: 박사
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 의존성
%% 반드시 필요한 클래스와 패키지들은 다음과 같다.
%%
%% * report class
%% 기반 클래스이다.
%% * kotex package
%% 영어 논문을 써도 국문 요약을 넣어야 하므로 이 패키지가 필요하다.
%%
%% 그 외에 옵션에 따라 다른 패키지가 필요할 수 있다.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 기타
%% 
%% @snu@ko와 같이 @을 넣는 것은 명령어를 내부 명령어로 사용하는 것이다.
%% 그리고 @snu를 넣은 것은 다른 패키지와 충돌할 가능성을 방지하기 위해서이다.
%%
%% 패키지를 수정할 때는 주석을 읽어보고 수정하는 것이 좋다.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{snuthesis_utf8}

\newif\if@snu@under
\newif\if@snu@ms
\newif\if@snu@phd

\newif\if@snu@ko %% true이면 국문 논문.
\@snu@kofalse %% 기본값은 영문 논문.

\newif\if@snu@indentfirst %% true이면 section의 첫 단락도 들여쓴다.
\@snu@indentfirstfalse
\newif\if@snu@indentoptionset
\@snu@indentoptionsetfalse

\newif\if@snu@easy %% easy 옵션. 이것저것 대신 해줌.
\@snu@easyfalse %% 기본값은 false.

\DeclareOption{under}{\@snu@undertrue \@snu@msfalse \@snu@phdfalse}
\DeclareOption{ms}{\@snu@underfalse \@snu@mstrue \@snu@phdfalse}
\DeclareOption{master}{\@snu@underfalse \@snu@mstrue \@snu@phdfalse}
\DeclareOption{phd}{\@snu@underfalse \@snu@msfalse \@snu@phdtrue}
\DeclareOption{doctor}{\@snu@underfalse \@snu@msfalse \@snu@phdtrue}

\DeclareOption{ko}{\@snu@kotrue}
\DeclareOption{indentfirst}{\@snu@indentfirsttrue \@snu@indentoptionsettrue}
\DeclareOption{noindentfirst}{\@snu@indentfirstfalse \@snu@indentoptionsettrue}
\DeclareOption{easy}{\@snu@easytrue}

\DeclareOption{draft}{\PassOptionsToClass{draft}{report}}
\DeclareOption{final}{\PassOptionsToClass{final}{report}}
\DeclareOption{leqno}{\PassOptionsToClass{leqno}{report}}
\DeclareOption{fleqn}{\PassOptionsToClass{fleqn}{report}}
\DeclareOption{openright}{\PassOptionsToClass{openright}{report}}
\DeclareOption{openany}{\PassOptionsToClass{openany}{report}}
\DeclareOption{openbib}{\PassOptionsToClass{openbib}{report}}
\DeclareOption{oneside}{\PassOptionsToClass{oneside}{report}}
\DeclareOption{twoside}{\PassOptionsToClass{twoside}{report}}
%% report class의 나머지 옵션은 의도적으로 제공하지 않음.

\DeclareOption{nonfrench}{\PassOptionsToClass{nonfrench}{kotex}}
\DeclareOption{finemath}{\PassOptionsToClass{finemath}{kotex}}
\DeclareOption{strictcharcheck}{\PassOptionsToClass{strictcharcheck}{kotex}}
%% hangul, nojosa, hanja 옵션은 의도적으로 제공하지 않음.

\ExecuteOptions{phd}
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% "\if@snu@under"는 학부를 의미함. 
%% "\if@snu@ko"는 한글 논문을 의미함. 

\newcommand{\@snu@koen}{%
	\if@snu@ko \expandafter\@firstoftwo
	\else \expandafter\@secondoftwo
	\fi
}
% Usage: \@snu@koen{한글}{English}

\newcommand{\@snu@msphd}{%
	\if@snu@ms \expandafter\@firstoftwo
	\else \expandafter\@secondoftwo
	\fi
}
% Usage: \@snu@msphd{M.S.}{Ph.D.}

%% ProcessOptions 뒤에 나와야 정상적으로 동작한다.

%% 용지 설정 옵션. b5paper -> B5, a4paper -> A4 
\PassOptionsToClass{b5paper,11pt}{report}

\LoadClass[onecolumn]{report}


\RequirePackage{kotex} %% 국문 요약 때문에 필요하다.
\newcommand{\keywordname}{Keywords}
\newcommand{\keywordnamealt}{주요어}
\newcommand{\studentnumbername}{Student Number}
\newcommand{\studentnumbernamealt}{학번}
\newcommand{\abstractnamealt}{국문초록}
\newcommand{\acknowledgementname}{Acknowledgements}
\newcommand{\bibpagename}{Bibliography}


\if@snu@indentoptionset
    \if@snu@indentfirst
	\RequirePackage{indentfirst}
    \fi
\else
    \if@snu@ko
	\RequirePackage{indentfirst}
    \fi
\fi

\RequirePackage{ifpdf}

%% maketitle 명령 제거.
\let\oldmaketitle=\maketitle
\renewcommand\maketitle{}

%% 여백 설정.
%% a4paper : 210 mm X 297 mm
%% B5 (ISO) : 176 mm X 250 mm
%% B5 (JIS) : 182 mm X 257 mm
%% 4X6배판 : 188 mm X 258 mm
%% 학부 양식에서는 A4를 사용한다.
%% 대학원의 doc 양식은 B5 (JIS)를 쓰고 있다.
%% LaTeX의 b5paper는 ISO 규격으로 약간 작으므로,
%% 직접 고쳐준다.

\if@snu@under
	\setlength{\paperwidth}{210mm}
	\setlength{\paperheight}{297mm}
	\setlength{\textwidth}{160mm} %% 210 mm - (2.5 cm)*2
	\setlength{\textheight}{232mm} %% 297 mm - 3 cm - 3.5 cm
	% 좌우 여백 2.5 cm
	% 상단 여백 3 cm, 하단 여백 3.5 cm
\else
	\setlength{\paperwidth}{182mm}
	\setlength{\paperheight}{257mm}
	\setlength{\textwidth}{132mm} %% 182 mm - (2.5 cm)*2
	\setlength{\textheight}{192mm} %% 257 mm - 3 cm - 3.5 cm
	% 좌우 여백 2.5 cm
	% 상단 여백 3 cm, 하단 여백 3.5 cm
\fi
\setlength{\hoffset}{-1in}
\setlength{\voffset}{-1in}
\setlength{\topmargin}{30mm}
\setlength{\headheight}{0mm}
\setlength{\headsep}{0mm} %% 헤더는 사용하지 않음.
\addtolength{\marginparwidth}{-1.2cm}
%\setlength{\marginparsep}{3mm} %% 상관 없음.
\setlength{\oddsidemargin}{25mm}
\setlength{\evensidemargin}{\oddsidemargin}
\setlength{\footskip}{15mm} % 아래 page number 위치
\ifpdf
	\setlength{\pdfpagewidth}{\paperwidth}
	\setlength{\pdfpageheight}{\paperheight}
\fi

%% 줄간격
\if@snu@under
	%% 배행간 설정이 조금 까다롭다.
	%% 영문은 1.6으로 하고, 한글은 1.75나 2.0으로 해야 한다는 주장도 있다.
	\linespread{1.75} % Doblespacing
\else
	\if@snu@ko
	\linespread{1.6} % 170% (?)
	\else
	\linespread{1.5} % 170% (?)
	\fi
\fi
\let\@snu@oldfootnote=\footnote
\renewcommand{\footnote}[1]{\linespread{1.0}\@snu@oldfootnote{#1}}

%% \@onlypreamble 남용 금지.
%% \@onlypreamble을 남용하는 것은 좋지 않다.
%% 표지에는 영문 성명을 넣고
%% 인준지에는 한글 성명을 넣고 싶은 사람도 있을 것이고,
%% 양쪽 모두에 한글 성명을 사용하고 싶은 사람도 있을 것이다.
%% \makefrontcover와 \makeapproval 사이에서 \author \author*을 사용하여 한글/영문 원하는 형태로 바꾸어 사용할 수 있다.
%% \author과 \author*의 차이는 공백 여부이며 *이 붙은 버전은 이름 사이에 공백이 들어간다.

%% 제목
\let\@oldtitle=\title
\def\title{\@ifstar\@snu@title\@oldtitle}
\def\@snu@title#1{\gdef\@titlealt{#1}}
\def\@titlealt{\@latex@error{No \noexpand\title* given}\@ehc}
%\@onlypreamble{\title}


%% 이름
\let\@oldauthor=\author
\def\author{\@ifstar\@snu@authoralt\@oldauthor}
\def\@snu@authoralt#1{\gdef\@authoralt{#1}}
\def\@authoralt{\@latex@error{No \noexpand\author* given}\@ehc}
%\@onlypreamble{\author}

%% 학번
\def\studentnumber#1{\gdef\@snu@studentnumber{#1}}
\def\@snu@studentnumber{\@latex@error{No \noexpand\studentnumber given}\@ehc}
%\@onlypreamble{\studentnumber}

%% 지도교수
\def\advisor{\@ifstar\@snu@advisoralt\@snu@advisor}
\def\@snu@advisoralt#1{\gdef\@advisoralt{#1}}
\def\@snu@advisor#1{\gdef\@advisor{#1}}
\def\@advisoralt{\@latex@error{No \noexpand\advisor* given}\@ehc}
\def\@advisor{\@latex@error{No \noexpand\advisor given}\@ehc}
%\@onlypreamble{\advisor}

%% 학위 수여일 - 표자에 들어감
\def\graddate#1{\gdef\@snu@graddate{#1}}
\def\@snu@graddate{\@latex@error{No \noexpand\graddate given}\@ehc}
%\@onlypreamble{\graddate}

%% 논문 제출일 - 인준지에 들어감 (학사 제외)
\def\submissiondate#1{\gdef\@snu@submissiondate{#1}}
\def\@snu@submissiondate{\@latex@error{No \noexpand\submissiondate given}\@ehc}
%\@onlypreamble{\submissiondate}

%new
\def\submissiondaten#1{\gdef\@snu@submissiondaten{#1}}
\def\@snu@submissiondaten{\@latex@error{No \noexpand\submissiondaten given}\@ehc}

\def\titlen#1{\gdef\@snu@titlen{#1}}
\def\@snu@titlen{\@latex@error{No \noexpand\titlen given}\@ehc}

\def\phonenumber#1{\gdef\@snu@phonenumber{#1}}
\def\@snu@phonenumber{\@latex@error{No \noexpand\phonenumber given}\@ehc}

\def\authorn#1{\gdef\@snu@authorn{#1}}
\def\@snu@authorn{\@latex@error{No \noexpand\authorn given}\@ehc}

\def\advisorn#1{\gdef\@snu@advisorn{#1}}
\def\@snu@advisorn{\@latex@error{No \noexpand\advisorn given}\@ehc}

%% 논문 인준일 - 인준지에 들어감
\def\approvaldate#1{\gdef\@snu@approvaldate{#1}}
\def\@snu@approvaldate{\@latex@error{No \noexpand\approvaldate given}\@ehc}
%\@onlypreamble{\approvaldate}

%% 위원장, 부위원장, 위원
\def\committeemembers#1#2#3#4#5{%
	\gdef\@snu@committeememberA{#1}
	\gdef\@snu@committeememberB{#2}
	\gdef\@snu@committeememberC{#3}
	\gdef\@snu@committeememberD{#4}
	\gdef\@snu@committeememberE{#5}
}
\def\@snu@committeememberA{}
\def\@snu@committeememberB{}
\def\@snu@committeememberC{}
\def\@snu@committeememberD{}
\def\@snu@committeememberE{}

%% Copied def. of \cleardoublepage from memoir.cls
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
  %\hbox{}\thispagestyle{cleared}%
  \hbox{}\thispagestyle{empty}%
  \newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}

%% 표지
%% 표지 하단 여백은 3 cm (5 mm 작음)
%% 표지 좌우 여백은 2 cm (5 mm 작음)
%% 제목의 linespread 1.3
\newlength{\@snu@covertextheight}
\setlength{\@snu@covertextheight}{\textheight}
\addtolength{\@snu@covertextheight}{5mm}
\newcommand{\makefrontcover}{%
	%% 여백 재조정
	\cleardoublepage
	\addtolength{\textwidth}{10mm}
	\addtolength{\oddsidemargin}{-5mm}
	\addtolength{\evensidemargin}{-5mm}
	\if@twocolumn \@restonecoltrue
	\else \@restonecolfalse \fi
	\onecolumn
	\enlargethispage{5mm}
	\thispagestyle{empty}
	\noindent
	\parbox[][\@snu@covertextheight][s]{\textwidth}{%
		\centering
		\normalfont
		\linespread{1.3}\selectfont
		\fontsize{14pt}{14pt}\selectfont
		\if@snu@ms
			\@snu@koen{공학석사 학위논문}%
			{공학석사 학위논문}\\
		\else
			\@snu@koen{공학박사 학위논문}%
			{공학박사 학위논문}\\
		\fi
		\vspace{2cm}\nointerlineskip
		\fontsize{22pt}{22pt}\selectfont
		\@title\\
		\vspace{1cm}\nointerlineskip
		\fontsize{16pt}{16pt}\selectfont
		\@titlealt\\
		\vspace{5cm}
		\fontsize{14pt}{14pt}\selectfont
		\@snu@graddate\\
		\vspace{4cm}\nointerlineskip

		\fontsize{16pt}{16pt}\selectfont
		서울대학교 대학원\\
		\vspace{5mm}\nointerlineskip
		\fontsize{14pt}{14pt}\selectfont
		산업공학과\\
		\vspace{5mm}\nointerlineskip


		\vspace{1cm}
		\fontsize{16pt}{16pt}\selectfont
		\@snu@authorn
		
		\vfill
		\vspace{2cm}
	}
	%% 여백 원래대로
	\newpage
	\addtolength{\textwidth}{-10mm}
	\addtolength{\oddsidemargin}{5mm}
	\addtolength{\evensidemargin}{5mm}
	\if@restonecol \twocolumn \fi
%% 참고사항
%% center enviornment를 사용하면 하단 여백이 안 맞음.
%% 여백 설정이 조금만 어긋나면 페이지가 인쇄되지 않음.
}

%% 인준지
%% 인준지 하단 여백 2 cm (15 mm 작음)
\newlength{\@snu@approvaltextheight}
\setlength{\@snu@approvaltextheight}{\textheight}
\addtolength{\@snu@approvaltextheight}{15mm}
%% underline length
\newlength{\committeenameunderlinelength}
\setlength{\committeenameunderlinelength}{7cm}
\newlength{\@snu@underlinetmp}
\newlength{\@snu@underlinetmpb}
\newcommand{\committeestyle}[1]{%
	\setlength{\@snu@underlinetmp}{\committeenameunderlinelength}%
	\settowidth{\@snu@underlinetmpb}{#1}%
	\addtolength{\@snu@underlinetmp}{-\@snu@underlinetmpb}%
	\divide \@snu@underlinetmp by 2 %
	\underline{\hspace{\@snu@underlinetmp}#1\hspace{\@snu@underlinetmp}}%
}
\newcommand{\makeapproval}{
	\cleardoublepage
	\if@twocolumn \@restonecoltrue
	\else \@restonecolfalse \fi
	\onecolumn
	\enlargethispage{15mm}
	\thispagestyle{empty}
	\noindent
	\parbox[][\@snu@approvaltextheight][s]{\textwidth}{%
		\centering
		\normalfont
		\linespread{1.3}\selectfont

		\vspace{1cm}
		\fontsize{\if@snu@ko 16pt \else 22pt \fi}%
		{22pt}\selectfont
		\@title\\
		\vspace{1cm}\nointerlineskip
		\fontsize{16pt}{16pt}\selectfont
		\@titlealt\\
		\vspace{1.5cm}\nointerlineskip
		\fontsize{14pt}{14pt}\selectfont
		지도교수\quad\@snu@advisorn\\
		\vspace{1cm}\nointerlineskip
		\fontsize{16pt}{16pt}\selectfont
		이 논문을 %
		공학\@snu@msphd{석사}{박사} %
		학위논문으로 제출함\\
		\vspace{5mm}\nointerlineskip
		\fontsize{14pt}{14pt}\selectfont
		\@snu@submissiondate\\
		\vspace{1cm}\nointerlineskip
		\fontsize{16pt}{16pt}\selectfont
		서울대학교 대학원\\
		\vspace{5mm}\nointerlineskip
		\fontsize{14pt}{14pt}\selectfont
		산업공학과\\
		\vspace{5mm}\nointerlineskip
		\fontsize{16pt}{16pt}\selectfont
		\@snu@authorn\\
		\vspace{1cm}\nointerlineskip
		\@authoralt의 %
		공학\@snu@msphd{석사}{박사} %
		학위논문을 인준함\\
		\vspace{5mm}\nointerlineskip
		\fontsize{14pt}{14pt}\selectfont
		\@snu@approvaldate\\
		\vfill
		\fontsize{14pt}{14pt}\selectfont
		\begin{tabular}[b]{cc}
		위 \hfill 원 \hfill 장 & \committeestyle{\@snu@committeememberA} (인)\\[3mm]
		부위원장               & \committeestyle{\@snu@committeememberB} (인)\\[3mm]
		위 \hfill 원           & \committeestyle{\@snu@committeememberC} (인)\\[3mm]
		\if@snu@ms\else
		위 \hfill 원           & \committeestyle{\@snu@committeememberD} (인)\\[3mm]
		위 \hfill 원           & \committeestyle{\@snu@committeememberE} (인)\\
		\fi
		\end{tabular}
		\@snu@msphd{\vspace{2cm}}{\vspace{1cm}}

	}
	\newpage
	\if@restonecol \twocolumn \fi
%% 참고사항
%% center enviornment를 사용하면 하단 여백이 안 맞음.
%% 여백 설정이 조금만 어긋나면 페이지가 인쇄되지 않음.
}



\usepackage{tikz}
\newcommand*\circled[1]{\tikz[baseline=(char.base)]{
  \node[shape=circle,draw,inner sep=0.5pt] (char) {#1};}}
  
\newcommand{\makeagreement}{
	\cleardoublepage
	\if@twocolumn \@restonecoltrue
	\else \@restonecolfalse \fi
	\onecolumn
	\enlargethispage{15mm}
	\thispagestyle{empty}
	
	\begin{center}{\fontsize{16}{16}\selectfont {\bfseries {학위논문 원문제공 서비스에 대한 동의서}} }\end{center}

	\vspace{0.25cm}
	\fontsize{12}{12}\selectfont {본인의 학위논문에 대하여 서울대학교가 아래와 같이 학위논문 저작물을 제공하는 것에 동의합니다.}

	\fontsize{11}{11}\selectfont {
	\begin{flushleft}{
	\vspace{0.25cm}
	1. 동의사항
	
	\vspace{0.2cm}
	\circled{1} 본인의 논문을 보존이나 인터넷 등을 통한 온라인 서비스 목적으로 복제할 경우 저작물의 내용을 변경하지 않는 범위 내에서의 복제를 허용합니다.
	
	\vspace{0.1cm}
	\circled{2} 본인의 논문을 디지털화하여 인터넷 등 정보통신망을 통한 논문의 일부 또는 전부의 복제$\cdot$배포 및 전송 시 무료로 제공하는 것에 동의합니다.
	
	\vspace{0.5cm}
	2. 개인(저작자)의 의무
	
	\vspace{0.2cm}
	본 논문의 저작권을 타인에게 양도하거나 또는 출판을 허락하는 등 동의 내용을 변경하고자 할 때는 소속대학(원)에 공개의 유보 또는 해지를 즉시 통보하겠습니다.
	
	\vspace{0.5cm}
	3. 서울대학교의 의무
	
	\vspace{0.2cm}
	\circled{1} 서울대학교는 본 논문을 외부에 제공할 경우 저작권 보호장치(DRM)를 사용하여야 합니다.
	
	\vspace{0.1cm}
	\circled{2} 서울대학교는 본 논문에 대한 공개의 유보나 해지 신청 시 즉시 처리해야 합니다.	
	}\end{flushleft}
	}
	
	\begin{flushleft}{{\bfseries 논문 제목 : \@snu@titlen} \par}\end{flushleft}
	
	\begin{flushright}{

	$\vbox{
		\halign{
			## & : ## \hfill \cr
        	학\hfill위\hfill구\hfill분	& { \bfseries {박사}}\cr
        	학\hfill과					& { 산업공학과}\cr
            학\hfill번					& { \@snu@studentnumber}\cr
            연\hfill락\hfill처			& { \@snu@phonenumber}\cr
            저\hfill작\hfill자			& { \@snu@authorn \hspace*{15mm}\small{(인)}\hspace*{5mm}}\cr
	}}$
	}\end{flushright}
	
	\begin{center}{
	제 출 일 : \@snu@submissiondaten
	
	\vspace{0.5cm}
	\fontsize{13}{13}\selectfont {\bfseries{서울대학교총장 귀하}}
	
	}\end{center}
	
	\newpage
	\if@restonecol \twocolumn \fi

}
	
	



%% keyword
\newcommand{\@snu@keyword}{}
\newcommand{\keyword}[1]{\renewcommand{\@snu@keyword}{#1}}

\def\phantomsection{}

%% abstract
\renewenvironment{abstract}{%
	\if@snu@ko
		\chapter*{\abstractname}
		\@mkboth{\MakeUppercase\abstractname}%
			{\MakeUppercase\abstractname}%
		\addcontentsline{toc}{chapter}{\abstractname}%
	\else
		\if@openright \cleardoublepage
		\else \clearpage \fi
		\@afterindentfalse
		\phantomsection
		\addcontentsline{toc}{chapter}{\abstractname}
	
		{%
			\centering
			\normalfont
			\linespread{1.0}
			\fontsize{16pt}{16pt}\selectfont
			\textbf{\abstractname}\par\nobreak
		}
		
		
		
%% customized		
\begin{center}{\fontsize{22}{22}\selectfont \@title}\end{center}
	\vspace*{10pt}
	\begin{flushright}
	{\fontsize{14}{14}\selectfont
	
		{\@author \par}
		{Department of Industrial Engineering \par}
		{The Graduate School \par}
		{Seoul National University \par}

	}
	\end{flushright}
%% customized
	
	
	
	
		\vspace{1cm}
		\@afterheading
	\fi
}{%
	\vfill\vspace*{\fill}
	% better than "\vfill", "\null\vfill", \vspace*{0pt}\vfill", etc.
	\noindent
	{\bfseries \keywordname}:~\@snu@keyword
	\if@snu@under\else
	\\
	\noindent
	{\bfseries \studentnumbername}:~\@snu@studentnumber
	\fi
	\newpage
}





%% customized
\newenvironment{bibpage}%
{
	\if@openright \cleardoublepage
	\else \clearpage \fi
	\@afterindentfalse
	\phantomsection
	\addcontentsline{toc}{chapter}{\bibpagename}
	\@afterheading
}
%% customized






%% keywordalt
\newcommand{\@snu@keywordalt}{}
\newcommand{\keywordalt}[1]{\renewcommand{\@snu@keywordalt}{#1}}

%% abstractalt
\newenvironment{abstractalt}%
{%
	\if@snu@ko
		\chapter*{\abstractnamealt}
		\@mkboth{\MakeUppercase\abstractnamealt}%
			{\MakeUppercase\abstractnamealt}%
		\addcontentsline{toc}{chapter}{\abstractnamealt}%
	\else
		\if@openright \cleardoublepage
		\else \clearpage \fi
		\@afterindentfalse
		\phantomsection
		\addcontentsline{toc}{chapter}{\abstractnamealt}
		{%
			\centering
			\normalfont
			\linespread{1.0}
			\fontsize{16pt}{16pt}\selectfont
			\textbf{\abstractnamealt}\par\nobreak
		}
		\vspace{2cm}
		\@afterheading
	\fi
}{%
	\vfill\vspace*{\fill}
	% better than "\vfill", "\null\vfill", \vspace*{0pt}\vfill", etc.
	\noindent
	{\bfseries \keywordnamealt}:~\@snu@keywordalt
	\if@snu@under\else
	\\
	\noindent
	{\bfseries \studentnumbernamealt}:~\@snu@studentnumber
	\fi
  	\newpage
}

%% 감사의 글
\newcommand{\acknowledgement}{%
	\if@snu@ko
		\if@openright \cleardoublepage
		\else \clearpage \fi
		\@afterindentfalse
		\phantomsection
		\addcontentsline{toc}{chapter}{\acknowledgementname}
		{%
			\centering
			\normalfont
			\linespread{1.0}
			\fontsize{16pt}{16pt}\selectfont
			\textbf{\acknowledgementname}\par\nobreak
		}
		\vspace{2cm}
		\@afterheading
	\else
		\chapter*{\acknowledgementname}
		\@mkboth{\MakeUppercase\acknowledgementname}%
			{\MakeUppercase\acknowledgementname}%
		\addcontentsline{toc}{chapter}{\acknowledgementname}%
	\fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 캡션 스타일
%% - 캡션에서 colon(:)을 제거해야 한다.
%% - report 클래스에서 베끼고 :만 지움.
%% - 정렬은 알아서 됨.
%% TODO
%% - caption의 마지막에 마침표가 있는지 체크
%% - 표의 캡션에는 마침표가 없어야 하고
%% - 그림의 캡션에는 있어야 함.

\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1 #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1 #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}

% 한글 논문과 영문 논문의 서식이 다르다.
% 따로 만들어야 한다.
\if@snu@ko
    %% report 클래스에서 약간 고침
    %% chapter* style: style of toc, lof, lot, etc.
    \def\@makeschapterhead#1{%
      {%
	\centering
	\normalfont
	\interlinepenalty\@M
	\linespread{1.0}
	\fontsize{22pt}{22pt}\selectfont
	\bfseries #1\par\nobreak
	\vspace{2cm}
      }}
    %% report 클래스에서 약간 고침
    %% chapter style
    \def\@makechapterhead#1{%
      {%
	\centering
	\normalfont
	\linespread{1.0}\selectfont
	\ifnum \c@secnumdepth >\m@ne
	    \fontsize{16pt}{16pt}\selectfont
	    \bfseries 제\space\thechapter\space장\space
	\fi
	\interlinepenalty\@M
	\fontsize{16pt}{16pt}\selectfont
	\bfseries #1\par\nobreak
	\vspace{2cm}
      }}
\else
    %% report 클래스에서 약간 고침
    %% chapter* style: style of toc, lof, lot, etc.
    \def\@makeschapterhead#1{%
      \vspace*{1cm}% 챕터 숫자 위의 공간 원래 3cm
      \vspace{-\f@baselineskip} % 정확한 조절을 위해 필요
      {%
	\parindent \z@ \raggedright
	\normalfont
	\interlinepenalty\@M
	\linespread{1.0}
	\fontsize{20pt}{20pt}\selectfont % 원래 22pt
	\bfseries #1\par\nobreak
	\vspace{2cm}
      }}
    %% report 클래스에서 약간 고침
    %% chapter style
    \def\@makechapterhead#1{%
      \vspace*{1cm}% 챕터 숫자 위의 공간
      \vspace{-\f@baselineskip} % 정확한 조절을 위해 필요
      {%
	\parindent \z@ \raggedright \normalfont
	\linespread{1.0}\selectfont
	\ifnum \c@secnumdepth >\m@ne
	    \fontsize{16pt}{16pt}\selectfont
	    \bfseries \@chapapp\space \thechapter
	    \par\nobreak
	    \vspace{1cm}
	\fi
	\interlinepenalty\@M
	\fontsize{20pt}{20pt}\selectfont
	\bfseries #1\par\nobreak
	\vspace{2cm}
      }}
\fi

% section style
\renewcommand\section{%
	\@startsection {section}{1}{\z@}%
	{-3.5ex \@plus -1ex \@minus -.2ex}%
	{2.3ex \@plus.2ex}%
	{\normalfont\fontsize{14pt}{14pt}\selectfont\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
	{-3.25ex\@plus -1ex \@minus -.2ex}%
	{1.5ex \@plus .2ex}%
	{\normalfont\fontsize{12pt}{12pt}\selectfont\bfseries}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% template과 직접적인 관련이 없는 설정으로 이것저것 대신 해준다.

\if@snu@easy
	% KLDP에서 가져온 자료.
	% http://faq.ktug.or.kr/faq/pdflatex%B0%FAlatex%B5%BF%BD%C3%BB%E7%BF%EB
	\ifpdf
		% \input glyphtounicode.tex\pdfgentounicode=1 %type 1 font사용시
		\usepackage{dhucs-cmap} % true type 글꼴 사용시
		\pdfmapfile{+unttf-pdftex-dhucs.map} % truetype글꼴사용시
		\usepackage[pdftex,unicode]{hyperref}
		\usepackage[pdftex]{graphicx}
		\usepackage[pdftex,svgnames]{xcolor}
	\else
		\usepackage[dvipdfmx,unicode]{hyperref}
		\usepackage[dvipdfmx]{graphicx}
		\usepackage[dvipdfmx,svgnames]{xcolor}
	\fi
	%KC2008의 공식예제인 first.tex와 ko.TEX v0.1.0 사용 설명서 참조
	%hangul-ucs 4.0 이전 버전에서는 dhucs-ucshyper라는 부가 패키지가 제공되었으나, 
	%hyperref의 기능 향상에 따라 불필요해졌으므로 
	%ko.TEX에서는 이를 제공하지 않는다.
\fi
