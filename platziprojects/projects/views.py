from django.shortcuts import render
from django.views.decorators.http import require_http_methods
from projects.models import Project
from django.views.generic import DetailView
# Create your views here.


@require_http_methods(["GET"])
def presentation(request):
    return render(request, 'presentation.html')

@require_http_methods(["GET"])
def list_projects(request):
    q = request.GET.get('q', False)
    if q:
        projects = Project.objects.filter(name__contains=q)
    else:
        projects = Project.objects.all()

    totalprojects = Project.objects.count()
    return render(request, 'list_projects.html', {'projects': projects, 'q': q, 'count': totalprojects})

class ProjectDetailView(DetailView):
    model = Project