
const api_key = '47d12cc737fecb4401ae9e799d9dcd75';
let search = 'Waves';
const api_url = `https://api.themoviedb.org/3/search/movie?api_key=${api_key}&query=${search}`;

async function getReleasedate() {
    const response = await fetch('https://api.themoviedb.org/3/search/movie?api_key=47d12cc737fecb4401ae9e799d9dcd75&query=Waves');
    const data = await response.json();
    //data = JSON.stringify(data);
    //console.log(data);
    showMovies(data);
    //iterateData(data);
}
//getReleasedate();

function showMovies() {
    fetch('https://api.themoviedb.org/3/search/movie?api_key=47d12cc737fecb4401ae9e799d9dcd75&query=Waves')
  .then(response => response.json())
  .then(data => {
    if (Array.isArray(data.results)) {
      data.results.forEach(movie => {
        console.log(`Movie title: ${movie.title}, Release date: ${movie.release_date}`);
      });
    } else {
      console.log('Data is not an array');
    }
  })
  .catch(error => console.error('Error:', error));
}
showMovies();