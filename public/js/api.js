let currentUser = 1;
let userData = {};

window.onload = () => {
    fetchUser(currentUser);
    document.getElementById('loadUser').addEventListener('keypress', function(e) {
        if(e.charCode === 13 || e.keyCode == 13) {
            fetchUser(this.value);
        }
    });

    document.getElementById('addTask').addEventListener('click', function(e) {
        addTask(document.getElementById('task').value);
    });
}

function addTask(task, groupId = null, share = false) {
    var formData  = new FormData();
    const data = {
        'task[group_id]': groupId ? groupId : userData.groups[0].id,
        'task[name]': task,
        'share': share,
        'task[description]': 'Such importance. Much deadline. So intense. Wow!'
    };

    for(var name in data) {
        formData.append(name, data[name]);
    }

    fetch(`http://localhost:3000/users/${currentUser}/tasks.json`, {
        method: 'POST',
        headers: {
            'Accept': 'application/json',
        },
        body: formData
    }).then((response) => response.json())
    .then(data => {
        console.log(data);
    });
}

function addGroup(name) {
    var formData  = new FormData();
    const data = {
        'group[name]': name,
        'group[admin_id]': currentUser
    };

    for(var name in data) {
        formData.append(name, data[name]);
    }

    fetch(`http://localhost:3000/groups.json`, {
        method: 'POST',
        headers: {
            'Accept': 'application/json',
        },
        body: formData
    }).then((response) => response.json())
    .then(data => {
        console.log(data);
        fetchUser(currentUser);
    });
}

function removeUserFromGroup(userId, groupId) {
    var formData  = new FormData();
    const data = {
        '_method': 'delete'
    };

    for(var name in data) {
        formData.append(name, data[name]);
    }

    fetch(`http://localhost:3000/groups/${groupId}/users/${userId}.json`, {
        method: 'POST',
        headers: {
            'Accept': 'application/json',
        },
        body: formData
    }).then((response) => response.json())
    .then(data => {
        fetchUser(userId);
    });
}

function addUsertoGroup(userId, groupId) {
    var formData  = new FormData();
    const data = {
        'id': userId
    };

    for(var name in data) {
        formData.append(name, data[name]);
    }

    fetch(`http://localhost:3000/groups/${groupId}/users.json`, {
        method: 'POST',
        headers: {
            'Accept': 'application/json',
        },
        body: formData
    }).then((response) => response.json())
    .then(data => {
        fetchUser(userId);
    });
}

function fetchUser(uid) {
    const requestsArray = [
        `http://localhost:3000/users/${uid}.json`,
        `http://localhost:3000/users/${uid}/tasks.json`
    ];

    Promise.all(requestsArray.map((request) => {
        return fetch(request).then((response) => {
            if(response.status !== 200) throw new Error('FEHLER');
            return response.json();
        });
    })).then((data) => {
        const [user, tasks] = data;
        currentUser = user.id;
        userData = user;

        document.getElementById('user').innerHTML = user.name;

        appendToList('tasks', tasks, (task) => {
            const group = user.groups.find(function(g) {
                return g.id == task.group_id;
            });
            return `<h4>${group.name}: ${task.name}</h4><blockquote>${task.description}</blockquote>${task.due_date ? `<p>Bis zum ${parseDate(task.due_date)}</p>` : ''}`;
        });
        appendToList('groups', user.groups, (group) => `<h4>${group.name}</h4>`);
    }).catch((err) => {
        document.getElementById('errors').appendChild(document.createTextNode(err));
    });
}

function parseDate(date) {
    const d = new Date(date);
    return [d.getDate(), d.getMonth() + 1, d.getFullYear()].join('.');
}

function appendToList(elem, data, render) {
    const list = document.getElementById(elem);
    while (list.hasChildNodes()) {
        list.removeChild(list.lastChild);
    }

    if(list) {
        for(let item of data) {
            const li = document.createElement('li');
            li.innerHTML = render(item);
            list.appendChild(li)
        }
    }
}