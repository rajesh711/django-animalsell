from django.db import models
from django.urls.base import reverse
from django.utils import timezone
from django.contrib.auth.models import User
from PIL import Image
from django.utils.safestring import mark_safe


class Post(models.Model):
    animal_group = models.IntegerField(null=True, blank=True)
    animal_breed = models.IntegerField(null=True, blank=True)
    animal_milk = models.IntegerField(null=True, blank=True)
    animal_color = models.CharField(max_length=100, null=True, blank=True)
    animal_age = models.CharField(max_length=100, null=True, blank=True)
    animal_weight = models.CharField(max_length=100, null=True, blank=True)
    animal_child = models.CharField(max_length=100, null=True, blank=True)
    animal_info = models.CharField(max_length=100, null=True, blank=True)
    animal_price = models.CharField(max_length=100, null=True, blank=True)
    front_image = models.ImageField(default='default.jpg', upload_to='animal_pics', null=True, blank=True)
    back_image = models.ImageField(default='default.jpg', upload_to='animal_pics', null=True, blank=True)
    left_image = models.ImageField(default='default.jpg', upload_to='animal_pics', null=True, blank=True)
    right_image = models.ImageField(default='default.jpg', upload_to='animal_pics', null=True, blank=True)
    approved_status = models.PositiveSmallIntegerField(default='0')
    delete_status = models.PositiveSmallIntegerField(default='0')
    sold_status = models.PositiveSmallIntegerField(default='0')
    user_name = models.CharField(max_length=100, null=True, blank=True)
    user_contact = models.CharField(max_length=100, null=True, blank=True)
    user_late = models.CharField(max_length=100, null=True, blank=True)
    user_long = models.CharField(max_length=100, null=True, blank=True)
    user_village = models.CharField(max_length=100, null=True, blank=True)
    user_address = models.TextField(null=True, blank=True)
    user_teh = models.CharField(max_length=100, null=True, blank=True)
    user_dist = models.CharField(max_length=100, null=True, blank=True)
    user_state = models.CharField(max_length=100, null=True, blank=True)
    user_country = models.CharField(max_length=100, null=True, blank=True)
    user_state_id = models.IntegerField(null=True, blank=True)
    user_country_id = models.IntegerField(null=True, blank=True)
    author = models.ForeignKey(User, on_delete=models.CASCADE)
    add_time = models.DateTimeField(default=timezone.now)

    def __str__(self):
        return self.user_name

    def link(self):
        url = reverse('admin-posts-details', args=[str(self.id)])
        return mark_safe('<a class="grp-button" href="%s" target="blank">view details page </a>' % url)

    def get_absolute_url(self):
        return reverse('post-detail', kwargs={'pk': self.pk})

    # def save(self, *args, **kwargs):
    #     super().save(*args, **kwargs)
    #
    #     img1 = Image.open(self.front_image.path)
    #     img2 = Image.open(self.back_image.path)
    #     img3 = Image.open(self.left_image.path)
    #     img4 = Image.open(self.right_image.path)
    #
    #     if img1.height > 300 or img1.width > 300:
    #         output_size = (300, 300)
    #         img1.thumbnail(output_size)
    #         img1.save(self.front_image.path)
    #     if img2.height > 300 or img2.width > 300:
    #         output_size = (300, 300)
    #         img2.thumbnail(output_size)
    #         img2.save(self.back_image.path)
    #     if img3.height > 300 or img3.width > 300:
    #         output_size = (300, 300)
    #         img3.thumbnail(output_size)
    #         img3.save(self.left_image.path)
    #     if img4.height > 300 or img4.width > 300:
    #         output_size = (300, 300)
    #         img4.thumbnail(output_size)
    #         img4.save(self.right_image.path)

    def image_tag(self):
        return mark_safe('<img src="%s" width="150" height="150" />' % str(self.front_image.url))


class Group(models.Model):
    en_name = models.CharField(max_length=100, null=True)
    in_name = models.CharField(max_length=100, null=True)
    mrt_name = models.CharField(max_length=100, null=True)
    image = models.ImageField(default='default.jpg')
    status = models.PositiveSmallIntegerField(default='0')

    def __str__(self):
        return self.en_name


class Type(models.Model):
    en_type = models.CharField(max_length=100, null=True)
    in_type = models.CharField(max_length=100, null=True)
    mrt_type = models.CharField(max_length=100, null=True)
    image = models.ImageField(default='default.jpg')
    status = models.PositiveSmallIntegerField(default='0')
    group = models.ForeignKey(Group, on_delete=models.CASCADE)

    def __str__(self):
        return self.en_type


class Country(models.Model):
    sortname = models.CharField(max_length=100, null=True)
    name = models.CharField(max_length=100, null=True)
    phonecode = models.CharField(max_length=100, null=True)


class State(models.Model):
    name = models.CharField(max_length=100, null=True)
    code = models.CharField(max_length=100, null=True)
    country = models.ForeignKey(Country, on_delete=models.CASCADE)


class LikeUnlike(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    animal = models.ForeignKey(Post, on_delete=models.CASCADE)
    like_unlike = models.PositiveSmallIntegerField(default='0')
    author = models.ForeignKey(User, on_delete=models.CASCADE)
    time = models.DateTimeField(default=timezone.now, blank=True)

    def __str__(self):
        return str(self.author)


class Comments(models.Model):
    animal = models.ForeignKey(Post, on_delete=models.CASCADE)
    author = models.ForeignKey(User, on_delete=models.CASCADE)
    name = models.CharField(max_length=255, blank=True, null=True)
    user_contact = models.CharField(max_length=100, null=True, blank=True)
    comment = models.CharField(max_length=255, blank=True, null=True)
    comment_status = models.PositiveSmallIntegerField(default='0')
    time = models.DateTimeField(default=timezone.now, blank=True)
    dlt_status = models.PositiveSmallIntegerField(default='0')

    def __str__(self):
        return self.name

    def active_inactive(self):
        url = reverse('admin-comment-details', args=[str(self.id)])
        return mark_safe('<a class="grp-button" style ="color:red;" href="%s" target="_self">Click ! </a>' % url)

    def image_tag(self):
        images = Post.objects.values_list('front_image', flat=True).filter(pk=self.animal_id)
        for image in images:
            image = image
        return mark_safe('<img src="/media/%s" width="150" height="150" />' % image)
