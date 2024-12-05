const api_key = '47d12cc737fecb4401ae9e799d9dcd75';
const api_url = `https://api.themoviedb.org/3/search/movie?api_key=${api_key}&query=${search}`;

let options = [];
const inputBox = document.getElementById("input-box");

inputBox.onkeyup = function(){
    let result = [];
    let input = inputBox.value;
}