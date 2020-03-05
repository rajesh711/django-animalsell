# Generated by Django 3.0.3 on 2020-02-29 10:06

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('animal', '0007_auto_20200228_0546'),
    ]

    operations = [
        migrations.CreateModel(
            name='LikeUnlike',
            fields=[
                ('id', models.AutoField(db_column='Id', primary_key=True, serialize=False)),
                ('like_unlike', models.PositiveSmallIntegerField(default='0')),
                ('time', models.DateTimeField()),
                ('animal_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='animal.Post')),
                ('author', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
