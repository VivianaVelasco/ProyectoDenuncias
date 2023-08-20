import { Body, Controller, Get, HttpCode, Post } from '@nestjs/common';
import { ParroquiasService } from '../services/parroquias.service';
import { ParroquiasDto } from '../parroquias.dto';
import { ApiTags } from '@nestjs/swagger';

@ApiTags("parroquias")
@Controller('parroquias')
export class ParroquiasController {

    constructor(private parroquiasService: ParroquiasService){}

    @Get("/")
    @HttpCode(200)
    async getAllMotivos() {
        return await this.parroquiasService.getAll();
    }

    @Post("/")
    @HttpCode(200)
    async createMotivo(@Body() parroquia: ParroquiasDto) {
        return await this.parroquiasService.create(parroquia);
    }
}
