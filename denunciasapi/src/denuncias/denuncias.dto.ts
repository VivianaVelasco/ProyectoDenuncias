
export class DenunciasDto {
  readonly id: number;
  readonly title: string;
  readonly description: string;
  readonly createdAt: Date;
  readonly urlPhoto: string
  readonly idUsuario: number;
  readonly idParroquia: number;
  readonly idMotivo: number;
}
