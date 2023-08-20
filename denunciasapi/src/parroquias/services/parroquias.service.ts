import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Parroquias } from '../parroquias.entity';
import { Repository } from 'typeorm';
import { ParroquiasDto } from '../parroquias.dto';

@Injectable()
export class ParroquiasService {
  constructor(
    @InjectRepository(Parroquias)
    public parroquiasRepository: Repository<Parroquias>,
  ) {}

  async create(motivo: ParroquiasDto) {
    return await this.parroquiasRepository.save(motivo);
  }

  async getAll() {
    return await this.parroquiasRepository.find();
  }

  async getById(id: number) {
    return await this.parroquiasRepository.findOneBy({ id });
  }
}
