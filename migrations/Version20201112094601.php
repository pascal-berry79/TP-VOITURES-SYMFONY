<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20201112094601 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE constructeurs (id INT AUTO_INCREMENT NOT NULL, nom VARCHAR(255) NOT NULL, logo VARCHAR(255) NOT NULL, image VARCHAR(255) NOT NULL, resume LONGTEXT NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE voitures (id INT AUTO_INCREMENT NOT NULL, id_constructeur_id INT NOT NULL, modele VARCHAR(255) NOT NULL, annee INT NOT NULL, image VARCHAR(255) NOT NULL, resume LONGTEXT NOT NULL, INDEX IDX_8B58301B614B758D (id_constructeur_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE voitures ADD CONSTRAINT FK_8B58301B614B758D FOREIGN KEY (id_constructeur_id) REFERENCES constructeurs (id)');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE voitures DROP FOREIGN KEY FK_8B58301B614B758D');
        $this->addSql('DROP TABLE constructeurs');
        $this->addSql('DROP TABLE voitures');
    }
}
