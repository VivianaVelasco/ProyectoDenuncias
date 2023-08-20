import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Denuncias } from '../denuncias.entity';
import { DenunciasDto } from '../denuncias.dto';
import { ParroquiasService } from '../../parroquias/services/parroquias.service';
import { UsersService } from '../../users/services/users.service';
import { MotivosService } from '../../motivos/services/motivos.service';

@Injectable()
export class DenunciasService {
  constructor(
    @InjectRepository(Denuncias)
    private readonly denunciasRepository: Repository<Denuncias>,
    private parroquiasService: ParroquiasService,
    private usuariosService: UsersService,
    private motivosSerive: MotivosService,
  ) {}

  // David Terreros
  async findFiveRecent() {
    return await this.denunciasRepository
      .createQueryBuilder('denuncias')
      .select()
      .orderBy('denuncias.createdAt', 'DESC')
      .take(5)
      .getMany();
  }

  async create(denuncia: DenunciasDto) {
    const { idUsuario, idParroquia, idMotivo, ...data } = denuncia;
    const usuario = await this.usuariosService.getById(idUsuario);
    const parroquia = await this.parroquiasService.getById(idParroquia);
    const motivo = await this.motivosSerive.getById(idMotivo);
    const newDenuncia = {
      ...data,
      usuario,
      motivo,
      parroquia,
    };
    return await this.denunciasRepository.save(newDenuncia);
  }

  async update(id: number, updateDenuncia: DenunciasDto) {
    const { idUsuario, idParroquia, idMotivo, ...data } = updateDenuncia;
    const usuario = await this.usuariosService.getById(idUsuario);
    const parroquia = await this.parroquiasService.getById(idParroquia);
    const motivo = await this.motivosSerive.getById(idMotivo);
    const newDenuncia = {
      ...data,
      usuario,
      motivo,
      parroquia,
    };
    await await this.denunciasRepository.update({ id }, newDenuncia);
  }

  // Fin

}
