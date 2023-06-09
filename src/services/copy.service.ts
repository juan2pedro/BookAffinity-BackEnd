import { ImgCopyRepository } from './../data/repositories/img-copy.repository';
import { CopyDTO, NewCopyDTO, NewInvoiceDTO, UserDTO } from "../types";
import { CopyRepository } from "../data/repositories/copy.repository";
import { CopyPojo } from "../data/models/copy.model";
import { InvoicePojo } from '../data/models/invoice.model';

export class CopyService {
  _copyRepository: CopyRepository;
  _imgCopyRepository: ImgCopyRepository;

  constructor() {
    this._copyRepository = new CopyRepository();
    this._imgCopyRepository = new ImgCopyRepository();
  }

  async getAllCopiesByBook(id : number): Promise<CopyDTO[]> {
    const copyPromise = await this._copyRepository
      .getAllCopiesByBook(id)
      .then((copysAsPojo) => {
        let copysAsDto: CopyDTO[] = [];
        copysAsPojo.forEach((copyAsPojo) => {
          let copyAsDto = this.parsePojoIntoDto(copyAsPojo);
          copysAsDto.push(copyAsDto);
        });
        return copysAsDto;
      })
      .catch((error) => {
        console.error(error);
        throw error;
      });

    return copyPromise;
  }

  async getAllCopiesByUser(id : number): Promise<CopyDTO[]> {
    const copyPromise = await this._copyRepository
      .getAllCopiesByUser(id)
      .then((copysAsPojo) => {
        let copysAsDto: CopyDTO[] = [];
        copysAsPojo.forEach((copyAsPojo) => {
          let copyAsDto = this.parsePojoIntoDto(copyAsPojo);
          copysAsDto.push(copyAsDto);
        });
        return copysAsDto;
      })
      .catch((error) => {
        console.error(error);
        throw error;
      });

    return copyPromise;
  }

  parseDtoIntoPojo(copyDto: CopyDTO): CopyPojo {
    return copyDto as unknown as CopyPojo;
  }

  parseNewDtoIntoPojo(copyDto: NewCopyDTO): CopyPojo {
    return copyDto as unknown as CopyPojo;
  }

  async createCopy(copy: NewCopyDTO): Promise<number> {
    const copyPojo: CopyPojo = this.parseNewDtoIntoPojo(copy);
    const copyPromise = await this._copyRepository
      .createCopy(copyPojo)
      .then((id_copy) => {
        return id_copy;
      })
      .catch((error) => {
        console.error(error);
        throw error;
      });
    return copyPromise;
  }

  async updateCopy(copy: CopyDTO): Promise<number> {
    const copyPojo: CopyPojo = this.parseDtoIntoPojo(copy);
    const copyPromise = await this._copyRepository
      .updateCopy(copyPojo)
      .then((id_copy) => {
        return id_copy;
      })
      .catch((error) => {
        console.error(error);
        throw error;
      });
    return copyPromise;
  }

  async createInvoice(invoice: NewInvoiceDTO): Promise<number> {
    const invoicePojo: InvoicePojo = this.parseNewInvoiceDtoIntoPojo(invoice);
    const invoicePromise = await this._copyRepository
      .createInvoice(invoicePojo)
      .then((id_invoice) => {
        return id_invoice;
      })
      .catch((error) => {
        console.error(error);
        throw error;
      });
    return invoicePromise;
  }
  
  parsePojoIntoDto(copyPojo: CopyPojo): CopyDTO {
    const UserDTO : UserDTO = {
          id_user: copyPojo.dataValues.user?.dataValues.id_user,
          name: copyPojo.dataValues.user?.dataValues.name,
          pass: copyPojo.dataValues.user?.dataValues.pass,
          picture: copyPojo.dataValues.user?.dataValues.picture,
          email: copyPojo.dataValues.user?.dataValues.email,
          status: copyPojo.dataValues.user?.dataValues.status,
          id_rol: copyPojo.dataValues.user?.dataValues.id_rol,
          createdAt: copyPojo.dataValues.user?.dataValues.createdAt,
          updatedAt: copyPojo.dataValues.user?.dataValues.updatedAt
    }

    const copyDTO: CopyDTO = {
      id_copy: copyPojo.dataValues.id_copy,
      visible: copyPojo.dataValues.visible,
      price: copyPojo.dataValues.price,
      status: copyPojo.dataValues.status,
      id_user: copyPojo.dataValues.id_user,
      id_book: copyPojo.dataValues.id_book,
      user: UserDTO
    };
    return copyDTO;
  }

  parseNewInvoiceDtoIntoPojo(invoiceDto: NewInvoiceDTO): InvoicePojo {
    return invoiceDto as InvoicePojo;
  }
}
