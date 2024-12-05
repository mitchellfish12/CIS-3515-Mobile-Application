const inputBox = document.getElementById("input-box");
const listContainer = document.getElementById("list-container");
const api_key = '47d12cc737fecb4401ae9e799d9dcd75';
const api_url = `https://api.themoviedb.org/3/search/movie?api_key=${api_key}&query=${search}`;
const poster_url = 'https://image.tmdb.org/t/p/w1280';

function AddTask() {
    let search = inputBox.value;
    if (search === '') {
        alert("Please input a valid movie title");
    }
    else {
        let li = document.createElement("li");
        li.innerHTML = search;
        listContainer.appendChild(li);
        let span = document.createElement("span");
        span.innerHTML = "\u00d7";
        li.appendChild(span);
    }
    search = "";
    getReleasedate();
    saveData();
}


inputBox.onkeyup = function() {
    let results = [];
    fetch(api_url).then(response => response.json()).then(data => {
        if (Array.isArray(data.results)) {
            data.results.forEach(movie => {        
                results.push(`${movie.title}, ${movie.release_date}`);        
            });      
        }    
        })
        .catch(error => console.error('Error:', error));
        display(results);
}

function display(results) {
    const content = result.map((list) =>{
        return "<li onclick=selectInput(this)>" + list + "</li>";
    })
    resultsBox.innerHTML = "<ul>" + content.join('') + "</ul>";
}

listContainer.addEventListener("click", function(e) {
    if (e.target.tagName === "SPAN") {
        e.target.parentElement.remove();
    }
}, false);

function saveData() {
    localStorage.setItem("data", listContainer.innerHTML);
}