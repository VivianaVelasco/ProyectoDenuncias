import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from 'typeorm';
import { Denuncias } from '../denuncias/denuncias.entity';
import { Usuarios } from '../users/users.entity';

@Entity()
export class Parroquias {
  @PrimaryGeneratedColumn('increment')
  id: number;

  @Column({})
  name: string;

  @OneToMany(() => Denuncias, (denuncias) => denuncias.id, { cascade: true })
  denuncias: Denuncias[];

  @OneToMany(() => Usuarios, (usuarios) => usuarios.id, { cascade: true })
  usuarios: Usuarios[];
}
