import { CopyPojo } from "../models/copy.model";
import { connect } from "../config/copy.db.config";
import { InvoicePojo } from "../models/invoice.model";
import { ImgCopyPojo } from "../models/img-copy.model";
import { UserPojo } from "../models/user.model";

export class CopyRepository {
  _db: any = {};
  _copyRepository: any;
  _invoiceRepository: any;
  _imgCopyRepository: any;
  _userRepository: any;


  constructor() {
    this._db = connect();
    this._copyRepository = this._db.sequelize.getRepository(CopyPojo);
    this._invoiceRepository = this._db.sequelize.getRepository(InvoicePojo);
    this._userRepository = this._db.sequelize.getRepository(UserPojo);
    this._imgCopyRepository = this._db.sequelize.getRepository(ImgCopyPojo);
  }

  async getAllCopiesByBook(id: number): Promise<CopyPojo[]> {
    try {
      const copys = await this._copyRepository.findAll({
        include : [this._userRepository, this._imgCopyRepository],
        where: {
          id_book: id,
        },
        limit: 3
      });
      console.log("copys:::", copys);
      return copys;
    } catch (error) {
      console.error(error);
      return [];
    }
  }
  
  async getAllCopiesByUser(id: number): Promise<CopyPojo[]> {
    try {
      const copys = await this._copyRepository.findAll({
        where: {
          id_user: id,
        },
      });
      console.log("copys:::", copys);
      return copys;
    } catch (error) {
      console.error(error);
      return [];
    }
  }

  async createCopy(newCopy: CopyPojo): Promise<number> {
    try {
      newCopy = await this._copyRepository.create(newCopy);
      return newCopy.id_copy;
    } catch (error) {
      console.error(error);
      return -1;
    }
  }

  async updateCopy(newCopy: CopyPojo): Promise<number> {
    try {
      await this._copyRepository.update({
        price: newCopy.price,
        visible: newCopy.visible,
        status: newCopy.status,
        id_user : newCopy.id_user,
        id_book : newCopy.id_book
      }, {
        where: {
          id_copy: newCopy.id_copy
        },
      });
      return newCopy.id_copy;
    } catch (error) {
      console.error(error);
      return error.toString();
    }
  }

  
  async createInvoice(newInvoice: InvoicePojo): Promise<number> {
    try {
      newInvoice = await this._invoiceRepository.create(newInvoice);
      return newInvoice.id_invoice;
    } catch (error) {
      console.error(error);
      return -1;
    }
  }
}
