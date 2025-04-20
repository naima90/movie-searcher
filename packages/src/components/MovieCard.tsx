import "../css/MovieCard.css";

interface Movie {
  title: string;
  releaseDate: string;
  url: string;
}

export const MovieCard = ({ movie }: { movie: Movie }) => {
  const handleOnClick = () => {
    alert("clicked!!");
  };
  return (
    <>
      <div className="movie-card">
        <div className="movie-poster">
          <img src={movie.url} alt={movie.title} />
          <div className="movie-overlay">
            <button className="favourite-btn" onClick={handleOnClick}>
              🤍
            </button>
          </div>
        </div>
        <div className="movie-info">
          <h3>{movie.title}</h3>
          <p>{movie.releaseDate}</p>
        </div>
      </div>
    </>
  );
};
