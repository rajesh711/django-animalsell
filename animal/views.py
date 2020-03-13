from abc import ABC

from django.contrib import messages
from django.contrib.auth.decorators import login_required, permission_required
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.core.paginator import Paginator
from django.db.models.aggregates import Count
from django.db.models.expressions import Subquery, OuterRef
from django.http.response import HttpResponse, JsonResponse, HttpResponseRedirect
from django.shortcuts import render, redirect

# Create your views here.
from django.urls.base import reverse_lazy, reverse
from django.utils import translation
from django.utils.datetime_safe import datetime
from django.views.generic.detail import DetailView
from django.views.generic.edit import CreateView, DeleteView, UpdateView
from django.views.generic.list import ListView

from animal.forms import PostCreateView, CommentCreateView
from animal.models import Type, Post, LikeUnlike, Comments
from django.utils.translation import gettext_lazy as _


def language(request):
    lang = request.POST.get('animal_language')
    translation.activate(lang)
    return redirect(request.META.get('HTTP_REFERER'))
    # return redirect('animal-list')


def home(request):
    animal_list = Post.objects.raw('''SELECT an_type.en_type ,an_type.in_type,an_post.*, (SELECT count(*) FROM 
        animalselling.animal_likeunlike WHERE animal_id = an_post.id AND `like_unlike`=0) as totallikes, 
        (SELECT count(*) FROM animalselling.animal_likeunlike WHERE animal_id = an_post.id AND `like_unlike`=1) as 
        totalunlikes , (SELECT count(*) FROM animalselling.animal_comments WHERE animal_id = an_post.id AND 
        `comment_status`=1 and dlt_status=0) as totalcomment FROM animalselling.animal_post as an_post join 
        animalselling.animal_type as an_type on an_post.animal_breed = an_type.id where an_post.approved_status=1 and 
        an_post.delete_status=0 order by add_time desc''')
    paginator = Paginator(animal_list, 12)  # Show 25 contacts per page.

    page_number = request.GET.get('page')
    animals = paginator.get_page(page_number)
    like_unlike = LikeUnlike.objects.all()

    return render(request, 'animal_tmp/home.html', {'page_obj': animals, 'like_unlike': like_unlike})


class PostListView(ListView):
    model = Post
    queryset = Post.objects.raw('''SELECT an_type.en_type ,an_type.in_type,an_post.*, (SELECT count(*) FROM 
        animal_likeunlike WHERE animal_id = an_post.id AND `like_unlike`=0) as totallikes, 
        (SELECT count(*) FROM animal_likeunlike WHERE animal_id = an_post.id AND `like_unlike`=1) as 
        totalunlikes , (SELECT count(*) FROM animal_comments WHERE animal_id = an_post.id AND 
        `comment_status`=1 and dlt_status=0) as totalcomment FROM animal_post as an_post join 
        animal_type as an_type on an_post.animal_breed = an_type.id where an_post.approved_status=1 and 
        an_post.delete_status=0 order by add_time desc''')
    template_name = 'animal_tmp/home.html'  # <app>/<model>_<viewtype>.html
    context_object_name = 'animals'
    paginate_by = 8


def load_type(request):
    group_id = request.POST.get('groupId')
    animal_type = Type.objects.filter(group_id=group_id)
    # print("group_id", group_id)
    # print('animal_type==', animal_type)
    result_set = []
    for type in animal_type:
        result_set.append({'id': type.id, 'en_type': type.en_type})
    response = {"success": True, "data": result_set}
    return JsonResponse(response)


def like_unlike(request):
    if request.method == 'POST':
        animalId = request.POST.get('animalId')
        like_data = request.POST.get('like_unlike')
        if request.user is not None and request.user.is_active:
            select_like = LikeUnlike.objects.filter(animal_id=animalId, author_id=request.user)
            if select_like:
                update_like = LikeUnlike.objects.filter(animal_id=animalId, author_id=request.user.id) \
                    .update(like_unlike=like_data)
                like_count = LikeUnlike.objects.filter(animal_id=animalId, like_unlike=0).count()
                unlike_count = LikeUnlike.objects.filter(animal_id=animalId, like_unlike=1).count()
                response = {"success": True, 'like_count': like_count, 'unlike_count': unlike_count,
                            'like_data': like_data}
                return JsonResponse(response)
            else:
                insert = LikeUnlike.objects.create(animal_id=animalId, like_unlike=like_data, author_id=request.user.id)
                insert.save()
                like_count = LikeUnlike.objects.filter(animal_id=animalId, like_unlike=0).count()
                unlike_count = LikeUnlike.objects.filter(animal_id=animalId, like_unlike=1).count()
                response = {"success": True, 'like_count': like_count, 'unlike_count': unlike_count,
                            'like_data': like_data}
                return JsonResponse(response)
        else:
            return HttpResponse('Please login')
    else:
        return redirect('animal-list')


# def animal_sell(request):
#     if request.method == 'POST':
#         form = PostCreateView(request.POST, request.FILES or None)
#         if form.is_valid():
#             # data = form.cleaned_data
#             # print('data ===', data)
#             article = form.save(commit=False)
#             article.author = request.user
#             article.save()
#             messages.success(request, f'Your animal description has been sent for admin approval')
#             return redirect('animal-list')
#     else:
#         form = PostCreateView()
#     return render(request, 'animal_tmp/animal_register.html', {'form': form})


