import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Usuarios } from '../users.entity';
import { Repository } from 'typeorm';
import { UsuariosDto } from '../users.dto';

@Injectable()
export class UsersService {
  constructor(
    @InjectRepository(Usuarios)
    private usuariosRepository: Repository<Usuarios>,
  ) {}

  async create(usuario: UsuariosDto) {
    return await this.usuariosRepository.save(usuario);
  }

  async getById(id: number) {
    return await this.usuariosRepository.findOneBy({ id });
  }
}
