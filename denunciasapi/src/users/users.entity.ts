import {
  Column,
  Entity,
  ManyToMany,
  OneToMany,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { Denuncias } from '../denuncias/denuncias.entity';
import { Parroquias } from '../parroquias/parroquias.entity';

@Entity()
export class Usuarios {
  @PrimaryGeneratedColumn('increment')
  id: number;

  @Column({})
  names: string;

  @Column()
  email: string;

  @Column({ select: false })
  password: string;

  @Column({
    type: 'timestamptz',
    default: () => 'CURRENT_TIMESTAMP',
    select: false,
  })
  createdAt: Date;

  @Column({ select: false })
  phoneNumber: string;

  @Column({ length: '10', select: false })
  cedula: string;

  @Column({ type: 'date', select: false })
  birthDate: Date;

  @OneToMany(() => Denuncias, (denuncias) => denuncias.usuario, {
    cascade: true,
  })
  denuncias: Denuncias[];

  @ManyToMany(() => Parroquias, (parroquia) => parroquia.denuncias)
  parroquia: Parroquias;
}
