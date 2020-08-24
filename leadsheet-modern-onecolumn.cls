% --------------------------------------------------------------------------
% the LEADSHEETS package
%
%   typesetting leadsheets and songbooks
%
% --------------------------------------------------------------------------
% Clemens Niederberger
% E-Mail: contact@mychemistry.eu
% --------------------------------------------------------------------------
% Copyright 2014-2016 Clemens Niederberger
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
%
% The Current Maintainer of this work is Clemens Niederberger.
% --------------------------------------------------------------------------
\ProvidesClass{leadsheet-modern-onecolumn}[2016/07/21 v0.5 leadsheets class (part of the leadsheets package)]
\LoadClass[a4paper,fontsize=10pt,DIV=22,headings=big]{scrartcl}

\RequirePackage{leadsheets}

\RequirePackage[utf8]{inputenc}
\usepackage[sfdefault,rm]{roboto}
\RequirePackage[T1]{fontenc}

\RequirePackage[english,ngerman]{babel}

\RequirePackage{etoolbox}
\RequirePackage{translations}
\RequirePackage{array}

\defleadsheetstranslation{Fallback}{page}{page}
\defleadsheetstranslation{Fallback}{of}{of}
\defleadsheetstranslation{Fallback}{music}{music}
\defleadsheetstranslation{Fallback}{text}{text}
\defleadsheetstranslation{Fallback}{as-played-by}{as played by}
\defleadsheetstranslation{Fallback}{interpret}{interpret}
\defleadsheetstranslation{Fallback}{choir}{choir}

\defleadsheetstranslation{German}{page}{Seite}
\defleadsheetstranslation{German}{of}{von}
\defleadsheetstranslation{German}{music}{Musik}
\defleadsheetstranslation{German}{text}{Text}
\defleadsheetstranslation{German}{as-played-by}{wie gespielt von}
\defleadsheetstranslation{German}{interpret}{Interpret}
\defleadsheetstranslation{German}{choir}{Chor}

\LeadsheetSurvive

\LeadsheetEndSurvive

\providecommand*\ls@songtitle{}
\providecommand*\ls@songinterpret{}

\definesongproperty{language}

\newbool{ls@comma}
\newrobustcmd*\ls@addcomma{%
  \ifbool{ls@comma}{, }{}%
  \boolfalse{ls@comma}%
}

\newrobustcmd*\ls@printproperty[2]{%
  \ifsongproperty{#1}{%
    \ls@addcomma
    #2%
    \booltrue{ls@comma}%
  }{}%
}

  %\RequirePackage{multicol}

% Remove Numbering
\setcounter{secnumdepth}{0}

\DeclareTranslation{German}{leadsheets/schedule}{Ablauf}
\DeclareTranslation{German}{leadsheets/interlude}{Zwischenspiel}
\DeclareTranslation{German}{leadsheets/verse}{Vers}
\DeclareTranslation{German}{leadsheets/prechorus}{Prechorus}
\DeclareTranslation{German}{leadsheets/interpret}{Interpret: \printsongpropertylist{interpret}{ \& }{, }{ \& }}

\setleadsheets{
  title-template = tabular,
  bar-shortcuts ,
  verse/numbered ,
  verses-format = ,
  verses-label-format = \bfseries,
  info/format = \itshape ,
  chorus/format = \itshape,
	verse/numbered=true,
	verse/named=true,
  verse/template=framed,
  chorus/template=framed,
  bridge/template=framed,
  outro/template=framed,
  intro/template=framed,
  interlude/template=framed,
	chords/input-notation=english,
	chords/output-notation=german,
  chords/german-B=Bb,
  chords/german-H=H,
  chords/format=\bfseries,
  chorus/format=,
	align-chords=l,
  verses-after-label=%,
  %after-title=\begin{multicols}{1},
  %after-song=\end{multicols}
}

\RequirePackage{xcolor}

\setkomafont{pageheadfoot}{\color{black!70}\upshape}
\addtokomafont{section}{\huge}

\RequirePackage[]{scrlayer-scrpage}
\RequirePackage{zref-totpages}
\pagestyle{scrheadings}
\rohead{}
\cohead{%
  \ifnum\ztotpages>1
    \ifnum\value{page}=1
    \else
      \ls@songtitle
      \ifdefvoid\ls@songinterpret{}{ (\ls@songinterpret)}%
    \fi
  \fi
}
\cofoot{%
  \ifnum\ztotpages>1
    \leadsheetstranslate{page}~\thepage~%
    \leadsheetstranslate{of}~\ztotpages
  \fi
}

