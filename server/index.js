import express from 'express';
import "dotenv/config";
import { PORT } from "./config/index.js";
import router from './router/index.js';

const app = express();

app.use(express.json());
app.use(express.urlencoded({extended: true}));
app.use(router);

app.listen(PORT, () => {
    console.log(`Listening at http://localhost:${PORT}`);
});