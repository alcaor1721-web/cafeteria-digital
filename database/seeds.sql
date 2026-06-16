-- Datos iniciales para la base de datos

-- Insertar categorías
INSERT INTO categories (id, name, description, color, display_order) VALUES
('123e4567-e89b-12d3-a456-426614174000', 'Bebidas', 'Bebidas variadas', '#FF6B6B', 1),
('123e4567-e89b-12d3-a456-426614174001', 'Comidas Rápidas', 'Hamburguesas, pizzas y más', '#4ECDC4', 2),
('123e4567-e89b-12d3-a456-426614174002', 'Postres', 'Helados y dulces', '#FFE66D', 3),
('123e4567-e89b-12d3-a456-426614174003', 'Ensaladas', 'Opciones saludables', '#95E1D3', 4),
('123e4567-e89b-12d3-a456-426614174004', 'Desayunos', 'Pan, cereales y más', '#A8D8EA', 5);

-- Insertar usuario administrador de prueba
INSERT INTO users (id, email, password_hash, full_name, role) VALUES
('223e4567-e89b-12d3-a456-426614174000', 'admin@cafeteria.com', '$2a$10$YourHashedPasswordHere', 'Administrador', 'admin');

-- Insertar usuario estudiante de prueba
INSERT INTO users (id, email, password_hash, full_name, role, school_id) VALUES
('223e4567-e89b-12d3-a456-426614174001', 'estudiante@escuela.com', '$2a$10$YourHashedPasswordHere', 'Juan Pérez', 'student', 'EST-001');

-- Insertar productos de ejemplo
INSERT INTO products (id, category_id, name, description, price, preparation_time, created_by) VALUES
('323e4567-e89b-12d3-a456-426614174000', '123e4567-e89b-12d3-a456-426614174000', 'Coca Cola', 'Bebida gaseosa 330ml', 2.50, 0, '223e4567-e89b-12d3-a456-426614174000'),
('323e4567-e89b-12d3-a456-426614174001', '123e4567-e89b-12d3-a456-426614174000', 'Jugo Natural', 'Jugo natural de frutas 250ml', 3.00, 5, '223e4567-e89b-12d3-a456-426614174000'),
('323e4567-e89b-12d3-a456-426614174002', '123e4567-e89b-12d3-a456-426614174001', 'Hamburguesa Clásica', 'Carne molida, lechuga y tomate', 5.99, 15, '223e4567-e89b-12d3-a456-426614174000'),
('323e4567-e89b-12d3-a456-426614174003', '123e4567-e89b-12d3-a456-426614174001', 'Pizza Margarita', 'Queso y tomate fresco', 6.99, 20, '223e4567-e89b-12d3-a456-426614174000'),
('323e4567-e89b-12d3-a456-426614174004', '123e4567-e89b-12d3-a456-426614174002', 'Helado de Vainilla', 'Helado cremoso 100ml', 2.00, 0, '223e4567-e89b-12d3-a456-426614174000'),
('323e4567-e89b-12d3-a456-426614174005', '123e4567-e89b-12d3-a456-426614174003', 'Ensalada César', 'Lechuga, pollo y aderezo', 5.50, 10, '223e4567-e89b-12d3-a456-426614174000');

-- Insertar inventario inicial
INSERT INTO inventory (id, product_id, quantity_available, reorder_level, reorder_quantity) VALUES
('423e4567-e89b-12d3-a456-426614174000', '323e4567-e89b-12d3-a456-426614174000', 50, 10, 30),
('423e4567-e89b-12d3-a456-426614174001', '323e4567-e89b-12d3-a456-426614174001', 40, 10, 25),
('423e4567-e89b-12d3-a456-426614174002', '323e4567-e89b-12d3-a456-426614174002', 30, 5, 20),
('423e4567-e89b-12d3-a456-426614174003', '323e4567-e89b-12d3-a456-426614174003', 25, 5, 15),
('423e4567-e89b-12d3-a456-426614174004', '323e4567-e89b-12d3-a456-426614174004', 60, 15, 40),
('423e4567-e89b-12d3-a456-426614174005', '323e4567-e89b-12d3-a456-426614174005', 20, 5, 15);

-- Insertar puntos iniciales para usuario
INSERT INTO points (id, user_id, balance, lifetime_earned) VALUES
('523e4567-e89b-12d3-a456-426614174000', '223e4567-e89b-12d3-a456-426614174001', 0, 0);
