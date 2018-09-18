from django.shortcuts import render
from django.views.decorators.http import require_http_methods
from projects.models import Project
# Create your views here.


@require_http_methods(["GET"])
def presentation(request):
    return render(request, 'presentation.html')

@require_http_methods(["GET"])
def list_projects(request):
    projects = Project.objects.all()
    return render(request, 'list_projects.html', {'projects': projects})