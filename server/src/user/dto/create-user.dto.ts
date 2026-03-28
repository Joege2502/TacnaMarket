import { IsEmail, IsString, MinLength } from 'class-validator';

export class CreateUserDto {
  @IsString()
  name: string;

  @IsEmail()
  username: string;

  @IsString()
  @MinLength(8)
  password: string;

  @IsString()
  address: string;
}
