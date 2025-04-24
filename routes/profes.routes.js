const { Router } = require('express');

const router = Router();

router.get('/profes', (req, res) => {
    res.send('profes obtenidos');
})

router.get('/profes/:profeId', (req, res) => {
    const {profeId} = req.params
    res.send(`profe obtenido con el id ${profeId}`);
})

router.post('/profes', (req, res) => {
    res.send('profe creado');
})

router.put('/profes/:profeId', (req, res) => {
    res.send('profe actualizado');
})

router.delete('/profes/:profeId', (req, res) => {
    res.send('profe eliminado');
})

module.exports = router;
 