import { useState } from "react";
import { MovieCard } from "./components/MovieCard";

function App() {
  const [searchMovie, setSearchMovie] = useState("");
  const movies = [
    {
      id: 1,
      title: "The Shawshank Redemption",
      releaseDate: "1994",
      url: "https://www.imdb.com/title/tt0111161/",
    },
    {
      id: 2,
      title: "The Godfather",
      releaseDate: "1972",
      url: "https://www.imdb.com/title/tt0068646/",
    },
    {
      id: 3,
      title: "The Dark Knight",
      releaseDate: "2008",
      url: "https://www.imdb.com/title/tt0468569/",
    },
    {
      id: 4,
      title: "Pulp Fiction",
      releaseDate: "1994",
      url: "https://www.imdb.com/title/tt0110912/",
    },
    {
      id: 5,
      title: "Forrest Gump",
      releaseDate: "1994",
      url: "https://www.imdb.com/title/tt0109830/",
    },
  ];

  const filteredMovies = movies.filter((movie) =>
    movie.title.toLowerCase().includes(searchMovie.toLowerCase())
  );

  const handleFormSubmit = (e: { preventDefault: () => void }) => {
    e.preventDefault();
    alert(searchMovie);
  };

  return (
    <div className="home">
      <form onSubmit={handleFormSubmit} className="search-form">
        <input
          type="text"
          placeholder="Search for movies..."
          className="search-input"
          value={searchMovie}
          onChange={(e) => setSearchMovie(e.target.value)}
        />
        <button type="submit" className="search-button">
          Search
        </button>
      </form>
      <div className="movies-grid">
        {filteredMovies.map(
          (movie) =>
            movie.title.toLowerCase().startsWith(searchMovie) && (
              <MovieCard key={movie.id} movie={movie} />
            )
        )}
      </div>
    </div>
  );
}

export default App;
