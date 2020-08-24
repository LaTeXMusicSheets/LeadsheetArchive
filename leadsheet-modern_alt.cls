\ProvidesClass{leadsheet-modern}[2016/07/21 v0.5 leadsheets class (part of the leadsheets package)]
\LoadClass[a4paper,fontsize=12pt,twoside=false,BCOR=15mm,DIV=18]{leadsheet}

\RequirePackage[utf8]{inputenc}
\usepackage[sfdefault,rm]{roboto}
\RequirePackage[T1]{fontenc}

\RequirePackage[english,ngerman]{babel}

\RequirePackage{array}

\defleadsheetstranslation{Fallback}{interpret}{interpret}

\defleadsheetstranslation{German}{interpret}{Interpret}

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
  verses-label-format = \rmfamily\bfseries\itshape,
  info/format = \itshape ,
  chorus/format = \itshape,
	verse/numbered=true,
	verse/named=true,
	%title-template=tabular,
	chords/input-notation=english,
	chords/output-notation=german,
  chords/german-B=Bb,
  chords/german-H=H,
	align-chords=l
}


% Header Style
\automark{section}
\ofoot{Stand \today}

\LeadsheetSurvive

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

\LeadsheetEndSurvive

\endinput
