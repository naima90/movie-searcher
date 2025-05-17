import { Route, Routes } from "react-router-dom";
import { Home } from "./pages/Home";
import { Favourites } from "./pages/Favourites";
import { NavBar } from "./components/NavBar";

import { MovieProvider } from "./contexts/MovieContext";

import "./css/App.css";

function App() {
  return (
    <MovieProvider>
      <NavBar />
      <main className="main-content">
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/favourites" element={<Favourites />} />
        </Routes>
      </main>
    </MovieProvider>
  );
}

export default App;