class PostCreate(LoginRequiredMixin, CreateView):
    success_url = reverse_lazy('user-posts')
    form_class = PostCreateView
    success_message = _("f'Your animal description has been sent for admin approval")
    template_name = 'animal_tmp/animal_register.html'

    def form_valid(self, form):
        form.instance.author = self.request.user
        return super().form_valid(form)


# class PostDetailView(DetailView):
#     model = Post
#     template_name = 'animal_tmp/post_detail.html'

@login_required
def PostDetailView(request, pk=None):
    animalId = pk
    context = {
        'animals': Post.objects.raw('''SELECT an_type.en_type ,an_type.in_type,an_post.* FROM animalselling.animal_post as an_post join animalselling.animal_type 
            as an_type on an_post.animal_breed = an_type.id where an_post.id=%s''', [animalId])
    }
    return render(request, 'animal_tmp/post_detail.html', context)


@login_required
@permission_required('is_superuser')
def adminPostDetailView(request, pk=None):
    animalId = pk
    context = {
        'animals': Post.objects.raw('''SELECT an_type.en_type ,an_type.in_type,an_post.* FROM animalselling.animal_post as an_post join animalselling.animal_type 
            as an_type on an_post.animal_breed = an_type.id where an_post.id=%s''', [animalId])
    }
    return render(request, 'animal_tmp/admin_animal_details.html', context)


@login_required
@permission_required('is_superuser')
def adminCommnetApproved(request, pk=None):
    commentId = pk
    comments = Comments.objects.values_list('comment_status', flat=True).filter(pk=commentId)
    status = 0
    msg = ''
    for comment in comments:
        if comment == 0:
            status = 1
            msg = _(f'Comment has been approval successful')
        else:
            status = 0
            msg = _(f'Comment has been disapproval successful')

    approved_post = Comments.objects.filter(id=commentId).update(comment_status=status)
    messages.success(request, msg)
    return redirect('/admin/animal/comments/')


@login_required
@permission_required('is_superuser')
def adminPostAproved(request, pk=None):
    animalId = pk
    animals = Post.objects.values_list('approved_status', flat=True).filter(pk=animalId)
    status = 0
    for animal in animals:
        if animal == 0:
            status = 1
            msg = _(f'Animal has been approval successful')
        else:
            status = 0
            msg = _(f'Animal has been disapproval successful')

    approved_post = Post.objects.filter(id=animalId).update(approved_status=status)
    messages.success(request, msg)
    return HttpResponseRedirect(reverse('admin-posts-details', kwargs={"pk": pk}))


@login_required
@permission_required('is_superuser')
def adminPostDelete(request, pk=None):
    animalId = pk
    animals = Post.objects.values_list('delete_status', flat=True).filter(pk=animalId)
    print(animals)
    status = 0
    for animal in animals:
        if animal == 0:
            status = 1
            msg = _(f'Animal has been delete successful')
        else:
            status = 0
            msg = _(f'Animal has been Active successful')

    approved_post = Post.objects.filter(id=animalId).update(delete_status=status)
    messages.success(request, msg)
    return HttpResponseRedirect(reverse('admin-posts-details', kwargs={"pk": pk}))


class PostDeleteView(LoginRequiredMixin, UserPassesTestMixin, DeleteView):
    model = Post
    template_name = 'animal_tmp/post_confirm_delete.html'
    success_url = reverse_lazy('user-posts')

    def test_func(self):
        post = self.get_object()
        if self.request.user == post.author:
            return True
        return False


def load_comments(request):
    animalId = request.POST.get('animalId')
    comment = Comments.objects.filter(animal_id=animalId, comment_status=1, dlt_status=0)
    form = CommentCreateView()
    return render(request, 'animal_tmp/comments.html', {'animalId': animalId, 'comments': comment, 'form': form})


def save_comments(request):
    if request.user is not None and request.user.is_active:
        animalId = request.POST.get('animalId')
        comment = request.POST.get('comment')
        name = request.POST.get('name')
        phone = request.POST.get('user_contact')
        comment = Comments.objects.create(name=name, animal_id=animalId, comment=comment,
                                          user_contact=phone, author_id=request.user.id)
        comment.save()
        return HttpResponse(_('Success: Your comment has been sent for approval'))
    else:
        return HttpResponse(_('Please Login'))


@login_required
def UserPostListView(request):
    context = {
        'animals': Post.objects.raw('''SELECT an_type.en_type ,an_type.in_type,an_post.*, (SELECT count(*) FROM 
        animalselling.animal_likeunlike WHERE animal_id = an_post.id AND `like_unlike`=0) as totallikes, 
        (SELECT count(*) FROM animalselling.animal_likeunlike WHERE animal_id = an_post.id AND `like_unlike`=1) as 
        totalunlikes , (SELECT count(*) FROM animalselling.animal_comments WHERE animal_id = an_post.id AND 
        `comment_status`=0) as totalcomment FROM animalselling.animal_post as an_post join animalselling.animal_type 
        as an_type on an_post.animal_breed = an_type.id where an_post.delete_status=0 and an_post.author_id= %s''',
                                    [request.user.id])
    }

    return render(request, 'animal_tmp/user_posts.html', context)


class PostUpdateView(LoginRequiredMixin, UserPassesTestMixin, UpdateView, ABC):
    model = Post
    form_class = PostCreateView
    success_url = reverse_lazy('user-posts')
    template_name = 'animal_tmp/animal_register.html'

    def form_valid(self, form):
        form.instance.author = self.request.user
        return super().form_valid(form)

    def test_func(self):
        post = self.get_object()
        if self.request.user == post.author:
            return True
        return False
