# LeadsheetArchive
Leadsheets developed using the "leadsheet" package

Thanks to CGNieder for providing the package which is available here: https://github.com/cgnieder/leadsheets

## Git Workflow
The master contains the most recent files of all songs.
For every gig, we create a new feature branch from master to work on missing songs.
Afterwards, the gig branch will be merged into the band branch to ensure that each band has the songs in the style the band performs the song (key, schedule, etc.). 
After this step, the band branch will be merged into the master to ensure that it always contains the most recent song data.
![Git Workflow](https://raw.githubusercontent.com/LaTeXMusicSheets/LeadsheetArchive/master/doc/scm-workflow.png)
