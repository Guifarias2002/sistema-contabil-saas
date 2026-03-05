-- EXTENSIONS
create extension if not exists "uuid-ossp";

-- TABELA EMPRESAS
create table empresas (
  id uuid primary key default uuid_generate_v4(),
  nome text not null,
  cnpj text unique not null,
  regime_tributario text not null,
  data_abertura date,
  created_at timestamp default now()
);

-- TABELA USUARIOS
create table usuarios (
  id uuid primary key default uuid_generate_v4(),
  empresa_id uuid references empresas(id) on delete cascade,
  nome text not null,
  email text unique not null,
  created_at timestamp default now()
);

-- TABELA LANCAMENTOS
create table lancamentos (
  id uuid primary key default uuid_generate_v4(),
  empresa_id uuid references empresas(id) on delete cascade,
  tipo text check (tipo in ('entrada','saida')),
  categoria text,
  descricao text,
  valor numeric(12,2) not null,
  data date not null,
  created_at timestamp default now()
);

-- TABELA IMPOSTOS
create table impostos (
  id uuid primary key default uuid_generate_v4(),
  empresa_id uuid references empresas(id) on delete cascade,
  tipo_imposto text,
  competencia text,
  valor numeric(12,2),
  vencimento date,
  status text default 'pendente',
  created_at timestamp default now()
);
