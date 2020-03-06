from django.urls import path
from . import views
from .views import PostListView, PostCreate, PostDetailView, PostDeleteView, PostUpdateView

urlpatterns = [
    path('', PostListView.as_view(), name='animal-list'),
    path('animals-details/<int:pk>/', views.adminPostDetailView, name='admin-posts-details'),
    path('animals-comments-approved/<int:pk>/', views.adminCommnetApproved, name='admin-comment-details'),
    path('animals-approved/<int:pk>/', views.adminPostAproved, name='posts-approved'),
    path('animals-delete/<int:pk>/', views.adminPostDelete, name='posts-delete'),
    path('post/<int:pk>/delete/', PostDeleteView.as_view(), name='user-post-delete'),
    # path('', views.home, name='animal-list'),
    path('my-animal/', views.UserPostListView, name='user-posts'),
    path('animal-register/', PostCreate.as_view(), name='sell-animal'),
    # path('animal/<int:pk>/', PostDetailView.as_view(), name='post-detail'),
    path('animal/<int:pk>/', views.PostDetailView, name='post-detail'),
    path('type-load', views.load_type, name='ajax_load_type'),
    path('like-unlike', views.like_unlike, name='ajax_like_unlike'),
    path('animal-comments', views.load_comments, name='ajax_comments'),
    path('animal-save-comment', views.save_comments, name='ajax_save_comment'),
    path('post/<int:pk>/update/', PostUpdateView.as_view(), name='post-update'),
]