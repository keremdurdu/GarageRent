IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
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

