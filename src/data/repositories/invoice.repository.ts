import { InvoicePojo } from "../models/invoice.model";
import { connect } from "../config/invoice.db.config";

export class ChatRepository {
_db: any = {};
_invoiceRepository: any;

constructor() {
    this._db = connect();
    this._invoiceRepository = this._db.sequelize.getRepository(InvoicePojo);
}

async getAllInvoices(): Promise <InvoicePojo[]>{
    try {
        return await this._invoiceRepository.findAll()
    } catch (error){
        console.error(error)
        return []
    }
}

async addInvoice (newInvoice: InvoicePojo) : Promise<string>{
    try{
        newInvoice= await this._invoiceRepository.create(newInvoice)
        return newInvoice.id
    } catch (error) {
        console.log(error)
        return 'ok'
    }
}
}