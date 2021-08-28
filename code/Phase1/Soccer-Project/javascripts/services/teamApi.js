class TeamApi {
    static fetchAll() {
        fetch("https://www.futdb.app/apihttp://api.football-data.org/v2/competitions/2000/teams/clubs", {
            "method": "GET",
            "mode": "cores", 
            "cache": "no-cache",
            "headers": {
                "x-auth-token": "d4b0dd1aed3b4edcbf7a75d9b73871af",
                "accept": "application/json"
            }
        })
        .then(response => {
            console.log(response);
        })

    }




}

// d4b0dd1aed3b4edcbf7a75d9b73871af