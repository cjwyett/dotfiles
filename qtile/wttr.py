import requests
weather = requests.get(
        "http://wttr.in/beddington", 
        headers={"user-agent": "curl"}
        )

print(weather.text[26:-146])
