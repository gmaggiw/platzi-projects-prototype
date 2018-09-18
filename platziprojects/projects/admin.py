from django.contrib import admin
from projects.models import Project, Stack
from django.utils.html import mark_safe
# Register your models here.



@admin.register(Project)
class ProjectAdmin(admin.ModelAdmin):

    list_display = ('pk','name','description','members','github','logo_image')
    list_display_links = ('pk','name')
    search_fields = ('name','description','github')

    list_filter = ('created_at','updated_at')

    def logo_image(self, obj):
        return mark_safe('<img src="{url}" width="{width}" />'.format(
            url = obj.logo.url,
            width=72
            )
    )

@admin.register(Stack)
class StackAdmin(admin.ModelAdmin):
    list_display = ('pk','name','description')
    list_display_links = ('pk','name')
    search_fields = ('name','description')
