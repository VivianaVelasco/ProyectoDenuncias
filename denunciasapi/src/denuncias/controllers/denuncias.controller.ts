import {
  Controller,
  Get,
  HttpCode,
  Post,
  Put,
  Delete,
  Body,
  Param,
  HttpException,
  HttpStatus,
  Query,
} from '@nestjs/common';
import { DenunciasService } from '../services/denuncias.service';
import { DenunciasDto } from '../denuncias.dto';
import { ApiTags } from '@nestjs/swagger';

@ApiTags('denuncias')
@Controller('denuncias')
export class DenunciasController {
  constructor(private denunciasService: DenunciasService) {}

  // David Terreros
  @Get('/recents')
  // @HttpCode(200)
  async getRecentDenuncias() {
    console.log('XD');
    const res = await this.denunciasService.findFiveRecent();
    return res;
  }

  @Post('')
  @HttpCode(200)
  async createDenuncia(@Body() denuncia: DenunciasDto) {
    const res = await this.denunciasService.create(denuncia);
    return res;
  }

  @Put(':id')
  @HttpCode(200)
  async editDenuncia(@Param('id') id: number, @Body() denuncia: DenunciasDto) {
    const res = await this.denunciasService.update(id, denuncia);
    return res;
  }

  // Fin

}
