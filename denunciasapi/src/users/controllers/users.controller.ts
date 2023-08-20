import { Body, Controller, Post } from '@nestjs/common';
import { UsersService } from '../services/users.service';
import { UsuariosDto } from '../users.dto';
import { ApiTags } from '@nestjs/swagger';

@ApiTags("usuarios")
@Controller('usuarios')
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  @Post("/register")
  // @HttpCode(200)
  async registerUser(@Body() user: UsuariosDto) {
    return await this.usersService.create(user)
  }
}
