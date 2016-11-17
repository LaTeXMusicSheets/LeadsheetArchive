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
\ProvidesClass{leadsheet}[2016/07/21 v0.5 leadsheets class (part of the leadsheets package)]
\LoadClass[a4paper,fontsize=12pt,twoside=false,BCOR=15mm,DIV=18]{scrartcl}

\RequirePackage{leadsheets}

\RequirePackage[utf8]{inputenc}
\usepackage[sfdefault]{roboto}
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

% Remove Numbering
\setcounter{secnumdepth}{0}

\DeclareTranslation{German}{leadsheets/schedule}{Ablauf}
\DeclareTranslation{German}{leadsheets/interlude}{Zwischenspiel}
\DeclareTranslation{German}{leadsheets/prechorus}{Prechorus}
\DeclareTranslation{German}{leadsheets/interpret}{Interpret: \printsongpropertylist{interpret}{ \& }{, }{ \& }}

\setleadsheets{
  title-template = tabular ,
  bar-shortcuts ,
  verse/numbered ,
  verses-format = ,
  info/format = \itshape ,
  chorus/format = \itshape,
	verse/numbered=true,
	verse/named=true,
	%title-template=tabular,
	chords/input-notation=english,
	chords/output-notation=german,
	align-chords=l
}

\RequirePackage[headsepline,footsepline]{scrlayer-scrpage}
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

% Header Style
\automark{section}
\ofoot{Stand \today}

\LeadsheetSurvive
\provideversetype{prechorus}[name=Prechorus]
\provideversetype*{prechorus*}[name=Prechorus]

\provideversetype{schedule}[name=Schedule,template=framed-itemize]
\provideversetype*{schedule*}[name=Schedule,template=framed-itemize]
\makeatletter
\defineversetypetemplate{framed-itemize}
{%
	\bigskip
      \hrule\itemize
      \@itemdepth=0
      \ifobeylines
        {%
          \setlength{\parskip}{0pt}%
          \setleadsheets{ obey-lines-parskip = \parsep }%
}{}%
\item[{\verselabel}]%
}
  {\enditemize \hrule}
\makeatother

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
