<?php

namespace App\Controller;


use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManagerInterface;
use App\Repository\VoituresRepository;
use App\Entity\Voitures;
use App\Repository\ConstructeursRepository;
use App\Entity\Constructeurs;


class AccueilController extends AbstractController
{
    /**
     * @Route("/", name="accueil")
     */
    public function index(VoituresRepository $VoituresRepository,ConstructeursRepository $ConstructeursRepository, EntityManagerInterface $em): Response
    {

        $voitures = $VoituresRepository->findBy([], ['id'=>'DESC'], 3);
        // $constructeur = $ConstructeursRepository->findRandomConstructeurs(Constructeurs::class);
        return $this->render('accueil/index.html.twig', [
            'voitures' => $voitures,
            // 'constructeur' => $constructeur,
        ]);
    

    }
}
