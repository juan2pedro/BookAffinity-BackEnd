import { UsersCryptosService } from "../services/userscryptos.service";
const userscryptosService: UsersCryptosService = new UsersCryptosService();

export const userscryptosController = {
  getAllUsersCryptos: (_req: any, res: any) => {
    userscryptosService
      .getAllUsersCryptos()
      .then((result) => {
        res.json(result);
      })
      .catch((excepcion) => {
        console.error(excepcion);
        res.send(500);
      });
  },

  getUsersCryptosById: (req: any, res: any) => {
    try {
      const userId = req.params.id;
      userscryptosService.getUsersCryptosById(userId).then((result) => {
        res.json(result);
      });
    } catch (excepcion) {
      console.log(excepcion);
      res.sendStatus(500);
    }
  },

  addUsersCryptos: (req: any, res: any) => {
    try {
      const newUsersCryptos = req.body;
      userscryptosService.addUsersCryptos(newUsersCryptos).then((result) => {
        res.json(result);
      });
    } catch (excepcion) {
      console.log(excepcion);
      res.sendStatus(500);
    }
  },

  updateUsersCryptos: (req: any, res: any) => {
    try {
      const newUsersCryptos = req.body;
      userscryptosService.updateUsersCryptos(newUsersCryptos).then((result) => {
        res.json(result);
      });
    } catch (excepcion) {
      console.log(excepcion);
      res.sendStatus(500);
    }
  },
};
