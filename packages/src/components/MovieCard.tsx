import { useMovieContext } from "../contexts/MovieContext";
import "../css/MovieCard.css";

interface Movie {
  id: number;
  title: string;
  release_date: string;
  poster_path: string;
}

export const MovieCard = ({ movie }: { movie: Movie }) => {
  const { isFavourite, addToFavourites, removeFromFavourites } = useMovieContext();

  const favourite = isFavourite(movie.id);

  const onFavouriteClick = (e: { preventDefault: () => void }) => {
    e.preventDefault();

    if (favourite) {
      removeFromFavourites(movie.id);
    } else {
      addToFavourites(movie);
    }
  };

  return (
    <>
      <div className="movie-card">
        <div className="movie-poster">
          <img src={`https://image.tmdb.org/t/p/w500${movie.poster_path}`} alt={movie.title} />
          <div className="movie-overlay">
            <button className={`favourite-btn ${favourite ? "active" : ""}`} onClick={onFavouriteClick}>
              ♥
            </button>
          </div>
        </div>
        <div className="movie-info">
          <h3>{movie.title}</h3>
          <p>{movie.release_date.split("-")[0]}</p>
        </div>
      </div>
    </>
  );
};
