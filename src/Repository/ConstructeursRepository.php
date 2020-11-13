<?php

namespace App\Repository;

use App\Entity\Constructeurs;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Constructeurs|null find($id, $lockMode = null, $lockVersion = null)
 * @method Constructeurs|null findOneBy(array $criteria, array $orderBy = null)
 * @method Constructeurs[]    findAll()
 * @method Constructeurs[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ConstructeursRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Constructeurs::class);
    }

    // /**
    //  * @return Constructeurs[] Returns an array of Constructeurs objects
    //  */
    // public function findRandomConstructeurs(){
    //     return $this->createQueryBuilder('c')
    //         ->orderBy('RAND()')
    //         ->setMaxResults(1)
    //         ->getQuery()
    //         ->getResult()
    //     ;
    // }

    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('c.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Constructeurs
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
