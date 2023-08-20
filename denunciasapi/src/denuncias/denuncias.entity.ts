import { Column, Entity, ManyToOne, PrimaryGeneratedColumn } from 'typeorm';
import { Usuarios } from '../users/users.entity';
import { Parroquias } from '../parroquias/parroquias.entity';
import { Motivos } from '../motivos/motivos.entity';

@Entity()
export class Denuncias {
  @PrimaryGeneratedColumn('increment')
  id: number;

  @Column({})
  title: string;

  @Column()
  description: string;

  @Column({ type: 'timestamptz', default: () => 'CURRENT_TIMESTAMP' })
  createdAt: Date;

  @Column()
  urlPhoto: string;

  @ManyToOne(() => Usuarios, (usuario) => usuario.denuncias)
  usuario: Usuarios;

  @ManyToOne(() => Parroquias, (parroquia) => parroquia.denuncias)
  parroquia: Parroquias;

  @ManyToOne(() => Motivos, (motivo) => motivo.denuncias)
  motivo: Motivos;
}
