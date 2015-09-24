%% Provides a class for a single song leadsheet

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{leadsheet}[2015/03/09 Leadsheet Document Class]

% % Fallback
\DeclareOption*{
\PassOptionsToClass{scrartcl}{\CurrentOption}}

% % Process given options
\ProcessOptions\relax

% % Load base
\LoadClass[a4paper,fontsize=12pt,twoside=false,BCOR=15mm,DIV=18]{scrartcl}

\RequirePackage[utf8]{inputenc}
\usepackage[sfdefault]{roboto}
\RequirePackage[T1]{fontenc}

\RequirePackage[english,ngerman]{babel}

% % Define Header and Footer % %
\RequirePackage[headsepline,footsepline]{scrlayer-scrpage}

% Header Style
\pagestyle{scrheadings}
\automark{section}
\ofoot{Stand \today}

% Remove Numbering
\setcounter{secnumdepth}{0}

% Leadsheets style
\RequirePackage{leadsheets}
\RequirePackage{array}
\RequirePackage{framed}

\newversetype{prechorus}[name=Prechorus]

\newversetype{schedule}[name=Schedule,template=framed-itemize]
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


\setleadsheets{chords/input-notation=english,chords/output-notation=german,align-chords=l}
\setleadsheets{verse/numbered=true,verse/named=true,title-template=tabular,bar-shortcuts=true}

\DeclareTranslation{German}{leadsheets/schedule}{Ablauf}
\DeclareTranslation{German}{leadsheets/interlude}{Zwischenspiel}
\DeclareTranslation{German}{leadsheets/prechorus}{Prechorus}
\DeclareTranslation{German}{leadsheets/interpret}{Interpret: \printsongpropertylist{interpret}{ \& }{, }{ \& }}

% Add content at beginning
\AtBeginDocument{}
\endinput
