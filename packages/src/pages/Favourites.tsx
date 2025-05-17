import { MovieCard } from "../components/MovieCard";
import { useMovieContext } from "../contexts/MovieContext";
import "../css/Favourites.css";

export const Favourites = () => {
  const { favourites } = useMovieContext();

  return favourites.length ? (
    <div className="favourites">
      <h2>Your Favourites</h2>
      <div className="movies-grid">
        {favourites.map((movie) => (
          <MovieCard key={movie.id} movie={movie} />
        ))}
      </div>
    </div>
  ) : (
    <div className="favourites-empty">
      <h2>No Favourites Yet</h2>
      <p>Add a list of favourite movies to be displayed here.</p>
    </div>
  );
};
