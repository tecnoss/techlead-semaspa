import 'package:semasma/screens/denuncia_ouvidoria/models/municipio_model.dart';

class MunicipioRepository {
  List munJson = [
    {
      "name": "Abaetetuba",
      "endereco": "Rua Manoel de Abreu",
      "telefones": "(91)99380-3316",
      "emails": "semeia@abaetetuba.pa.gov.br",
      "site": "https://www.abaetetuba.pa.gov.br/secretaria.php?sec=7"
    },
    {
      "name": "Abel Figueiredo",
      "endereco": "Rua Presidente Gaisel",
      "telefones": "(94)99298-4608",
      "emails": "gabinete@abelfigueredo.com.br",
      "site":
          "https://abelfigueiredo.pa.gov.br/portal-da-transparencia/estrutura-organizacional/secretaria-municipal-de-meio-ambiente/"
    },
    {
      "name": "Acará",
      "endereco": "Avenida Fernando Guilhon",
      "telefones": "(91)8816-4486",
      "emails": "soniaelidia.sematur@gmail.com",
      "site":
          "https://acara.pa.gov.br/portal-da-transparencia/estrutura-organizacional/secretaria-de-meio-ambiente-e-turismo/"
    },
    {
      "name": "Afuá",
      "endereco": "Rua João Paulo II",
      "telefones": "(91)99395-7163",
      "emails": "semamb.afua@afua.pa.gov.br",
      "site":
          "https://afua.pa.gov.br/portal-da-transparencia/estrutura-organizacional/secretaria-municipal-de-meio-ambiente-semamb/"
    },
    {
      "name": "Água Azul do Norte",
      "endereco": "Avenida Lago Azul",
      "telefones": "(94)99173-9768",
      "emails": "semmaaguazul@hotmail.com",
      "site": "https://aguaazuldonorte.pa.gov.br/secretarias/meio-ambiente/"
    },
    {
      "name": "Alenquer",
      "endereco": "Eloy Simões",
      "telefones": "(93)99241-1596",
      "emails": "ouvidoria@alenquer.pa.gov.br",
      "site": "https://alenquer.pa.gov.br/sema/"
    },
    {
      "name": "Almeirim",
      "endereco": "Rodovia Almeirim Panaicá",
      "telefones": "(93)98114-8314",
      "emails": "semaalmerim2017@gmail.com",
      "site":
          "https://almeirim.pa.gov.br/portal-da-transparencia/estrutura-organizacional/secretaria-executiva-de-meio-ambiente-sema/"
    },
    {
      "name": "Altamira",
      "endereco": "Rua Abel Figueiredo",
      "telefones": "(93)99155-9804",
      "emails": "semat@altamira.pa.gov.br",
      "site":
          "https://altamira.pa.gov.br/portal-da-transparencia/estrutura-organizacional/secretaria-municipal-de-meio-ambiente-e-turismo-semat/"
    },
    {
      "name": "Anajás",
      "endereco": "Travessa Francisco JR Filho",
      "telefones": "(91)98170-4339",
      "emails": "semmaanajas21@gmail.com",
      "site":
          "https://anajas.pa.gov.br/portal-da-transparencia/estrutura-organizacional/secretaria-de-meio-ambiente/"
    },
    {
      "name": "Ananindeua",
      "endereco": "Avenida Cláudio Saunders",
      "telefones": "(91)3073-2500",
      "emails": "sema@ananindeua.pa.gov.br",
      "site": "https://www.ananindeua.pa.gov.br/sema"
    },
    {
      "name": "Anapú",
      "endereco": "Rua Santo Agostinho",
      "telefones": "(93)99150-7556",
      "emails": "semat.anapu@hotmail.com",
      "site":
          "https://anapu.pa.gov.br/portal-da-transparencia/estrutura-organizacional/secretaria-municipal-de-meio-ambiente-e-turismo/ "
    },
    {
      "name": "Augusto Corrêa",
      "endereco": "Avenida Magalhães Barata",
      "telefones": "(91)98523-6472",
      "emails": "semmaaugustocorrea@gmail.com",
      "site":
          "https://augustocorrea.pa.gov.br/portal-da-transparencia/estrutura-organizacional/secretaria-municipal-de-meio-ambiente/"
    },
    {
      "name": "Aurora do pará",
      "endereco": "Rua Raimunda Mendes Queiroz",
      "telefones": "(91)9933-1749",
      "emails": "semaaurora6@gmail.com",
      "site":
          "https://auroradopara.pa.gov.br/o-governo/estrutura-organizacional/secretaria-municipal-de-meio-ambiente/"
    },
    {
      "name": "Aveiro",
      "endereco": "Avenida Maria Pititinga de Santana",
      "telefones": "(93)98129-0744",
      "emails": "demetriosantosjunior@hotmail.com",
      "site":
          "https://aveiro.pa.gov.br/portal-da-transparencia/estrutura-organizacional/secretaria-municipal-de-mineracao-e-meio-ambiente/"
    },
    {
      "name": "Bagre",
      "endereco": "Avenida Barão do Rio Branco",
      "telefones": "(91)99155-5100",
      "emails": "popo@hotmail.com",
      "site":
          "https://bagre.pa.gov.br/portal-da-transparencia/estrutura-organizacional/secretaria-de-meio-ambiente/"
    },
    {
      "name": "Baião",
      "endereco": "Avenida Santos Dumont",
      "telefones": "(91)98513-8023",
      "emails": "semabaiao@gmail.com",
      "site":
          "https://baiao.pa.gov.br/portal-da-transparencia/estrutura-organizacional/secretaria-executiva-de-meio-ambiente/"
    },
    {
      "name": "Bannach",
      "endereco": "Avenida Paraná",
      "telefones": "(94)99287-5369",
      "emails": "sec.meioambiente@bannach.pa.gov.br",
      "site": "https://bannach.pa.gov.br/secretarias/meio-ambiente/"
    },
    {
      "name": "Barcarena",
      "endereco": "Rodivia PA 481",
      "telefones": "(91)99259-2007",
      "emails": "semade@barcarena.pa.gov.br",
      "site":
          "https://barcarena.pa.gov.br/o-governo/estrutura-organizacional/secretaria-municipal-de-meio-ambiente-e-desenvolvimento-economico/"
    },
    {
      "name": "Belém",
      "endereco": "Travessa Quintino Bocaiúva",
      "telefones": "(91)3039-8106",
      "emails": "denunciameioambiente@semma.pmb.pa.gov.br",
      "site": "https://semma.belem.pa.gov.br/"
    },
    {
      "name": "Belterra",
      "endereco": "Vila Americana",
      "telefones": "(93)99148-6863",
      "emails": "semat@belterra.pa.gov.br",
      "site": "https://www.belterra.pa.gov.br/mostrarNoticia.php?id_=62"
    },
    {
      "name": "Benevides",
      "endereco": "Rua Paul Begot",
      "telefones": "(91)98903-2512",
      "emails": "gabineteprefeitura@benevides.pa.gov.br",
      "site": ""
    },
    {
      "name": "Bom Jesus do Tocantins",
      "endereco": "Avenida Jarbas Passarinho. Bairro Centro",
      "telefones": "(94)3341-1125",
      "emails": "meioambiente@bomjesusdotocantins.pa.gov.br",
      "site":
          "https://bomjesusdotocantins.pa.gov.br/o-governo/estrutura-organizacional/secretaria-municipal-de-meio-ambiente/"
    },
    {
      "name": "Bonito",
      "endereco": "Avenida Ruth Passarinho. Bairro Centro",
      "telefones": "(91)98542-9004",
      "emails": "zaqueu_monteiro@hotmail.com",
      "site":
          "https://bonito.pa.gov.br/portal-da-transparencia/estrutura-organizacional/secretaria-municipal-de-meio-ambiente-sema/"
    },
    {
      "name": "Bragança",
      "endereco": "Passagem Nossa Sra. da Glória",
      "telefones": "(91)99902-1233",
      "emails": "semma@braganca.pa.gov.br",
      "site":
          "https://braganca.pa.gov.br/secretaria-municipal-de-meio-ambiente/"
    },
    {
      "name": "Brasil Novo",
      "endereco": "Travessa Maranhão",
      "telefones": "(93)99128-4582",
      "emails": "Email: rocca66@gmail.com",
      "site":
          "https://brasilnovo.pa.gov.br/portal-da-transparencia/estrutura-organizacional/%E2%80%8Bsecretaria-municipal-de-meio-ambiente-semma/"
    },
    {
      "name": "Breu Branco",
      "endereco": "Rua Argentina",
      "telefones": "(94)9913-49512 ",
      "emails": "meioambiente@breubranco.pa.gov.br",
      "site": ""
    },
    {
      "name": "Breves",
      "endereco": "Avenida Gurupá",
      "telefones": "(91)3783-2885",
      "emails": "semmabreves@hotmail.com",
      "site": "https://breves.pa.gov.br/secretaria-municipal-de-meio-ambiente/"
    },
    {
      "name": "Bujarú",
      "endereco": "Avenida Antônio Rocha",
      "telefones": "(91)99923-6203",
      "emails": "Email: diogoalmeida.ep@gmail.com",
      "site":
          "https://bujaru.pa.gov.br/portal-da-transparencia/estrutura-organizacional/secretaria-municipal-de-meio-ambiente/"
    },
    {
      "name": "Cachoeira do Ararí",
      "endereco": "Avenida Deputado José Rodrigues Viana",
      "telefones": "(91)984174463",
      "emails": "julietemiranda2517@gmail.com",
      "site":
          "https://cachoeiradoarari.pa.gov.br/portal-da-transparencia/estrutura-organizacional/secretaria-municipal-de-meio-ambiente/"
    },
    {
      "name": "Cametá",
      "endereco": "Travessa São Benedito",
      "telefones": "(91)98429-7668",
      "emails": "cametasemma@gmail.com",
      "site":
          "https://prefeituradecameta.pa.gov.br/portal-da-transparencia/estrutura-organizacional/secretaria-de-meio-ambiente/"
    },
    {
      "name": "Canaã dos Carajás",
      "endereco": "Rua Cumarú",
      "telefones": "(94)99231-7117",
      "emails": "sematcanaa@gmail.com",
      "site": "https://www.canaadoscarajas.pa.gov.br/novo/meio-ambiente/"
    },
    {
      "name": "Capanema",
      "endereco": "Avenida Barão de Capanema",
      "telefones": "(91)3462-1648",
      "emails": "semmacapanema@gmail.com",
      "site": "https://www.capanema.pa.gov.br/secretaria.php?sec=9"
    },
    {
      "name": "Capitão Poço",
      "endereco": "Travessa Tatajuba",
      "telefones": "(91)3468-1390",
      "emails": "meioambiente@capitaopoco.pa.gov.br ",
      "site": ""
    },
    {
      "name": "Castanhal",
      "endereco": "Rua Major Wilson",
      "telefones": "(91)3711-5959",
      "emails": "semma@castanhal.pa.gov.br",
      "site": "http://www2.castanhal.pa.gov.br/secretaria_meio_ambiente"
    },
    {
      "name": "Chaves",
      "endereco": "Avenida Beira Mar",
      "telefones": "(91)98033-6869",
      "emails": "semmachaves@gmail.com",
      "site":
          "https://chaves.pa.gov.br/portal-da-transparencia/estrutura-organizacional/secretaria-municipal-de-meio-ambiente-semma/"
    },
    {
      "name": "Conceição do Araguaia",
      "endereco": "Avenida J.K.",
      "telefones": "(94)99247-4547",
      "emails": "semarh@conceicaodoaraguaia.pa.gov.br",
      "site":
          "https://conceicaodoaraguaia.pa.gov.br/portal-da-transparencia/estrutura-organizacional/secretaria-municipal-de-meio-ambiente-e-recursos-hidricos-semarh/"
    },
    {
      "name": "Concórdia",
      "endereco": "Rua João Paulo II",
      "telefones": "(91)3728-1373",
      "emails": "semmacon@yahoo.com.br",
      "site":
          "https://concordiadopara.pa.gov.br/portal-da-transparencia/estrutura-organizacional/secretaria-municipal-de-meio-ambiente/"
    },
    {
      "name": "Cumaru do Norte",
      "endereco": "Avenida das Nações",
      "telefones": "(94)99156-7378",
      "emails": "ewertonkalu@hotmail.com",
      "site":
          "https://pmcn.pa.gov.br/portal-da-transparencia/estrutura-organizacional/secretaria-municipal-de-meio-ambiente-e-turismo/"
    },
    {
      "name": "Curionópolis",
      "endereco": "Avenida Minas Gerais",
      "telefones": "(94)98430-9898",
      "emails": "semma.pmc@curionopolis.pa.gov.br",
      "site":
          "https://curionopolis.pa.gov.br/secretaria-municipal-de-meio-ambiente/"
    },
    {
      "name": "Curralinho",
      "endereco": "Avenida Jarbas Passarinho",
      "telefones": "(91)99268-9570",
      "emails": "",
      "site":
          "https://pmcurralinho.pa.gov.br/portal-da-transparencia/estrutura-organizacional/secretaria-municipal-de-meio-ambiente/"
    },
    {
      "name": "Curuça",
      "endereco": "Praça Coronel Horácio",
      "telefones": "(91)3722-1169",
      "emails": "prefeituradecuruca@curuca.pa.gov.br",
      "site":
          "https://www.curuca.pa.gov.br/secretaria-de-meio-ambiente-e-sustentabilidade/"
    },
    {
      "name": "Dom Eliseu",
      "endereco": "Rua Ceará",
      "telefones": "(94)3335-2901",
      "emails": "meioambiente@domeliseu.gov.com.br",
      "site":
          "https://domeliseu.pa.gov.br/portal-da-transparencia/estrutura-organizacional/secretaria-municipal-de-meio-ambiente/"
    },
    {
      "name": "Faro",
      "endereco": "Rua Duque de Caxias",
      "telefones": "(92)99536-4391",
      "emails": "meioambiente.faro@gmail.com",
      "site": ""
    },
    {
      "name": "Floresta do Araguaia",
      "endereco": "Avenida Pres. Juscelino Kubitscheck",
      "telefones": "(94)98405-3797",
      "emails": "alexparazinho.79@gmail.com",
      "site": ""
    },
    {
      "name": "Garrafão do Norte",
      "endereco":
          "Rua Luiz Eduardo Magalhães. Bairro Pedrinhas. CEP 68.665-000",
      "telefones": "(91)3434-4254",
      "emails": "semmagn17@gmail.com",
      "site": ""
    },
    {
      "name": "Goianésia do Pará",
      "endereco": "Avenida Tancredo Neves S/N. Bairro Centro. CEP 68.639-000",
      "telefones": "(94)3779-1488",
      "emails": "goianesiadopara@semas.pa.gov.br",
      "site": ""
    },
    {
      "name": "Gurupá",
      "endereco": "Travessa Abílio Gama",
      "telefones": "(91)98903-0747",
      "emails": "",
      "site": ""
    },
    {
      "name": "Igarapé-Açu",
      "endereco": "Travessa 7 de Setembro",
      "telefones": "(91)98038-1044",
      "emails": "",
      "site": ""
    },
    {
      "name": "Igarapé-Miri",
      "endereco": "Palacete Senador Garcia",
      "telefones": "(91)98531-8239",
      "emails": "meio.ambiente@igarapemiri.pa.gov.br",
      "site": ""
    },
    {
      "name": "Inhangapi",
      "endereco": "Travessa Antônio Marçal",
      "telefones": "(91)99207-5246",
      "emails": "inhangapi.pa.semma@hotmail.com",
      "site": ""
    },
    {
      "name": "Ipixuna do Pará",
      "endereco": "Rua Luíz Batista Nonato",
      "telefones": "(91)98267-4869 ",
      "emails": "meioambiente@ipixunadopara.pa.gov.br",
      "site": ""
    },
    {
      "name": "Itaituba",
      "endereco": "Avenida Belém",
      "telefones": "(93)9921-92603",
      "emails": "semma.itb@gmail.com",
      "site": ""
    },
    {
      "name": "Itupiranga",
      "endereco": "Avenida 14 de Julho",
      "telefones": "(94)9144-1301",
      "emails": "agenorpelaes@hotmail.com",
      "site": ""
    },
    {
      "name": "Jacareacanga",
      "endereco": "Avenida Brg. Haroldo Coimbra Veloso",
      "telefones": "(93)98413-2697",
      "emails": "semat.jacareacanga@outlook.com",
      "site": ""
    },
    {
      "name": "Jacundá",
      "endereco": "Rodovia PA 150 km. CEP 68590-000 ",
      "telefones": "(94)3345-1312",
      "emails": "sematur@jacunda.pa.gov.br",
      "site": ""
    },
    {
      "name": "Juruti",
      "endereco": "Avenida Turíbio Vieira",
      "telefones": "(93)99128-9717",
      "emails": "meioambiente@juruti.pa.gov.br",
      "site": ""
    },
    {
      "name": "Limoeiro do Ajurú",
      "endereco": "R. Marechal Rondon",
      "telefones": "(91)99236-6056",
      "emails": "",
      "site": ""
    },
    {
      "name": "Mãe do Rio",
      "endereco": "Rodovia PA 252",
      "telefones": "(91)9207-2061",
      "emails": "secmeioambienteurbanismo@gmail.com",
      "site": ""
    },
    {
      "name": "Magalhães Barata",
      "endereco": "Rua Verissimo Pinto",
      "telefones": "(91)3812-3173",
      "emails": "secretariambmeioambiente@gmail.com",
      "site": ""
    },
    {
      "name": "Marabá",
      "endereco": "Avenida Amazônia",
      "telefones": "(94)3323-0571",
      "emails": "semma@maraba.pa.gov.br",
      "site": ""
    },
    {
      "name": "Maracanã",
      "endereco": "Rodovia PA-127",
      "telefones": "(91)98477-7899",
      "emails": "meioambiente@maracana.pa.gov.br ",
      "site": ""
    },
    {
      "name": "Marapanim",
      "endereco": "Avenida Fernando Magalhães",
      "telefones": "(91)98561-9227",
      "emails": "semad.pmm@gmail.com",
      "site": ""
    },
    {
      "name": "Marituba",
      "endereco": "Rua Antônio Bezerra Falcão. CEP 67.200-000",
      "telefones": "(91)98235-5931",
      "emails": "semma.marituba.pa@gmail.com",
      "site": ""
    },
    {
      "name": "Medicilândia",
      "endereco": "Rua Jacobsen",
      "telefones": "(93)99134-4452",
      "emails": "semmamed@gmail.com",
      "site": ""
    },
    {
      "name": "Melgaço",
      "endereco": "Avenida Senador Lemos. Bairro Centro Guarycurú",
      "telefones": "(91)99245-3108",
      "emails": "",
      "site": ""
    },
    {
      "name": "Mocajuba",
      "endereco": "Rua Deodete de Oliveira",
      "telefones": "(91)98244-6109",
      "emails": "semad.mocajuba@gmail.com",
      "site": ""
    },
    {
      "name": "Moju",
      "endereco": "Rua Padre João",
      "telefones": "(91)9943-9397",
      "emails": "sectema@moju.pa.gov.br",
      "site": ""
    },
    {
      "name": "Mojuí dos Campos",
      "endereco": "Rua Aroldo Veloso",
      "telefones": "(93)9242-9227",
      "emails": "semma@mojuidoscampos.pa.gov.br ",
      "site": "www.mojuidoscampos.pa.gov.br"
    },
    {
      "name": "Monte Alegre",
      "endereco": "Praça Tiradentes",
      "telefones": "(93)3533-1010",
      "emails": "prefeitura@montealegre.pa.gov.br",
      "site": "https://www.montealegre.pa.gov.br/category/semmag/"
    },
    {
      "name": "Muaná",
      "endereco": "Rua Manoel Izidro da Silva",
      "telefones": "(91)99139-7909",
      "emails": "luiz_tavares11@hotmail.com",
      "site":
          "https://muana.pa.gov.br/portal-da-transparencia/estrutura-organizacional/secretaria-de-meio-ambiente/"
    },
    {
      "name": "Nova Esperança do Piriá",
      "endereco": "Avenida São Pedro",
      "telefones": "(91)98411-1972",
      "emails": "gabinetepmnep@gmail.com",
      "site":
          "https://novaesperancadopiria.pa.gov.br/portal-da-transparencia/estrutura-organizacional/secretaria-municipal-de-meio-ambiente-e-habitacao/"
    },
    {
      "name": "Nova Ipixuna",
      "endereco": "Rua Antonio Marrocos",
      "telefones": "(94)99220-6884",
      "emails": "prefeitura@novaipixuna.pa.gov.br ",
      "site":
          "https://novaesperancadopiria.pa.gov.br/portal-da-transparencia/estrutura-organizacional/secretaria-municipal-de-meio-ambiente-e-habitacao/"
    },
    {
      "name": "Nova Timboteua",
      "endereco": "Avenida Barão do Rio Branco",
      "telefones": "(91)3469-1189",
      "emails": "smadmpmnt@hotmail.com ",
      "site": "https://novatimboteua.pa.gov.br/"
    },
    {
      "name": "Novo Progresso",
      "endereco": "Travessa Belém",
      "telefones": "(93)98116-4967",
      "emails": "municnovoprogresso.pmv@gmail.com ",
      "site":
          "https://novoprogresso.pa.gov.br/portal-da-transparencia/estrutura-organizacional/secretaria-municipal-de-meio-ambiente/"
    },
    {
      "name": "Novo Repartimento",
      "endereco": "Rua Muiracatiara",
      "telefones": "(94)99217-6830",
      "emails": "ouvidoria@novorepartimento.pa.gov.br",
      "site":
          "https://novorepartimento.pa.gov.br/web/pag.php?pg=ouvidoria/ouvidoria"
    },
    {
      "name": "Óbidos",
      "endereco": "Rua Dom Floriano",
      "telefones": "(93)99115-8259",
      "emails": "pmosema@obidos.pa.gov.br ",
      "site":
          "https://obidos.pa.gov.br/portal-da-transparencia/estrutura-organizacional/secretaria-interino-municipal-de-meio-ambiente-sema/"
    },
    {
      "name": "Oeiras do Pará",
      "endereco": "Artêmio Araújo",
      "telefones": "(91)99396-0188",
      "emails": "ouvidoria@oeirasdopara.pa.gov.br ",
      "site": "https://oeirasdopara.pa.gov.br/ouvidoria/ "
    },
    {
      "name": "Oriximiná",
      "endereco": "Avenida Quinze de Novembro",
      "telefones": "(93)3554-3837",
      "emails": "ouvidoria@oriximina.pa.gov.br ",
      "site": "https://www.oriximina.pa.gov.br/"
    },
    {
      "name": "Ourém",
      "endereco": "Travessa Dr. Lauro Sodré",
      "telefones": "(91)8405-1561",
      "emails": "semmaourempa@gmail.com ",
      "site": "https://www.ourem.pa.gov.br/secretaria.php?sec=2"
    },
    {
      "name": "Ourilândia do Norte",
      "endereco": "Rua 17",
      "telefones": "(94)98436-7933",
      "emails": "meioambiente@ourilandia.pa.gov.br ",
      "site":
          "https://ourilandia.pa.gov.br/portal-da-transparencia/estrutura-organizacional/secretaria-de-meio-ambiente/"
    },
    {
      "name": "Pacajá",
      "endereco": "Avenida Transamazônica",
      "telefones": "(91)99264-2461",
      "emails": "semmapmp@gmail.com ",
      "site":
          "https://pacaja.pa.gov.br/portal-da-transparencia/estrutura-organizacional/secretaria-municipal-de-meio-ambiente/"
    },
    {
      "name": "Palestina do Pará",
      "endereco": "Rua Magalhães Barata",
      "telefones": "(94)99180-4131",
      "emails": "semmaspalestina@gmail.com ",
      "site":
          "https://palestinadopara.pa.gov.br/portal-da-transparencia/estrutura-organizacional/secretaria-de-meio-ambiente/"
    },
    {
      "name": "Paragominas",
      "endereco": "Rodovia Clodomiro Bicalho",
      "telefones": "(91)99116-8524",
      "emails": "semma@paragominas.pa.gov.br",
      "site":
          "https://paragominas.pa.gov.br/portal-da-transparencia/estrutura-organizacional/secretaria-municipal-do-verde-e-meio-ambiente-semma/"
    },
    {
      "name": "Parauapebas",
      "endereco": "Rua Juruna",
      "telefones": "",
      "emails": "semma@parauapebas.pa.gov.br",
      "site": "https://parauapebas.pa.gov.br/meio-ambiente/"
    },
    {
      "name": "Pau D'arco",
      "endereco": "Avenida Maria de Sá",
      "telefones": "(94)3356-8105",
      "emails": "semmapaudarco@hotmail.com ",
      "site":
          "https://paudarco.pa.gov.br/portal-da-transparencia/estrutura-organizacional/secretaria-municipal-de-meio-ambiente/"
    },
    {
      "name": "Peixe Boi",
      "endereco": "Avenida João Gomes Pedrosa",
      "telefones": "(91)3821-1281",
      "emails": "peixeboi@semas.pa.gov.br ",
      "site":
          "https://prefeituradepeixeboi.pa.gov.br/portal-da-transparencia/estrutura-organizacional/secretaria-de-meio-ambiente/"
    },
    {
      "name": "Piçarra",
      "endereco": "Rua Tancredo Neves",
      "telefones": "(94)99292-3010",
      "emails": "semmatur.picarra@gmail.com ",
      "site":
          "http://picarra.pa.gov.br/portal/secretarios-municipais/#1632831422617-b9a7274c-ad25"
    },
    {
      "name": "Placas",
      "endereco": "Rua Olavo Bilac",
      "telefones": "(93)99138-5258",
      "emails": "semmaplacas21@yahoo.com.br ",
      "site":
          "https://placas.pa.gov.br/portal-da-transparencia/estrutura-organizacional/secretaria-municipal-de-meio-ambiente/"
    },
    {
      "name": "Ponta de Pedras",
      "endereco": "Praça Antônio Malato",
      "telefones": "(91)98464-5315",
      "emails": "meioambiente@pontadepedras.pa.gov.br ",
      "site": "https://www.pontadepedras.pa.gov.br/secretaria.php?sec=34"
    },
    {
      "name": "Portel",
      "endereco": "Avenida Mal. Floriano Peixoto",
      "telefones": "(91)99245-6210",
      "emails": "sema@portel.pa.gov.br ",
      "site":
          "https://portel.pa.gov.br/portal-da-transparencia/estrutura-organizacional/secretaria-municipal-de-meio-ambiente-sema/"
    },
    {
      "name": "Porto de Moz",
      "endereco": "Rua Raimundo de Jesus da Jesus",
      "telefones": "(93)98406-2623",
      "emails": "semma_pmz@hotmail.com ",
      "site":
          "https://portodemoz.pa.gov.br/portal-da-transparencia/estrutura-organizacional/secretaria-de-pesca-e-agricultura/"
    },
    {
      "name": "Prainha",
      "endereco": "Rodovia PA 419",
      "telefones": "(93)98413-3123",
      "emails": "ebsonmendescrf@gmail.com ",
      "site":
          "https://prainha.pa.gov.br/portal-da-transparencia/estrutura-organizacional/secretaria-de-meio-ambiente/"
    },
    {
      "name": "Primavera",
      "endereco": "Rua Cesar Pinheiro. Bairro Centro ",
      "telefones": "(91)3481-1228",
      "emails": "prefeituradeprimaverapa@gmail.com",
      "site":
          "https://www.governotransparente.com.br/acessoinfo/4522488/estruturaorganizacional"
    },
    {
      "name": "Quatipuru",
      "endereco": "Rua Cônego Siqueira Mendes",
      "telefones": "(91)98316-9852",
      "emails": "pmq.gabinete@gmail.com ",
      "site":
          "https://quatipuru.pa.gov.br/wp-content/uploads/2021/03/CONTRATO-N-20210918.pdf"
    },
    {
      "name": "Rendenção",
      "endereco": "Rua Walterloo Prudente",
      "telefones": "(94)99120-3840",
      "emails": "meioambiente@redencao.pa.gov.br ",
      "site":
          "https://www.redencao.pa.gov.br/secretaria/9/Secretaria-Municipal-de-Meio-Ambiente-e-Desenvolvimento-Sustentavel"
    },
    {
      "name": "Rio Maria",
      "endereco": "Avenida Rio Maria",
      "telefones": "(94)99117-8715",
      "emails": "maraica-13@hotmail.com ",
      "site": "https://siteantigo.riomaria.pa.gov.br/secretarias/meio-ambiente/"
    },
    {
      "name": "Rondon do Pará",
      "endereco": "Rua Gonçalves Dias",
      "telefones": "(94)99158-3513",
      "emails": "weliton.porto@globo.com",
      "site":
          "https://rondondopara.pa.gov.br/portal-da-transparencia/estrutura-organizacional/secretaria-municipal-de-ciencia-tecnologia-e-meio-ambiente/"
    },
    {
      "name": "Rurópolis",
      "endereco": "Rua José Rodrigues da Costa",
      "telefones": "(93)99134-0709",
      "emails": "semmaruropolis.pa@hotmail.com ",
      "site":
          "https://ruropolis.pa.gov.br/o-governo/estrutura-organizacional/secretaria-municipal-de-meio-ambiente-e-turismo/"
    },
    {
      "name": "Salinópolis",
      "endereco": "Avenida Dr. Miguel de Santa Brígida",
      "telefones": "(91)99201-1913",
      "emails": "",
      "site":
          "http://www.salinopolis.pa.gov.br/index.php/component/contact/contact/18-secretarias/22-secretaria-municipal-de-meio-ambiente"
    },
    {
      "name": "Salvaterra",
      "endereco": "Rua Frei Romão (5ª Rua)",
      "telefones": "(91)98175-2683",
      "emails": "semmasalvaterra@gmail.com",
      "site":
          "https://prefeituradesalvaterra.pa.gov.br/portal-da-transparencia/estrutura-organizacional/secretaria-municipal-de-meio-ambiente/"
    },
    {
      "name": "Santa Bárbara do Pará",
      "endereco": "Rua Raimundo Rocha",
      "telefones": "(91)3776-1152",
      "emails": "",
      "site":
          "https://santabarbara.pa.gov.br/portal-da-transparencia/estrutura-organizacional/secretaria-municipal-de-meio-ambiente/"
    },
    {
      "name": "Santa Izabel do Pará",
      "endereco": "Rua Francisco Amâncio",
      "telefones": "(91)8112-3750",
      "emails": "semmasip@gmail.com",
      "site":
          "https://santaizabel.pa.gov.br/portal-da-transparencia/estrutura-organizacional/secretaria-municipal-de-meio-ambiente-semma/"
    },
    {
      "name": "Santa Luzia do Pará",
      "endereco": "Rua MARECHAL RONDON",
      "telefones": "(91)99245-1016",
      "emails": "sema@santaluziadopara.pa.gov.br ",
      "site": ""
    },
    {
      "name": "Santa Maria das Barreiras",
      "endereco": "Centro Administrativo. Distrito de Casa de Tábua ",
      "telefones": "(94)3319-1166",
      "emails": "semmasantamaria@hotmail.com ",
      "site": ""
    },
    {
      "name": "Santa Maria do Pará",
      "endereco": "Praça da Matriz",
      "telefones": "(91)98443-9745",
      "emails": "sec.meioambiente@santamaria.pa.gov.br",
      "site": ""
    },
    {
      "name": "Santana do Araguaia",
      "endereco": "Avenida Zeca Abreu",
      "telefones": "(94)99156-5116",
      "emails": "semmasantana@gmail.com",
      "site": ""
    },
    {
      "name": "Santarém",
      "endereco": "Avenida Dr. Anysio Chaves",
      "telefones": "(93)99141-7058",
      "emails": "ouvidoria@santarem.pa.gov.br ",
      "site": ""
    },
    {
      "name": "Santo Antônio do Tauá",
      "endereco": "Altos do Terminal Rodoviário. Bairro Centro",
      "telefones": "(91)99233-3915",
      "emails": "semmataua17@gmail.com",
      "site": ""
    },
    {
      "name": "São Caetano de Odivelas",
      "endereco": "Avenida Floriano Peixoto",
      "telefones": "(91)98240-6862",
      "emails": "meoam.sco@gmail.com ",
      "site": ""
    },
    {
      "name": "São Domingos do Araguaia",
      "endereco": "Rua Acrísio Santo",
      "telefones": "(94)3332-1032",
      "emails": "prefeitura@saodomingosdoaraguaia.pa.gov.br ",
      "site": ""
    },
    {
      "name": "São Felix do Xingú",
      "endereco": "Rua 22 de Março",
      "telefones": "(94)99177-7768",
      "emails": "semmas@sfxingu.pa.gov.br",
      "site": ""
    },
    {
      "name": "São Francisco do Pará",
      "endereco": "Rua da Paz",
      "telefones": "(91)99966-4759",
      "emails": "semmasfpa@gmail.com ",
      "site": ""
    },
    {
      "name": "São Geraldo do Araguaia",
      "endereco": "Vereador Antônio Nonato Pedrosa",
      "telefones": "(94)98177-4457",
      "emails": "meioambiente@saogeraldodoaraguaia.pa.gov.br ",
      "site": ""
    },
    {
      "name": "São João de Pirabas",
      "endereco": "Rua Plácido Nascimento",
      "telefones": "(91)98870-6852",
      "emails": "semmasjppirabas@gmail.com ",
      "site": ""
    },
    {
      "name": "São João do Araguaia",
      "endereco": "Rua Dom Pedro I",
      "telefones": "(94)98403-0663",
      "emails": "semasja@gmail.com",
      "site": ""
    },
    {
      "name": "São Miguel do Guamá",
      "endereco": "Rua Vicente Costa",
      "telefones": "(91)98598-9588",
      "emails": "semma.smg@gmail.com",
      "site": ""
    },
    {
      "name": "São Sebastião da Boavista",
      "endereco": "Praça da Matriz",
      "telefones": "(91)3764-1117",
      "emails": "sema@pmssbv.pa.gov.br ",
      "site": ""
    },
    {
      "name": "Sapucaia",
      "endereco": "",
      "telefones": "(94)99158-3908",
      "emails": "drelmarmedvet@hotmail.com",
      "site": ""
    },
    {
      "name": "Senador José Porfirio",
      "endereco": "Rua Passagem Bom Jesus",
      "telefones": "(93)99121-6944",
      "emails": "pmsjporfirio@hotmail.com ",
      "site": ""
    },
    {
      "name": "Soure",
      "endereco": "5ª Rua",
      "telefones": "(91)99305-3556",
      "emails": "contato@soure.pa.gov.br ",
      "site": ""
    },
    {
      "name": "Tailândia",
      "endereco": "Rodova PA 150",
      "telefones": "(91)99361-7092",
      "emails": "sectma@gmail.com ",
      "site": ""
    },
    {
      "name": "Terra Alta",
      "endereco": "Rua Macedo Duarte",
      "telefones": "(91)3662-1319",
      "emails": "semmact@terraalta.pa.gov.br ",
      "site": ""
    },
    {
      "name": "Terra Santa",
      "endereco": "Travessa Nossa Senhora de Nazaré",
      "telefones": "(93)99144-4244",
      "emails": "secretario.semmats@gmail.com ",
      "site": ""
    },
    {
      "name": "Tomé-Açu",
      "endereco": "Avenida Dionísio Bentes",
      "telefones": "(91)3727-1339",
      "emails": "semma-tomeacu@hotmail.com",
      "site": ""
    },
    {
      "name": "Tracateua",
      "endereco": "Avenida Mário Nogueira",
      "telefones": "(91)98576-2060",
      "emails": "secmeioambiente@tracuateua.pa.gov.br",
      "site": ""
    },
    {
      "name": "Trairão",
      "endereco": "Tv Horizonte",
      "telefones": "(93)3559-1155",
      "emails": "lindoelsonpr@hotmail.com ",
      "site": ""
    },
    {
      "name": "Tucumã",
      "endereco": "Avenida Belém",
      "telefones": "(94)99216-8884",
      "emails": "hamiltonpachecodasilva@gmail.com",
      "site": ""
    },
    {
      "name": "Tucuruí",
      "endereco": "",
      "telefones": "",
      "emails": "meioambiente@tucurui.pa.gov.br ",
      "site": ""
    },
    {
      "name": "Ulianópolis",
      "endereco": "Rua 12 de Outubro",
      "telefones": "(91)98883-1239",
      "emails": "secretaria.semas@ulianopolis.pa.gov.br ",
      "site": ""
    },
    {
      "name": "Uruará",
      "endereco": "Avenida Perimetral Sul. Bairro Industrial",
      "telefones": "(93)3532-1727",
      "emails": "semmauruara@hotmail.com ",
      "site": ""
    },
    {
      "name": "Vigia de Nazaré",
      "endereco": "Rodovia PA 412",
      "telefones": "(91)98862-6598",
      "emails": "semma@vigia.pa.gov.br",
      "site": ""
    },
    {
      "name": "Viseu",
      "endereco": "Travessa da Trincheira",
      "telefones": "(91)98763-7166",
      "emails": "semma@viseu.pa.gov.br ",
      "site": ""
    },
    {
      "name": "Vitória do Xingu",
      "endereco": "Rua Anfrisio Nunes",
      "telefones": "(93)99191-4446",
      "emails": "semavtx@gmail.com ",
      "site": ""
    },
    {
      "name": "Xinguara",
      "endereco": "Rua Petronio Portela",
      "telefones": "(94)9180-4547",
      "emails": "semmaturxinguara@hotmail.com ",
      "site": ""
    }
  ];

  List<Municipio> municipios = [];

  MunicipioRepository() {
    for (var mun in munJson) {
      municipios.add(Municipio.fromJson(mun));
    }
  }

  List<Municipio> getMunicipios() {
    return municipios;
  }
}
