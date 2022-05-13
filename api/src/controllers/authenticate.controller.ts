import { Request, Response } from "express";
import jwt from 'jsonwebtoken'
import conn from "../conn";

class AuthenticateController {
  
  static login(req: Request, res: Response) {
    const { usuario, senha } = req.body
    conn.query(`SELECT * FROM usuario WHERE usuario = '${usuario}' AND senha = '${senha}' LIMIT 1`, (err, results: any) => {
      if (err) return res.status(500).send(err);
      if(results[0]){
        console.log(results)
        return res.json({token: jwt.sign({id: results[0]}, 's3cr3t')})
      } else {}
      res.json({token: null});
    });
  }
}

export default AuthenticateController;
