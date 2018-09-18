from django.db import models

# Projects Models

class Stack(models.Model):

    name = models.CharField(max_length=100)
    description = models.TextField()

class Project(models.Model):

    name = models.CharField(max_length = 255)
    description = models.TextField()
    members = models.IntegerField()
    github = models.CharField(max_length = 255)
    image = models.CharField(max_length = 255)
    stacks = models.ManyToManyField(Stack)

    created_at = models.DateTimeField(auto_now_add = True)
    updated_at = models.DateTimeField(auto_now = True)



