const knex = require('../database');

const obtenerTodosProfes = async (req, res) => {
  try {
    const maestro = await knex('maestro').select('*');
    res.json(maestro);
  } catch (error) {
    res.status(500).json({ error: 'Error al obtener los profesores' });
  }
};


const obtenerProfe = async (req, res) => {
  const { profeId } = req.params;
  try {
    const maestro = await knex('maestro').where({ maestro_id: profeId }).first();
    if (maestro) {
      res.json(maestro);
    } else {
      res.status(404).json({ error: 'Profesor no encontrado' });
    }
  } catch (error) {
    res.status(500).json({ error: 'Error al obtener el profesor' });
  }
};


const añadirProfe = async (req, res) => {
  const nuevoProfe = req.body; 
  try {
    const [maestro_id] = await knex('maestro').insert(nuevoProfe).returning('maestro_id');
    res.status(201).json({ message: 'Profesor creado', maestro_id });
  } catch (error) {
    res.status(500).json({ error: 'Error al crear el profesor' });
  }
};


const editarProfe = async (req, res) => {
  const { profeId } = req.params;
  const cambios = req.body;
  try {
    const actualizado = await knex('maestro').where({ maestro_id: profeId }).update(cambios);
    if (actualizado) {
      res.json({ message: 'Profesor actualizado' });
    } else {
      res.status(404).json({ error: 'Profesor no encontrado' });
    }
  } catch (error) {
    res.status(500).json({ error: 'Error al actualizar el profesor' });
  }
};

const eliminarProfe = async (req, res) => {
  const { profeId } = req.params;
  try {
    const eliminado = await knex('maestro').where({ maestro_id: profeId }).del();
    if (eliminado) {
      res.json({ message: 'Profesor eliminado' });
    } else {
      res.status(404).json({ error: 'Profesor no encontrado' });
    }
  } catch (error) {
    res.status(500).json({ error: 'Error al eliminar el profesor' });
  }
};


module.exports = {
  obtenerTodosProfes,
  obtenerProfe,
  añadirProfe,
  editarProfe,
  eliminarProfe,
};
