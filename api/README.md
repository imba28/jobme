# task-o-mat Rails API

Rails API, falls Firebase nicht funktionieren sollte :-)

### Installation

```
bundle install
rails db:setup
```

### Usage

`rails server`

### Api

##### Benutzer Liste

`/users.json`
```json
[
    {"id":1,"name":"Jonas","created_at":"2018-01-21T21:05:39.822Z","updated_at":"2018-01-21T21:05:39.822Z"},
    {"id":2,"name":"Moritz","created_at":"2018-01-21T21:05:39.895Z","updated_at":"2018-01-21T21:05:39.895Z"},
    {"id":3,"name":"Lukas","created_at":"2018-01-21T21:05:39.971Z","updated_at":"2018-01-21T21:05:39.971Z"},
    {"id":4,"name":"Dummy User","created_at":"2018-01-21T21:05:40.038Z","updated_at":"2018-01-21T21:05:40.038Z"}
]
```
#### Benutzer Information
`/users/1.json`

```json
{
    "id":1,
    "name":"Jonas",
    "created_at":"2018-01-21T21:05:39.822Z",
    "updated_at":"2018-01-21T21:05:39.822Z",
    "groups":[
        {"id":1,"name":"Multimedia Projekt 2","created_at":"2018-01-21T21:05:40.074Z","updated_at":"2018-01-21T21:05:40.074Z"},
        {"id":2,"name":"Content Management Systeme","created_at":"2018-01-21T21:05:40.086Z","updated_at":"2018-01-21T21:05:40.086Z"}
    ]
}
```

##### Benutzer Aufgaben

`/user/1/tasks.json`

```json
[
    {
        "id":1,
        "name":"Studienwoche Projekte fertigstellen.",
        "description":"Etwas in Javascript programmieren, muss hübsch aussehen :-)",
        "group_id":1,
        "user_id":1,
        "due_date":"2018-02-02T00:00:00.000Z",
        "created_at":"2018-01-21T21:05:40.364Z",
        "updated_at":"2018-01-21T21:05:40.364Z",
        "url":"http://localhost:3000/tasks/1.json"
    }
]
```