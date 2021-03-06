<?php

namespace App\Repository;

use App\Entity\Voitures;
use App\Entity\Constructeurs;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Voitures|null find($id, $lockMode = null, $lockVersion = null)
 * @method Voitures|null findOneBy(array $criteria, array $orderBy = null)
 * @method Voitures[]    findAll()
 * @method Voitures[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */

class VoituresRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Voitures::class);
    }

    public function JeanLuc(int $value) {
        $em = $this->getEntityManager();
        $query = $em->createQuery("SELECT v, c FROM App\Entity\Voitures v JOIN v.id_constructeur c WHERE v.id = :value");
        $query->setParameter('value', $value);
        $result = $query->getResult();
        return $result;
    }

    // /**
    //  * @return Voitures[] Returns an array of Voitures objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('v')
            ->andWhere('v.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('v.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Voitures
    {
        return $this->createQueryBuilder('v')
            ->andWhere('v.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
