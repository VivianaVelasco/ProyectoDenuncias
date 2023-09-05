import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Brackets, Repository, UnorderedBulkOperation } from 'typeorm';
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
      .leftJoinAndSelect('denuncias.motivo', 'motivos')
      .leftJoinAndSelect('denuncias.usuario', 'usuarios')
      .leftJoinAndSelect('denuncias.parroquia', 'parroquias')
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

  // Viviana Velasco
  async findOne(id: number) {
    return await this.denunciasRepository.findOneBy({ id });
  }

  async delete(id: number) {
    return await this.denunciasRepository.delete({ id });
  }

  async getByUsuario(id: number): Promise<Denuncias[]> {
    return await this.denunciasRepository.find({
      relations: {
        usuario: true,
        parroquia: true,
        motivo: true,
      },
      where: {
        usuario: {
          id,
        },
      },
    });
  }

  async getByFilter(parroquia: number, motivo: number): Promise<Denuncias[]> {
    console.log(parroquia, motivo);
    let q = await this.denunciasRepository
      .createQueryBuilder('denuncias')
      .leftJoinAndSelect('denuncias.motivo', 'motivos')
      .leftJoinAndSelect('denuncias.usuario', 'usuarios')
      .leftJoinAndSelect('denuncias.parroquia', 'parroquias');

    if (parroquia !== 0 && parroquia !== undefined) {
      q = await q.where('denuncias.parroquia.id = :id', { id: parroquia });
    }

    if (motivo !== 0 && motivo !== undefined) {
      q = await q.where('denuncias.motivo.id = :id', { id: motivo });
    }

    return q.getMany();
  }
  // Fin
}
