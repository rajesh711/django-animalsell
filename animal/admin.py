from django.contrib import admin

from .models import Post, Comments, Group, Type, LikeUnlike

admin.site.site_header = 'Admin Dashboard'
# admin.site.register(Comments)
admin.site.register(Group)
admin.site.register(Type)
admin.site.register(LikeUnlike)


class animal_post(admin.ModelAdmin):
    list_display = ('user_name', 'image_tag', 'user_contact', 'approved_status', 'add_time', 'link')
    list_filter = ('add_time', 'user_name')
    search_fields = ['user_dist', 'animal_group']
    list_per_page = 10
    readonly_fields = ['image_tag']


admin.site.register(Post, animal_post)


class animal_comment(admin.ModelAdmin):
    list_display = ('name', 'image_tag', 'user_contact', 'comment', 'comment_status', 'time', 'active_inactive')
    list_filter = ('time', 'name', 'comment_status')
    list_per_page = 10


admin.site.register(Comments, animal_comment)
