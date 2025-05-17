import {
  createContext,
  ReactNode,
  useContext,
  useEffect,
  useState,
} from "react";

interface Movie {
  id: number;
  title: string;
  release_date: string;
  poster_path: string;
}

interface MovieContextType {
  favourites: Movie[];
  addToFavourites: (movie: Movie) => void;
  removeFromFavourites: (movieId: number) => void;
  isFavourite: (movieId: number) => boolean;
}

const MovieContext = createContext<MovieContextType | null>(null);

// eslint-disable-next-line react-refresh/only-export-components
export const useMovieContext = () => {
  const context = useContext(MovieContext);
  if (!context) {
    throw new Error("useMovieContext must be used within a MovieProvider");
  }
  return context;
};

export const MovieProvider = ({ children }: { children: ReactNode }) => {
  const [favourites, setFavourites] = useState<Movie[] | []>([]);

  useEffect(() => {
    const storedFavs = localStorage.getItem("favourites");

    if (storedFavs) {
      setFavourites(JSON.parse(storedFavs));
    }
  }, []);

  useEffect(() => {
    localStorage.setItem("favourites", JSON.stringify(favourites));
  }, [favourites]);

  const addToFavourites = (movie: Movie) => {
    setFavourites((prev) => [...prev, movie]);
  };

  const removeFromFavourites = (movieId: number) => {
    setFavourites((prev) => prev.filter((movie) => movie.id !== movieId));
  };

  const isFavourite = (movieId: number) => {
    return favourites.some((movie) => movie.id === movieId);
  };

  const value: MovieContextType = {
    favourites,
    addToFavourites,
    removeFromFavourites,
    isFavourite,
  };

  return (
    <MovieContext.Provider value={value}>{children}</MovieContext.Provider>
  );
};
