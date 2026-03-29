import { Injectable, Logger } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import * as bcrypt from 'bcryptjs';
import { User, UserRole } from '../user/entities/user.entity';
import { Category } from '../product/entities/category.entity';

@Injectable()
export class DatabaseSeederService {
  private readonly logger = new Logger(DatabaseSeederService.name);

  constructor(
    @InjectRepository(User)
    private userRepository: Repository<User>,
    @InjectRepository(Category)
    private categoryRepository: Repository<Category>,
  ) {}

  async seedDefaultUser(): Promise<void> {
    try {
      await this.createDefaultUser();
      await this.createDefaultCategories();
    } catch (error) {
      this.logger.error('Error al inicializar la base de datos:', error);
    }
  }

  private async createDefaultUser(): Promise<void> {
    const userCount = await this.userRepository.count();

    if (userCount === 0) {
      const hashedPassword = await bcrypt.hash('admin123', 10);

      const defaultUser = this.userRepository.create({
        username: 'admin',
        name: 'Administrador',
        password: hashedPassword,
        address: 'TacnaMarket',
        role: UserRole.ADMIN,
      });

      await this.userRepository.save(defaultUser);
      this.logger.log('✓ Usuario admin por defecto creado (usuario: admin, contraseña: admin123)');
    }
  }

  private async createDefaultCategories(): Promise<void> {
    const categoryCount = await this.categoryRepository.count();

    if (categoryCount === 0) {
      const categories = [
        {
          name: 'Granos y Cereales',
          description: 'Granos, cereales y harinas para tu cocina',
        },
        {
          name: 'Aceites y Grasas',
          description: 'Aceites y grasas de calidad para cocinar',
        },
        {
          name: 'Bebidas',
          description: 'Bebidas refrescantes y saludables',
        },
        {
          name: 'Productos Lácteos',
          description: 'Productos lácteos frescos y nutritivos',
        },
        {
          name: 'Snacks y Frituras',
          description: 'Snacks y frituras deliciosas',
        },
      ];

      for (const categoryData of categories) {
        const category = this.categoryRepository.create(categoryData);
        await this.categoryRepository.save(category);
      }

      this.logger.log('✓ 5 categorías por defecto creadas');
    }
  }
}
