import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Motivos } from '../motivos.entity';
import { MotivosDto } from '../motivos.dto';
import { Repository } from 'typeorm';

@Injectable()
export class MotivosService {
  constructor(
    @InjectRepository(Motivos)
    private readonly motivosRepository: Repository<Motivos>,
  ) {}

  async create(motivo: MotivosDto) {
    return await this.motivosRepository.save(motivo);
  }

  async getAll() {
    return await this.motivosRepository.find();
  }

  async getById(id: number) {
    return await this.motivosRepository.findOneBy({ id });
  }
}
