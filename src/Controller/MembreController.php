<?php

namespace App\Controller;

use App\Entity\Member;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Validator\Constraints\NotBlank;

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
     * @Route("/newmember", name="formnewmember", methods={"GET", "POST"})
     */
    public function inscription(Request $request, EntityManagerInterface $em ): Response
    {
        $form= $this->createFormBuilder()
                -> add ('email', EmailType::class,[
                    'constraints' => [
                        new NotBlank([
                            'message' => 'Merci d\'entrer un e-mail',
                        ]),
                    ],
                    'required' => true,
                    'attr' => ['class' =>'form-control'],
                ])
                -> add ('username', TextType::class)
                ->add('password', RepeatedType::class, array(
                    'type' => PasswordType::class,
                    'first_options'  => array('label' => 'Votre password'),
                    'second_options' => array('label' => 'Répéter le password'),
                ))
                -> add ('submit', SubmitType::class, ['label' => 'Envoyer'])
                -> getForm();

        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $donnee = $form ->getData();
            $voiture = new Member;
            $voiture->setEmail($donnee);
            $voiture->setUsername($donnee);
            $voiture->password_hash(setPassword($donnee), PASSWORD_DEFAULT);
            $em-> persist($voiture);
            $em-> flush();

            return $this->redirectToRoute('accueil');
        }

        return $this->render('membre/form.html.twig', [
            'formulaire'=>$form->createView()
        ]);
    }

}
