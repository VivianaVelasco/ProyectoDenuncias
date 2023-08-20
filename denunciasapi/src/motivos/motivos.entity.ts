import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from 'typeorm';
import { Denuncias } from '../denuncias/denuncias.entity';

@Entity()
export class Motivos {
  @PrimaryGeneratedColumn('increment')
  id: number;

  @Column({})
  name: string;

  @OneToMany(() => Denuncias, (denuncias) => denuncias.id, { cascade: true })
  denuncias: Denuncias[];
}
