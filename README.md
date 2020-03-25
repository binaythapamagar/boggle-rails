###Prerequsites
`Ruby version : 2.6.5`
`Rails : 6.0.2.1`

###Setup

clone project `git clone https://github.com/binaythapamagar/boggle-rails.git`
move to project directory `cd boggle-rails`
install necessary bundle `bundle install`
run test `respec`
run project `rails s`

###API endpoint
`GET localhost:3000/word` provides random dashboard word from alphabets response as `[['A','B','B',''N'],['A','B','B',''N'],['A','B','B',''N'],['A','B','B',''N']]`

`POST localhost:3000/validate-word` validates word from a repo as `dictionary.txt` using Binary search and response as `{isValid:true,message:'is a valid word'}`

