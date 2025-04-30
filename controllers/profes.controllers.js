const pool = require("../db");
const obtenerTodosProfes = (req, res) => {
  res.send("profes obtenidos");
};

const obtenerProfe = (req, res) => {
  const { profeId } = req.params;
  res.send(`profe obtenido con el id ${profeId}`);
};

const añadirProfe = (req, res) => {
  res.send("profe creado");
};

const editarProfe = (req, res) => {
  res.send("profe actualizado");
};

const eliminarProfe = (req, res) => {
  res.send("profe eliminado");
};

module.exports = {
  obtenerTodosProfes,
  obtenerProfe,
  añadirProfe,
  editarProfe,
  eliminarProfe,
};
