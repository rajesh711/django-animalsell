# Generated by Django 3.0.3 on 2020-03-02 09:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('animal', '0011_comments'),
    ]

    operations = [
        migrations.AddField(
            model_name='comments',
            name='user_contact',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
    ]
