# 🚀 SIRA - PROJECT HANDOFF & CONTEXT (FOR AI & DEV)

## 📌 CONTEXTE GLOBAL
Le projet "Sira" est un système de santé national (Bénin) incluant :
- **Sira-Mobile-App** : Application citoyen (Flutter).
- **Sira-Backend-API** : API et services métier (NestJS, Prisma, PostgreSQL).
- **Sira-Admin** : Portail pour le SAMU, Mutuelles et Hôpitaux (Next.js, Tailwind).

L'identité numérique est gérée via le NPI (Numéro Personnel d'Identification) béninois simulé et Firebase Auth.

---

## ✅ CE QUI A ÉTÉ FAIT JUSQU'À PRÉSENT (Phases 1 à 16)
- **Authentification & Inscription** : Firebase Auth (Email/Mot de passe/Google). 
- **Validation NPI** : Formulaire de vérification du Numéro Personnel d'Identification (béninois). **Le parcours KYC lourd a été abandonné** pour simplifier l'accès, le NPI suffit.
- **Base de Données (Backend)** : Modèle Prisma robuste avec les tables `User`, `Patient`, `SosAlert`, `Payment`, `MedicalRecord`, etc.
- **Interface Mobile (UI/UX)** : Écrans d'accueil (Dashboard), Profil, Dossier Médical, avec un design ultra-premium (animations, glassmorphism, AppColors).
- **Urgence & SOS (Phase 15)** : L'utilisateur peut déclencher un SOS médical. Les écrans de tracking de l'ambulance sont designés.
- **Paiement & Mutuelle (Phase 16)** : Module financier permettant de simuler un paiement de mutuelle via Mobile Money (PIN simulé). L'historique des cotisations s'affiche dynamiquement.
- **Sécurité** : JWT Middleware et Firebase Guard implémentés sur le backend.

---

## 🏗️ CE QUI A ÉTÉ INITIALISÉ (Mais reste à terminer - Phases 17 à 19)

### Phase 17 : Temps Réel (WebSockets)
- **Fait** : Installation de `socket.io` sur le Backend (`EventsGateway`). L'alerte SOS émet un event WebSocket lors de sa création et annulation.
- **Fait** : Le Mobile a un `SocketClient` et `SosTrackingScreen` s'y connecte pour mettre à jour le statut en temps réel.
- **À vérifier / Finaliser** : 
  - Vérifier la connexion effective entre le mobile et l'API (gérer les adresses IP `10.0.2.2` vs localhost ou IP publique Render).
  - Émettre des events continus (ex: GPS de l'ambulance).

### Phase 18 : Sira-Admin (Portail Web)
- **Fait** : Projet Next.js initialisé dans `Sira-Admin`.
- **À faire** : 
  - Connecter le portail au Backend NestJS.
  - Créer l'interface de réception des SOS en temps réel via WebSockets.
  - Créer l'interface de gestion des Mutuelles (voir les paiements).

### Phase 19 : Notifications Push (FCM)
- **Fait** : `firebase-admin` installé sur le Backend (`NotificationsService`).
- **Fait** : `firebase_messaging` installé sur le Mobile et permissions demandées dans `main.dart`.
- **À faire** : 
  - Enregistrer les tokens FCM des utilisateurs dans la base de données PostgreSQL lors de la connexion.
  - Faire en sorte que le Backend envoie réellement un push lors d'un changement de statut SOS.

---

## ⚠️ CE QUE LE NOUVEL AGENT DOIT VÉRIFIER EN PREMIER
1. **Lancement de l'API** : Faire `npm run start:dev` dans `Sira-Backend-API`. S'assurer que Prisma est synchronisé (`npx prisma db push`).
2. **Lancement du Mobile** : Exécuter `flutter run` sur un device physique Android. Vérifier qu'il n'y a plus d'erreur Riverpod ou d'UI.
3. **Lancement de l'Admin** : `npm run dev` dans `Sira-Admin` pour s'assurer que Next.js tourne bien.

---

## 📝 TÂCHES RESTANTES & AUDITS (À FAIRE PAR LE NOUVEL AGENT)
- [ ] **Audit Firebase** : Vérifier que les variables d'environnement (`google-services.json`, `Firebase Admin SDK`) sont bien configurées sur la machine de destination.
- [ ] **Backend - Sockets** : Tester avec Postman ou une app de test si `EventsGateway` accepte bien la connexion avec le Bearer token Firebase.
- [ ] **Backend - Déploiement** : Préparer le déploiement sur Render (créer le `Dockerfile` ou le fichier de build).
- [ ] **Mobile - FCM** : Implémenter la fonction qui récupère le token FCM (`FirebaseMessaging.instance.getToken()`) et l'envoie au Backend.
- [ ] **Sira-Admin** : Construire la carte (Google Maps / Leaflet) pour le tracking des ambulances.

> [!IMPORTANT]
> **Instructions pour l'Agent Antigravity :** 
> Lis attentivement ce document. L'utilisateur a changé de machine et cette nouvelle session reprend le flambeau. 
> Tu dois poursuivre l'intégration et demander à l'utilisateur de tester chaque point (Sockets, Push, Admin) un à un. Ne te disperse pas, suis l'ordre : Phase 17 (tests) -> Phase 18 (Sira-Admin) -> Phase 19 (Push) -> Phase 20 (Prod).
