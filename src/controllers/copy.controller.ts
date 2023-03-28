import { CopyService } from "../services/copy.service";
const copyService: CopyService = new CopyService();

export const copyController = {
  getAllCopiesByBook: (req: any, res: any) => {
    try {
      const id = req.params.id;
      copyService.getAllCopiesByBook(id).then((result) => {
        res.json(result);
      });
    } catch (excepcion) {
      console.error(excepcion);
      res.send(500);
    }
  },
  getAllCopiesByUser: (req: any, res: any) => {
    try {
      const id = req.params.id;
      copyService.getAllCopiesByUser(id).then((result) => {
        res.json(result);
      });
    } catch (excepcion) {
      console.error(excepcion);
      res.send(500);
    }
  },
  createCopy: (req: any, res: any) => {
    try {
      //El try catch es para gestionar que el req.body pueda estar mal y provoque un bad request.
      const newCopy = req.body;
      //no puedo usar async await, porque eso paraliza la ejecución del front, es mejor usar .then()
      copyService.createCopy(newCopy).then((result) => {
        console.log(result);
        res.json(result);
      });
    } catch (exception) {
      console.error(exception);
      res.sendStatus(500);
    }
  },
  updateCopy: (req: any, res: any) => {

    try {
      //El try catch es para gestionar que el req.body pueda estar mal y provoque un bad request.
      const newCopy = req.body;
      //no puedo usar async await, porque eso paraliza la ejecución del front, es mejor usar .then()
      copyService.updateCopy(newCopy).then((result) => {
        console.log(result);
        res.json(result);
      });
    } catch (exception) {
      console.error(exception);
      res.sendStatus(500);
    }
  }
};
