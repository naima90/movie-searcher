import { Route, Routes } from "react-router-dom";
import { Home } from "./pages/Home";
import { Favourites } from "./pages/Favourites";

function App() {
  return (
    <main className="main-content">
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/favourites" element={<Favourites />} />
      </Routes>
    </main>
  );
}

export default App;
