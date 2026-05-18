async function readJsonFile(filePath) {
    try {
        let response = await fetch(filePath);
        if (!response.ok) {
            throw new Error("Error type_0:" + response.status);
        }
        let jsonData = await response.json();
        return jsonData;
    } catch (error) {
        throw new Error("Error type_1:", error);
    }
}

readJsonFile('adatbazis.json').then(data => {
    if (localStorage.getItem("db") === null){
        localStorage.setItem("db", JSON.stringify(data));
    }
    db = JSON.parse(localStorage.getItem("db"));
    localDB = treatURL(db);
    for (let i = 1; i < localDB.length+1; i++) {
        let s = "";
        s += decodeURI(localDB[i-1]["nev"]) + "<br>";
        s += localDB[i-1]["idopont"] + "<br>";
        s += decodeURI(localDB[i-1]["leiras"]) + "<br>";
        s += decodeURI(localDB[i-1]["kategoria"]);
        document.getElementById("esemeny" + i).innerHTML += s;
    }}).catch(error => {
        console.error("Error type_2:", error);
    });

function treatURL(db) {
    
    let url_data = {};
    let url = window.location.href;

    try{ url.split("?")[1].split("&").forEach((element) => {
        url_data[element.split("=")[0]] = element.split("=")[1] })
    } catch{}
    if ("nev" in url_data && "ido" in url_data && "desc" in url_data && "categ" in url_data) {
        let arr = [];
        let arr2 = [];
        db["esemenyek"].forEach((element) => {arr.push(element.nev)});
        db["esemenyek"].forEach((element) => {arr2.push(element.idopont)});

        if (localStorage.getItem("mode") !== null) {
            let event = JSON.parse(localStorage.getItem("user"))[Number(localStorage.getItem("mode")[localStorage.getItem("mode").length-1])];
            let event_JSON = {"sorszam": event.sorszam, "id": event.id, "nev": event.nev, "idopont": event.idopont, "leiras": event.leiras, "kategoria": event.kategoria};
            
            console.log(localStorage.getItem("mode"));
            db["esemenyek"][Number(localStorage.getItem("mode")[localStorage.getItem("mode").length-1])] = event_JSON;
            localStorage.setItem("db", JSON.stringify(db));
            
            let user = JSON.parse(localStorage.getItem("user"));
            user[Number(localStorage.getItem("mode")[localStorage.getItem("mode").length-1])] = event_JSON;
            localStorage.setItem("user", JSON.stringify(user));
            return user;
        } else if (!(arr.includes(url_data.nev) && arr2.includes(url_data.ido))) {
            let event_JSON = {"sorszam": db["esemenyek"].length+1, "id": db["esemenyek"].length+1, "nev": url_data.nev, "idopont": url_data.ido, "leiras": url_data.desc, "kategoria": url_data.categ};
            db["esemenyek"].push(event_JSON);
            localStorage.setItem("db", JSON.stringify(db));

            let user = JSON.parse(localStorage.getItem("user"));
            user.push(event_JSON); localStorage.setItem("user", JSON.stringify(user));
            let roles = JSON.parse(localStorage.getItem("roles"));
            roles.push(1); localStorage.setItem("roles", JSON.stringify(roles));
            return user;
        } else{
            return JSON.parse(localStorage.getItem("user"));
        }
    } else if ("nev" in url_data && "jog" in url_data && "email" in url_data){
        let arr = [];
        let arr2 = [];

        db["emberek"].forEach((element) => {arr.push(element.nev)});
        db["emberek"].forEach((element) => {arr2.push(element.email)});

        let ids = [];
        let roles = [];
        if (!(arr.includes(url_data.nev.replace("+", " ") && arr2.includes(url_data.email)))) {
            db["emberek"].forEach((element) => {
                if ((element.email == url_data.email + "@diak.szbi-pg.hu" && url_data.jog == "diak") || (element.email == url_data.email + "@szbi-pg.hu" && url_data.jog == "tanar")) {
                    db["kapcsolo"].forEach((elem) => {
                        if (elem.telefonszam == element.telefonszam) {
                            ids.push(elem.id);
                            roles.push(elem.szerep);
                        }
                    })
                }
            })
        }
        let localDB = [];
        db["esemenyek"].forEach((element) => {
            if (ids.includes(element.id)) {
                localDB.push(element);
            }
        });
        localStorage.setItem("user", JSON.stringify(localDB));
        localStorage.setItem("roles", JSON.stringify(roles));
        return localDB;
    } else {
        try{
            return JSON.parse(localStorage.getItem("user"));
        } catch{
            alert("Kérjük lépjen be!");
        }
    }}