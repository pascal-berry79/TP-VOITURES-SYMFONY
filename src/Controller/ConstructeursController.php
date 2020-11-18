<?php

namespace App\Controller;

use App\Entity\Constructeurs;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ConstructeursController extends AbstractController
{
    /**
     * @Route("/constructeurs", name="constructeurs")
     */
    public function index(EntityManagerInterface $em): Response
    {
        $repository=$em->getRepository(Constructeurs::class);
        $constructeurs = $repository -> findAll();

        return $this->render('constructeurs/index.html.twig', [
            'constructeurs' => $constructeurs,
        ]);
    }
    
     /**
     * @Route("/constructeurs/{id}", name="constructeur")
     */
    public function constructPage(int $id, EntityManagerInterface $em): Response
    {
       $repository=$em->getRepository(Constructeurs::class);
       $constructeur = $repository->find($id);

       return $this->render('constructeurs/constructeur.html.twig', [
           'constructeur' => $constructeur,
       ]);
    }

}
