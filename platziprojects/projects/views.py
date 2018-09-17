from django.shortcuts import render
from django.views.decorators.http import require_http_methods

# Create your views here.

links = [
    'Projects'
]

@require_http_methods(["GET"])
def presentation(request):
    return render(request, 'presentation.html')

@require_http_methods(["GET"])
def list_projects(request):
    projects = [
        {
            'name':'Proyecto1',
            'description':'Este proyecto es para esto',
        },
        {
            'name':'Proyecto2',
            'description':'Este proyecto es para esto',
        },
        {
            'name':'Proyecto3',
            'description':'Este proyecto es para esto',
        },
        {
            'name':'Proyecto4',
            'description':'Este proyecto es para esto',
        },
    ]
    return render(request, 'list_projects.html', {'projects': projects})