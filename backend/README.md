# README

This README would normally document whatever steps are necessary to get the
application up and running.

## Install
A) Dependencies
 `bundle install`

B) API Key storage 
 `figaro install `

## Start
`rails server`

## Refactor
```bash
# rubocop
rubocop .

# rails_best_practices html output
rails_best_practices -f html .
```

## Deploy
```bash
# only deploy backend to herokuapp
git subtree push --prefix backend heroku master
```
