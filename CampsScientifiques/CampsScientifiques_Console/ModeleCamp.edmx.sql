
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/09/2020 14:37:45
-- Generated from EDMX file: C:\Users\1232291\source\repos\CampsScientifiques\CampsScientifiques_Console\ModeleCamp.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [C3Q5sambour];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_CampJeune_Camp]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CampJeune] DROP CONSTRAINT [FK_CampJeune_Camp];
GO
IF OBJECT_ID(N'[dbo].[FK_CampJeune_Jeune]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CampJeune] DROP CONSTRAINT [FK_CampJeune_Jeune];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[TCamps]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TCamps];
GO
IF OBJECT_ID(N'[dbo].[TJeunes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TJeunes];
GO
IF OBJECT_ID(N'[dbo].[CampJeune]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CampJeune];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'TCamps'
CREATE TABLE [dbo].[TCamps] (
    [oidCamp] int IDENTITY(1,1) NOT NULL,
    [Titre] nvarchar(max)  NOT NULL,
    [AgeRequis] int  NOT NULL,
    [NiveauRequis] int  NOT NULL
);
GO

-- Creating table 'TJeunes'
CREATE TABLE [dbo].[TJeunes] (
    [oidJeune] int IDENTITY(1,1) NOT NULL,
    [Nom] nvarchar(max)  NOT NULL,
    [NiveauComplete] int  NOT NULL,
    [AgeCourant] int  NOT NULL
);
GO

-- Creating table 'CampJeune'
CREATE TABLE [dbo].[CampJeune] (
    [HistoriqueCamps_oidCamp] int  NOT NULL,
    [CampJeune_Camp_oidJeune] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [oidCamp] in table 'TCamps'
ALTER TABLE [dbo].[TCamps]
ADD CONSTRAINT [PK_TCamps]
    PRIMARY KEY CLUSTERED ([oidCamp] ASC);
GO

-- Creating primary key on [oidJeune] in table 'TJeunes'
ALTER TABLE [dbo].[TJeunes]
ADD CONSTRAINT [PK_TJeunes]
    PRIMARY KEY CLUSTERED ([oidJeune] ASC);
GO

-- Creating primary key on [HistoriqueCamps_oidCamp], [CampJeune_Camp_oidJeune] in table 'CampJeune'
ALTER TABLE [dbo].[CampJeune]
ADD CONSTRAINT [PK_CampJeune]
    PRIMARY KEY CLUSTERED ([HistoriqueCamps_oidCamp], [CampJeune_Camp_oidJeune] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [HistoriqueCamps_oidCamp] in table 'CampJeune'
ALTER TABLE [dbo].[CampJeune]
ADD CONSTRAINT [FK_CampJeune_Camp]
    FOREIGN KEY ([HistoriqueCamps_oidCamp])
    REFERENCES [dbo].[TCamps]
        ([oidCamp])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [CampJeune_Camp_oidJeune] in table 'CampJeune'
ALTER TABLE [dbo].[CampJeune]
ADD CONSTRAINT [FK_CampJeune_Jeune]
    FOREIGN KEY ([CampJeune_Camp_oidJeune])
    REFERENCES [dbo].[TJeunes]
        ([oidJeune])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CampJeune_Jeune'
CREATE INDEX [IX_FK_CampJeune_Jeune]
ON [dbo].[CampJeune]
    ([CampJeune_Camp_oidJeune]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------