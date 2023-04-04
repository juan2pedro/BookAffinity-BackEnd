import { CopyDTO, ImgCopyDTO, NewCopyDTO, NewInvoiceDTO } from "../types";
import { CopyRepository } from "../data/repositories/copy.repository";
import { CopyPojo } from "../data/models/copy.model";
import { InvoicePojo } from '../data/models/invoice.model';
import { ImgCopyRepository } from "../data/repositories/img-copy.repository";
import { ImgCopyPojo } from '../data/models/img-copy.model';
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
    console.log("Pojo::" , copyPojo)
    const copyDto: CopyDTO = {
      id_copy: copyPojo.dataValues.id_copy,
      visible: copyPojo.dataValues.visible,
      price: copyPojo.dataValues.price,
      status: copyPojo.dataValues.status,
      id_user: copyPojo.dataValues.id_user,
      id_book: copyPojo.dataValues.id_book,
      imgs: []
    };
    
  if (!!copyPojo.dataValues.imgCopy && copyPojo.dataValues.imgCopy.length > 0) {
    copyPojo.dataValues.imgCopy.forEach((img: ImgCopyPojo) => {
      const imgCopyDTO : ImgCopyDTO ={
        id_img_copy: img.dataValues.id_img_book,
        rute: img.dataValues.rute,
        id_copy: img.dataValues.id_copy,
      };
      copyDto.imgs.push(imgCopyDTO)
    })
    return copyDto;
  }

    return copyDto;
  }
  
  parseNewInvoiceDtoIntoPojo(invoiceDto: NewInvoiceDTO): InvoicePojo {
    return invoiceDto as InvoicePojo;
  }


}
