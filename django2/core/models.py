from django.db import models
from stdimage.models import StdImageField
from django.utils import timezone

from django.utils.text import slugify
from django.contrib.auth.models import User

# signals
from django.db.models import signals
from django.template.defaultfilters import slugify


class Base(models.Model):
    criado = models.DateField('Data de Criação',auto_now_add=True)
    modificado = models.DateField('Data de Atualização',auto_now=True)
    ativo = models.BooleanField('Ativo?',default=True)

    class Meta:
        abstract = True

class Produto(models.Model):
    nome = models.CharField('Nome', max_length=100)
    preco = models.DecimalField('Preço', decimal_places=2, max_digits=8)
    estoque = models.IntegerField('Estoque')
    imagem = StdImageField('Imagem', upload_to='produtos', variations={'thumb': (124, 124)}, delete_orphans=True,  blank=True)
    slug = models.SlugField('Slug', max_length=100, blank=True, editable=False)
    descricao = models.TextField('Descrição', max_length=255, blank=True, null=True)
    criado = models.DateField('Criado', auto_now_add=True)
    modificado = models.DateField('Modificado', auto_now=True)
    ativo = models.BooleanField('Ativo', default=True)

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.nome)
        super(Produto, self).save(*args, **kwargs)

    def __str__(self):
        return self.nome

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.nome)
        super(Produto, self).save(*args, **kwargs)

class Servico(models.Model):
    nome = models.CharField('Nome', max_length=100)
    preco = models.DecimalField('Preço', decimal_places=2, max_digits=8)
    imagem = StdImageField('Imagem', upload_to='servicos', variations={'thumb': (124, 124)}, null=True, blank=True, delete_orphans=True)
    descricao = models.TextField('Descrição', max_length=255, blank=True, null=True)
    slug = models.SlugField('Slug', max_length=100, blank=True, editable=False)
    criado = models.DateField('Criado', auto_now_add=True)
    modificado = models.DateField('Modificado', auto_now=True)
    ativo = models.BooleanField('Ativo', default=True)

    class Meta:
        verbose_name = 'Serviço'
        verbose_name_plural = 'Serviços'
        ordering = ['nome']

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.nome)
        super(Servico, self).save(*args, **kwargs)

    def __str__(self):
        return self.nome
    
def produto_pre_save(signal, instance, sender, **kwargs):
        instance.slug = slugify(instance.nome)

signals.pre_save.connect(produto_pre_save, sender=Produto)


class Reserva(models.Model):
    STATUS_CHOICES = [
        ('Pendente', 'Pendente'),
        ('Confirmado', 'Confirmado'),
        ('Cancelado', 'Cancelado'),
    ]
    
    servico = models.ForeignKey(Servico, on_delete=models.PROTECT, related_name='reservas')
    usuario = models.ForeignKey(User, on_delete=models.PROTECT, related_name='reservas')
    data_reserva = models.DateField()
    hora_reserva = models.TimeField()
    observacoes = models.TextField(null=True, blank=True)
    status = models.CharField(max_length=50, choices=STATUS_CHOICES, default='Pendente')
    data_criacao = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Reserva de {self.usuario} para {self.servico} em {self.data_reserva} às {self.hora_reserva}"


