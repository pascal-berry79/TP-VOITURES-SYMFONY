<?php

namespace App\Controller;

use App\Entity\Voitures;
use App\Entity\Constructeurs;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;

class VoituresController extends AbstractController
{
    /**
     * @Route("/voitures", name="voitures")
     */
    public function index(EntityManagerInterface $em): Response
    {
        $repository=$em->getRepository(Voitures::class);
        $voitures = $repository -> findAll();
        return $this->render('voitures/index.html.twig', [
            'voitures' => $voitures,
        ]);
    }

    /**
     * @Route("/voitures/create", name="create", methods={"GET", "POST"})
     */
    public function create(Request $request, EntityManagerInterface $em ): Response
    {
        $form= $this->createFormBuilder()
                -> add ('modele', TextType::class)
                -> add ('annee', IntegerType::class)
                -> add ('image', TextType::class)
                -> add ('resume', TextareaType::class)
                -> add ('id_constructeur_id', ChoiceType::class, ['choices'  => [
                    'Bugatti' => 1,
                    'Chenard & Walcker' => 2,
                    'Delâge' => 3,
                    'Delahaye' => 4,
                ],])
                -> add ('submit', SubmitType::class, ['label' => 'Envoyer'])
                -> getForm();

        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $donnee = $form ->getData();
            $voiture = new Voiture;
            $voiture->setModele($donnee);
            $voiture->setAnnee($donnee);
            $voiture->setImage($donnee);
            $voiture->setResume($donnee);
            $voiture->setIdConstructeur($donnee);
            $em-> persist($voiture);
            $em-> flush();

            return $this->redirectToRoute('voitures');
        }

        return $this->render('voitures/create.html.twig', [
            'formulaire'=>$form->createView()
        ]);
    }

    /**
     * @Route("/voitures/{id}")
     */
     public function voiturePage(int $id, EntityManagerInterface $em): Response
     {
        $repository=$em->getRepository(Voitures::class);
        $voiture = $repository->JeanLuc($id);
        // dd($voiture);

        return $this->render('voitures/voiture.html.twig', [
            'voiture' => $voiture,
        ]);
     }
}
