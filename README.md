# Platzi Projects

Platzi Projects es una propuesta para la generación de un espacio en la comunidad de Platzi, que promueva y facilite el desarrollo de proyectos colaborativos entre los miembros de la comunidad, con la finalidad de darle la oportunidad a los estudiantes de demostrar sus conocimientos ante terceros, y a su vez generar un ecosistema de generación de valor para la comunidad y para la empresa.

Este repositorio contiene un prototipo funcional para ayudar a visualizar cómo sería la dinámica de este nuevo espacio.

Cualquier recomendación o sugerencia sientanse libres de aportar.

## Instalación


 1. Clonar el proyecto
    ```bash
    git clone https://github.com/gmaggiw/platzi-projects-prototype
    ```
 2. Cambiarse a la ruta del proyecto
    ```bash
    cd platzi-projects-prototype
    ```
 3. Crear el entorno virtual de python
    ```bash
    python3 -m venv .venv
    ```
 4. Instalar los requerimientos
    ```bash
    pip install -r requirements.txt
    ```
 5. Cambiar a la carpeta del proyecto django
    ```bash
    cd platziprojects
    ```
 6. Ejecutar las migraciones
    ```bash
    python manage.py migration
    ```
 7. Cargar la data de demo
    ```bash
    python manage.py loaddata projects
    ```
 8. Ejecutar el servidor de desarrollo de django
    ```bash
    python manage.py runserver
    ```
 9. Ir a la url: http://localhost:8000