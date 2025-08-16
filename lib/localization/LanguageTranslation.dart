import 'dart:ui';
import 'package:get/get.dart';

class LanguageTranslation extends Translations {
  static Locale? get local => Get.deviceLocale;
  static final fallbackLocal = Locale('en', 'US');

  // English Translations
  static Map<String, String> englishKeys = {
    // App Bars
    "appBarTitle": "Fitness Club",
    "appBarBMICalculator": "BMI Calculator",
    "appBarWeeklyFitnessTasks": "Weekly Fitness Tasks",
    "appBarWaterIntakeTracker": "Water Intake Tracker",
    "appBarWorkoutPlan": "Create Your Workout Plan",
    "appBarChooseLanguage": "Choose Language",

    // General Labels
    "chooseLanguage": "Choose Language",
    "labelHeight": "Height (cm)",
    "labelWeight": "Weight (kg)",
    "labelDailyGoal": "Daily Goal: @goal glasses",
    "labelProgress": "@current / @goal",
    "labelChooseWorkout": "Choose a Workout",
    "labelChooseDay": "Choose a Day",
    "labelWeeklySchedule": "Your Weekly Workout Schedule",
    "yourName": "Your Name",

    // Buttons
    "buttonCalculateBMI": "Calculate BMI",
    "btnAddToPlan": "Add to Plan",
    "buttonOk": "Ok",
    "save": "Save",

    // BMI
    "checkYourBMI": "Check your BMI",
    "errorInvalidInput": "Please enter valid height and weight",
    "bmiResultPrefix": "Your BMI is",
    "categoryUnderweight": "Underweight",
    "categoryNormalWeight": "Normal weight",
    "categoryOverweight": "Overweight",
    "categoryObesity": "Obesity",

    // Workout Plan
    "workoutPlans": "Workout Plans",
    "msgNoWorkoutsAdded": "No workouts added.",

    // Workouts
    "Chest": "Chest",
    "Triceps": "Triceps",
    "Biceps": "Biceps",
    "Shoulders": "Shoulders",
    "Arms": "Arms",
    "Abs": "Abs",
    "Lats": "Lats",
    "Legs": "Legs",
    "Back": "Back",
    "Forearms": "Forearms",
    "Glutes": "Glutes",
    "Calves": "Calves",

    "Bench Press": "Bench Press",
    "Push-ups": "Push-ups",
    "Dumbbell Flyes": "Dumbbell Flyes",
    "Tricep Dips": "Tricep Dips",
    "Overhead Tricep Extension": "Overhead Tricep Extension",
    "Bicep Curls": "Bicep Curls",
    "Hammer Curls": "Hammer Curls",
    "Shoulder Press": "Shoulder Press",
    "Lateral Raises": "Lateral Raises",
    "Front Raises": "Front Raises",
    "Plank": "Plank",
    "Crunches": "Crunches",
    "Russian Twists": "Russian Twists",
    "Pull-ups": "Pull-ups",
    "Lat Pulldown": "Lat Pulldown",
    "Squats": "Squats",
    "Lunges": "Lunges",
    "Leg Press": "Leg Press",
    "Deadlifts": "Deadlifts",
    "Calf Raises": "Calf Raises",
    "Glute Bridges": "Glute Bridges",

    // Days of Week
    "Monday": "Monday",
    "Tuesday": "Tuesday",
    "Wednesday": "Wednesday",
    "Thursday": "Thursday",
    "Friday": "Friday",
    "Saturday": "Saturday",
    "Sunday": "Sunday",

    // Profile
    "profileSetting": "Profile Setting",
    "profile": "Profile",
  };

  // Spanish Translations
  static Map<String, String> spanishKeys = {
    // App Bars
    "appBarTitle": "Club de Fitness",
    "appBarBMICalculator": "Calculadora de IMC",
    "appBarWeeklyFitnessTasks": "Tareas de Fitness Semanales",
    "appBarWaterIntakeTracker": "Registro de Consumo de Agua",
    "appBarWorkoutPlan": "Crea tu plan de entrenamiento",
    "appBarChooseLanguage": "Elige idioma",

    // General Labels
    "chooseLanguage": "Elige idioma",
    "labelHeight": "Altura (cm)",
    "labelWeight": "Peso (kg)",
    "labelDailyGoal": "Meta diaria: @goal vasos",
    "labelProgress": "@current / @goal",
    "labelChooseWorkout": "Elige un ejercicio",
    "labelChooseDay": "Elige un día",
    "labelWeeklySchedule": "Tu horario semanal de ejercicios",
    "yourName": "Tu Nombre",

    // Buttons
    "buttonCalculateBMI": "Calcular IMC",
    "btnAddToPlan": "Agregar al plan",
    "buttonOk": "Aceptar",
    "save": "Guardar",

    // BMI
    "checkYourBMI": "Revisa tu IMC",
    "errorInvalidInput": "Por favor, ingrese altura y peso válidos",
    "bmiResultPrefix": "Tu IMC es",
    "categoryUnderweight": "Bajo peso",
    "categoryNormalWeight": "Peso normal",
    "categoryOverweight": "Sobrepeso",
    "categoryObesity": "Obesidad",

    // Workout Plan
    "workoutPlans": "Planes de Entrenamiento",
    "msgNoWorkoutsAdded": "No se añadieron ejercicios.",

    // Workouts
    "Chest": "Pecho",
    "Triceps": "Tríceps",
    "Biceps": "Bíceps",
    "Shoulders": "Hombros",
    "Arms": "Brazos",
    "Abs": "Abdominales",
    "Lats": "Dorsales",
    "Legs": "Piernas",
    "Back": "Espalda",
    "Forearms": "Antebrazos",
    "Glutes": "Glúteos",
    "Calves": "Pantorrillas",

    "Bench Press": "Press de banca",
    "Push-ups": "Flexiones",
    "Dumbbell Flyes": "Aperturas con mancuernas",
    "Tricep Dips": "Fondos para tríceps",
    "Overhead Tricep Extension": "Extensión de tríceps por encima de la cabeza",
    "Bicep Curls": "Curl de bíceps",
    "Hammer Curls": "Curl martillo",
    "Shoulder Press": "Press de hombros",
    "Lateral Raises": "Elevaciones laterales",
    "Front Raises": "Elevaciones frontales",
    "Plank": "Plancha",
    "Crunches": "Abdominales",
    "Russian Twists": "Giros rusos",
    "Pull-ups": "Dominadas",
    "Lat Pulldown": "Jalón al pecho",
    "Squats": "Sentadillas",
    "Lunges": "Zancadas",
    "Leg Press": "Prensa de piernas",
    "Deadlifts": "Peso muerto",
    "Calf Raises": "Elevación de talones",
    "Glute Bridges": "Puente de glúteos",

    // Days of Week
    "Monday": "Lunes",
    "Tuesday": "Martes",
    "Wednesday": "Miércoles",
    "Thursday": "Jueves",
    "Friday": "Viernes",
    "Saturday": "Sábado",
    "Sunday": "Domingo",

    // Profile
    "profileSetting": "Configuración de perfil",
    "profile": "Perfil",
  };

  @override
  Map<String, Map<String, String>> get keys => {
    "en_US": englishKeys,
    "es_ES": spanishKeys,
  };
}
