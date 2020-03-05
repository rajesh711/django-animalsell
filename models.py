# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class AnimalCountry(models.Model):
    sortname = models.CharField(max_length=3)
    name = models.CharField(max_length=150)
    phonecode = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'animal_country'


class AnimalGroup(models.Model):
    en_name = models.CharField(max_length=100, blank=True, null=True)
    in_name = models.CharField(max_length=100, blank=True, null=True)
    mrt_name = models.CharField(max_length=100, blank=True, null=True)
    image = models.CharField(max_length=100)
    status = models.PositiveSmallIntegerField()

    class Meta:
        managed = False
        db_table = 'animal_group'


class AnimalLikeunlike(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)  # Field name made lowercase.
    like_unlike = models.PositiveSmallIntegerField()
    time = models.DateTimeField()
    animal = models.ForeignKey('AnimalPost', models.DO_NOTHING)
    author = models.ForeignKey('AuthUser', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'animal_likeunlike'


class AnimalPost(models.Model):
    animal_group = models.CharField(max_length=250, blank=True, null=True)
    animal_breed = models.CharField(max_length=250, blank=True, null=True)
    animal_milk = models.CharField(max_length=255, blank=True, null=True)
    animal_color = models.CharField(max_length=100, blank=True, null=True)
    animal_age = models.CharField(max_length=100, blank=True, null=True)
    animal_weight = models.CharField(max_length=100, blank=True, null=True)
    animal_child = models.CharField(max_length=100, blank=True, null=True)
    animal_info = models.CharField(max_length=100, blank=True, null=True)
    animal_price = models.CharField(max_length=100, blank=True, null=True)
    front_image = models.CharField(max_length=255, blank=True, null=True)
    back_image = models.CharField(max_length=255, blank=True, null=True)
    left_image = models.CharField(max_length=255, blank=True, null=True)
    right_image = models.CharField(max_length=255, blank=True, null=True)
    approved_status = models.PositiveSmallIntegerField()
    delete_status = models.PositiveSmallIntegerField()
    sold_status = models.PositiveSmallIntegerField()
    user_name = models.CharField(max_length=100, blank=True, null=True)
    user_contact = models.CharField(max_length=100, blank=True, null=True)
    user_late = models.CharField(max_length=100, blank=True, null=True)
    user_long = models.CharField(max_length=100, blank=True, null=True)
    user_village = models.CharField(max_length=100, blank=True, null=True)
    user_address = models.TextField(blank=True, null=True)
    user_teh = models.CharField(max_length=100, blank=True, null=True)
    user_dist = models.CharField(max_length=100, blank=True, null=True)
    user_state = models.CharField(max_length=100, blank=True, null=True)
    user_country = models.CharField(max_length=100, blank=True, null=True)
    user_state_id = models.IntegerField(blank=True, null=True)
    user_country_id = models.IntegerField(blank=True, null=True)
    add_time = models.DateTimeField()
    author = models.ForeignKey('AuthUser', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'animal_post'


class AnimalState(models.Model):
    name = models.CharField(max_length=30)
    country_id = models.IntegerField()
    code = models.CharField(max_length=200, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'animal_state'


class AnimalType(models.Model):
    en_type = models.CharField(max_length=100, blank=True, null=True)
    in_type = models.CharField(max_length=100, blank=True, null=True)
    mrt_type = models.CharField(max_length=100, blank=True, null=True)
    image = models.CharField(max_length=100, blank=True, null=True)
    status = models.PositiveSmallIntegerField()
    group = models.ForeignKey(AnimalGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'animal_type'


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class Comments(models.Model):
    animal_id = models.CharField(max_length=255)
    comment = models.CharField(max_length=255)
    name = models.CharField(max_length=255, blank=True, null=True)
    phone = models.CharField(max_length=255, blank=True, null=True)
    comment_status = models.CharField(max_length=255)
    time = models.DateTimeField()
    dlt_status = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'comments'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Pro(models.Model):
    user_contact = models.CharField(max_length=100)
    user_late = models.CharField(max_length=100)
    user_long = models.CharField(max_length=100)
    user_village = models.CharField(max_length=100)
    user_address = models.TextField()
    user_teh = models.CharField(max_length=100)
    user_dist = models.CharField(max_length=100)
    user_state = models.CharField(max_length=100)
    user_country = models.CharField(max_length=100)
    user_state_id = models.CharField(max_length=100)
    user_country_id = models.CharField(max_length=100)
    user_id = models.IntegerField(unique=True)

    class Meta:
        managed = False
        db_table = 'pro'


class UsersProfile(models.Model):
    user_contact = models.CharField(max_length=100)
    user_late = models.CharField(max_length=100)
    user_long = models.CharField(max_length=100)
    user_village = models.CharField(max_length=100)
    user_address = models.TextField()
    user_teh = models.CharField(max_length=100)
    user_dist = models.CharField(max_length=100)
    user_state = models.CharField(max_length=100)
    user_country = models.CharField(max_length=100)
    user_state_id = models.CharField(max_length=100)
    user_country_id = models.CharField(max_length=100)
    user = models.OneToOneField(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'users_profile'
