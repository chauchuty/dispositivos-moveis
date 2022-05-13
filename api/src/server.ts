import express from "express";
import cors from 'cors'
import authenticate from "./routes/authenticate.route";
import clientes from "./routes/clientes.route";
import servicos from "./routes/servicos.route";

// Settings
const app = express();
app.use(cors())
app.use(express.json());

// Routes
app.use('/authenticate', authenticate);
app.use('/clientes', clientes);
app.use('/servicos', servicos);

app.listen(3001, () => "Server is running on port 3001");
