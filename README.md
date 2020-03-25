### Prerequsites
`Ruby version : 2.6.5` <br />
`Rails : 6.0.2.1`<br />

### Setup

clone project `git clone https://github.com/binaythapamagar/boggle-rails.git` <br />
move to project directory `cd boggle-rails`<br />
install necessary bundle `bundle install`<br />
run test `respec`<br />
run project `rails s`<br />

### API endpoint
`GET localhost:3000/word` provides random dashboard word from alphabets response as <br /> `[['A','B','B',''N'],['A','B','B',''N'],['A','B','B',''N'],['A','B','B',''N']]`

`POST localhost:3000/validate-word` validates word from a repo as `dictionary.txt` using Binary search and response as <br/> `{isValid:true,message:'is a valid word'}`

