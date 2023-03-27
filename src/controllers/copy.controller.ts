import { CopyService } from "../services/copy.service";
const copyService: CopyService = new CopyService();

export const copyController = {
  getAllCopysByBook: (req: any, res: any) => {
    try {
      const id = req.params.id;
      copyService.getAllCopysByBook(id).then((result) => {
        res.json(result);
      });
    } catch (excepcion) {
      console.error(excepcion);
      res.send(500);
    }
  },
};
