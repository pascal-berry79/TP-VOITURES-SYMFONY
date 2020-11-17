<?php

namespace App\Controller;

use App\Entity\Member;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;

class MembreController extends AbstractController
{
    /**
     * @Route("/membre", name="membre")
     */
    public function index(): Response
    {
        return $this->render('membre/index.html.twig', [
            'controller_name' => 'MembreController',
        ]);
    }

    /**
     * @Route("/voitures/create", name="create", methods={"GET", "POST"})
     */
    public function inscription(Request $request, EntityManagerInterface $em ): Response
    {
        $form= $this->createFormBuilder()
                -> add ('email', TextType::class)
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

}
