import { DenunciasDto } from '../denuncias/denuncias.dto';
import { ParroquiasDto } from '../parroquias/parroquias.dto';

export class UsuariosDto {
  readonly id: number;
  readonly names: string;
  readonly email: string;
  readonly password: string;
  readonly createdAt: Date;
  readonly phoneNumber: string;
  readonly cedula: string; 
  readonly birthDate: Date;
  readonly denuncias: DenunciasDto[];
  readonly parroquia: ParroquiasDto
}
