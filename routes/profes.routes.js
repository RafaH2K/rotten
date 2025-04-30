const { Router } = require("express");

const router = Router();
const {
  obtenerTodosProfes,
  obtenerProfe,
  añadirProfe,
  editarProfe,
  eliminarProfe,
} = require("../controllers/profes.controllers");

router.get("/profes", obtenerTodosProfes);

router.get("/profes/:profeId", obtenerProfe);

router.post("/profes", añadirProfe);

router.put("/profes/:profeId", editarProfe);

router.delete("/profes/:profeId", eliminarProfe);

module.exports = router;
