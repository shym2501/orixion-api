const express = require('express');
const bodyParser = require('body-parser')
const cors = require('cors');
const app = express();
const { db } = require('./model/dbConnection');

app.use(cors());
app.use(express.json());
app.use(bodyParser.urlencoded({ extended: true }));

// default route
app.get('/', function (req, res) {
return res.send({ error: true, message: 'hello' })
});

// read
app.get('/api', (req, res) => {
  const sqlQuery = "SELECT * FROM inbox";

  db.query(sqlQuery, (error, results, fields) => {
    if (error) throw error;
    return res.send({
      error: false,
      data: results,
      message: 'All of inbox list'
    });
  });
});

// read:id
app.get('/api/:id', (req, res) => {
  const inbox_id = req.body.id;
  
  if (!inbox_id) {
    return res.status(400).send({
      error: true,
      message: 'Please provide inbox_id'
    });
  }
  db.query('SELECT * FROM inbox WHERE id = ?', [inbox_id], (error, results, fields) => {
    if (error) throw error;
    return res.send({
      error: false,
      data: results[0],
      message: 'Inbox detail.'
    });
  });
});
// #####

// create
app.post('/api', (req, res) => {
  const pengirim = req.body.pengirim;
  const no_surat = req.body.no_surat;
  const jenis_id = req.body.jenis_id;
  const perihal = req.body.perihal;
  const tgl_masuk = req.body.tgl_masuk;
  const tgl_kegiatan = req.body.tgl_kegiatan;
  const file = req.body.file;
  
  if (!pengirim) {
    return res.status(400).send({
      error: true,
      message: 'Please provide inbox'
    });
  }
  
  db.query("INSERT INTO inbox (pengirim, no_surat, jenis_id, perihal, tgl_masuk, tgl_kegiatan, file) VALUE (?, ?, ?, ?, ?, ?, ?)", [pengirim, no_surat, jenis_id, perihal, tgl_masuk, tgl_kegiatan, file], (error, results, fields) => {
    if (error) throw error;
    return res.send({
      error: false,
      data: results,
      message: 'New inbox has been created successfully.'
    });
  });
});
// #####

// update
app.put('/api', (req, res) => {
  const id = req.body.id;
  const pengirim = req.body.pengirim;
  const no_surat = req.body.no_surat;
  const jenis_id = req.body.jenis_id;
  const perihal = req.body.perihal;
  const tgl_masuk = req.body.tgl_masuk;
  const tgl_kegiatan = req.body.tgl_kegiatan;
  const file = req.body.file;
  
  if (!id || !pengirim) {
    return res.status(400).send({
      error: user,
      message: 'Please provide user and user_id'
    });
  }
  db.query("UPDATE inbox SET pengirim = ?, no_surat = ?, jenis_id = ?, perihal = ?, tgl_masuk = ?, tgl_kegiatan = ?, file = ? WHERE id = ?", [pengirim, no_surat, jenis_id, perihal, tgl_masuk, tgl_kegiatan, file, id], (error, results, fields) => {
    if (error) throw error;
    return res.send({
      error: false,
      data: results,
      message: 'Inbox has been updated successfully.'
    });
  });
});
// #####

// Delete
app.delete('/api', (req, res) => {
  const id = req.body.id;
  if (!id) {
    return res.status(400).send({
      error: true,
      message: 'Please provide inbox_id'
    });
  }
  db.query('DELETE FROM inbox WHERE id = ?', [id], (error, results, fields) => {
    if (error) throw error;
    return res.send({
      error: false,
      data: results,
      message: 'Inbox has been deleted successfully.'
    });
  });
});
// #####

app.listen(3030, () => {
  console.log('server berhasil berjalan pada port 3030!');
});
