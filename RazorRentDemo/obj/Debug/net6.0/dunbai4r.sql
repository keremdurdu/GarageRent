﻿IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

CREATE TABLE [Car] (
    [Id] int NOT NULL IDENTITY,
    [Brand] nvarchar(max) NOT NULL,
    [Avaliable] bit NOT NULL DEFAULT CAST(1 AS bit),
    [UnitPrice] int NOT NULL,
    CONSTRAINT [PK_Car] PRIMARY KEY ([Id])
);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20230314181930_ilk', N'6.0.14');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

DECLARE @var0 sysname;
SELECT @var0 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Car]') AND [c].[name] = N'Brand');
IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [Car] DROP CONSTRAINT [' + @var0 + '];');
ALTER TABLE [Car] ALTER COLUMN [Brand] nvarchar(20) NOT NULL;
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20230314182406_CarMOdelDegisti', N'6.0.14');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20230315124227_add-migration CarModelDegisti', N'6.0.14');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

CREATE TABLE [Reservations] (
    [Id] int NOT NULL IDENTITY,
    [CustomerName] nvarchar(50) NOT NULL,
    [Start] datetime2 NOT NULL,
    [End] datetime2 NOT NULL,
    [TotalPrice] int NOT NULL,
    [CarId] int NOT NULL,
    CONSTRAINT [PK_Reservations] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Reservations_Car_CarId] FOREIGN KEY ([CarId]) REFERENCES [Car] ([Id]) ON DELETE CASCADE
);
GO

CREATE INDEX [IX_Reservations_CarId] ON [Reservations] ([CarId]);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20230315131447_eklentiler', N'6.0.14');
GO

COMMIT;
GO

