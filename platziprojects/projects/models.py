from django.db import models

# Projects Models

class Stack(models.Model):

    name = models.CharField(max_length=100)
    description = models.TextField()

class Project(models.Model):

    name = models.CharField(max_length = 255)
    description = models.TextField()
    members = models.IntegerField()
    github = models.URLField(max_length=255)
    logo = models.ImageField(upload_to='media/logos', default = 'media/logos/nologo.png')
    stacks = models.ManyToManyField(Stack)
    stars = models.IntegerField(default = 0)

    created_at = models.DateTimeField(auto_now_add = True)
    updated_at = models.DateTimeField(auto_now = True)

    def save(self, *args, **kwargs):
        if self.stars > 5 or self.stars < 0:
            return 'Error: Stars have to be less or equal to 5'
        else:
            super().save(*args, **kwargs)



