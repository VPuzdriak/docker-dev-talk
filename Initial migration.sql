USE master
GO

IF NOT EXISTS (
    SELECT [name]
        FROM sys.databases
        WHERE [name] = N'DockerSampleDb'
)
CREATE DATABASE DockerSampleDb
GO

USE DockerSampleDb

CREATE TABLE [Images] (
    [Id] UNIQUEIDENTIFIER PRIMARY KEY,
    [Tag] NVARCHAR(MAX),
    [Size] FLOAT
)

INSERT INTO [Images] ([Id], [Tag], [Size]) VALUES (NEWID(), N'nginx', 150)
INSERT INTO [Images] ([Id], [Tag], [Size]) VALUES (NEWID(), N'nginx:alpine', 35)