\RequirePackage{scrlayer-scrpage,zref-totpages}
\pagestyle{scrheadings}
\rohead{}
\cohead{%
  \ifnum\ztotpages>1
    \ifnum\value{page}=1
    \else
      \ls@songtitle
      \ifdefvoid\ls@songinterpret{}{ (\ls@songinterpret)}%
    \fi
  \fi
}
\cofoot{%
    \leadsheetstranslate{page}~\thepage~%
    \leadsheetstranslate{of}~\ztotpages
}

% Header Style
\automark{section}
\ofoot{Stand \today}

\LeadsheetSurvive
\provideversetype{prechorus}[name=Prechorus,template=framed]
\provideversetype*{prechorus*}[name=Prechorus,template=framed]
\provideversetype{tagpart}[name=Tag,template=framed]
\provideversetype*{tagpart*}[name=Tag,template=framed]

\definesongtitletemplate{tabular}{
    \begin{minipage}{.7\linewidth}
    \ifsongmeasuring
      {\section*}
      {\section}%
      {\songproperty{title}}
    \ifsongproperty{interpret}
      {\color{black!70}\Large{\songproperty{interpret}}}
      {}%
    \end{minipage}
    \begin{minipage}{.3\linewidth}
        \footnotesize\color{black!70}\centering
      \ifsongproperty{key}
        {%
          \setchords{
              major = -\GetTranslation{leadsheets/major} ,
              minor = -\GetTranslation{leadsheets/minor}
            }%
          \GetTranslation{leadsheets/key}: %
          \expandcode{\writechord{\songproperty{key}}} \\%
        }
        {}%
        \ifsongproperty{tempo}
            {Tempo: \songproperty{tempo} \\}
            {}%
    \end{minipage}\vspace{10pt}
}


\provideversetype{schedule}[name=Schedule,template=schedule]
\provideversetype*{schedule*}[name=Schedule,template=schedule]

\usepackage[framemethod=TikZ]{mdframed}
\usepackage{tikz}
\usepackage{xstring}

\newcommand{\songpart}[2][]{\tikz[font=\footnotesize\verselabelformat,baseline=-0.6ex,outer sep=0pt,inner sep=0,every node/.style={inner sep=0,outer sep=0}]
              \node[anchor=east,shape=circle,fill=black,draw=white,line width=2pt,text=white,inner sep=2pt,text centered, minimum size=18pt] at (0,0) {#2}
              \ifx&#1&%
                 % #1 is empty
              \else
              node[anchor=south west,shape=circle,fill=white,draw=black,line width=1pt,text=black,inner sep=1pt,text centered, minimum size=14pt] at ([xshift=-4pt]0,0) {#1}
              \fi

              ;\allowbreak}

\defineversetypetemplate{schedule}
  {%
    \mdframed[
    linecolor = none,
    ]
  }
  {%
    \endmdframed
  }

\defineversetypetemplate{framed}
  {%
    \expandcode{%
      \noexpand\mdframed[
        \ifversestarred{}{%
          frametitle={%
              \noexpand\tikz[baseline=(current bounding box.east),outer sep=0pt,inner sep=0,every node/.style={inner sep=0,outer sep=0}]
              \noexpand\node[anchor=east,rectangle,fill=white,inner xsep=2pt,text centered,minimum height=25pt] {
              \noexpand\songpart
              {\noexpand\StrLeft{\noexpand\ifversenamed\versename}{1}\noexpand\StrSubstitute{\noexpand\ifversenumbered\versenumber}{.}{}}
              \noexpand\strut\noexpand\versename~\noexpand\StrSubstitute{\noexpand\ifversenumbered\versenumber}{.}{}};
          }%
        },
        roundcorner = 5pt ,
        linecolor = black!30 ,
        linewidth = 0.5pt,
        topline = true,
        frametitleaboveskip = \dimexpr-1pt-\ht\strutbox\relax,
        innertopmargin = 0pt,
      ]%
    }%
    \setlength\parindent{0pt}
    \setlength\parskip{\parsep}
    \ifobeylines
      {\setleadsheets{ obey-lines-parskip=\parskip }\setlength\parskip{0pt}}
      {\vspace*{-\parskip}}%
  }
  {%
    \endmdframed
}

\providerobustcmd*\lsenparen[1]{%
  \expandcode{\noexpand\mklsenparen\mklsenparens{\unexpanded{#1}}}%
}
\providecommand*\mklsenparens{[]}
\providecommand*\mklsenparen[3]{\textup{#1}#3\textup{#2}}

\providerobustcmd*\instruction[1]{\lsenparen{\mkinstruction{#1}}}
\providecommand*\mkinstruction[1]{\emph{#1}}

\providerobustcmd*\choir[1]{\null\qquad\mkchoir{#1}}
\providecommand*\mkchoir[1]{\instruction{\leadsheetstranslate{choir}: #1}}
\LeadsheetEndSurvive

\endinput
