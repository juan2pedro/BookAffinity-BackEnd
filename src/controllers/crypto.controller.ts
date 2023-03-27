import { CryptoService } from "./../services/crypto.service";
const cryptoService: CryptoService = new CryptoService();

export const cryptoController = {
  getAllCryptos: (_req: any, res: any) => {
    cryptoService
      .getAllCryptos()
      .then((result) => {
        res.json(result);
      })
      .catch((excepcion) => {
        console.error(excepcion);
        res.send(500);
      });
  },

  getCryptoById: (req: any, res: any) => {
    try {
      const cryptoId = req.params.id;
      cryptoService.getCryptoById(cryptoId).then((result) => {
        res.json(result);
      });
    } catch (excepcion) {
      console.log(excepcion);
      res.sendStatus(500);
    }
  },

  addCrypto: (req: any, res: any) => {
    try {
      const newCrypto = req.body;
      cryptoService.addCrypto(newCrypto).then((result) => {
        res.json(result);
      });
    } catch (excepcion) {
      console.log(excepcion);
      res.sendStatus(500);
    }
  },

  updateCrypto: (req: any, res: any) => {
    try {
      const newCrypto = req.body;
      cryptoService.updateCrypto(newCrypto).then((result) => {
        res.json(result);
      });
    } catch (excepcion) {
      console.log(excepcion);
      res.sendStatus(500);
    }
  },
};
