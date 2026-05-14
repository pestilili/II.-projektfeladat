async function readJsonFile(filePath) {
    try {
        const response = await fetch(filePath);

        if (!response.ok) {
            throw new Error("Failed to load file:" + response.status);
        }

        const jsonData = await response.json();
        return jsonData;

    } catch (error) {
        throw new Error('Error reading JSON file:', error);
    }
}

readJsonFile('adatbazis.json')
    .then(data => {
        if (localStorage.getItem("db") === null){
            localStorage.setItem("db", JSON.stringify(data));
        }
        
        db = JSON.parse(localStorage.getItem("db"));
        for (let i = 1; i < db["esemenyek"].length+1; i++) {
            let s = "";
            s += db["esemenyek"][i-1]["nev"] + "\n";
            s += db["esemenyek"][i-1]["idopont"] + "\n";
            s += db["esemenyek"][i-1]["leiras"] + "\n";
            s += db["esemenyek"][i-1]["kategoria"];
            document.getElementById("esemeny" + i).innerText = s;
        }

        document.getElementById("hozzaadas").addEventListener("click", () => {
            db["esemenyek"].push(`{"sorszam": ${db["esemenyek"].length+1}, "id": ${db["esemenyek"].length+1}, "nev": ${nev}, "idopont": ${idopont}, "leiras": ${leiras}, "kategoria": ${kategoria},}`);
        })
    })
    .catch(error => {
        console.error('Failed to load configuration:', error);
    });
