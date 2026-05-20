import '../models/question_model.dart';

const vocationalQuestions = [
  QuestionModel(
    text: 'Com qual tipo de atividade você mais se identifica?',
    answers: [
      AnswerOption(
        text: 'Resolver problemas com computadores',
        area: 'Tecnologia',
      ),
      AnswerOption(text: 'Organizar tarefas e pessoas', area: 'Administração'),
      AnswerOption(
        text: 'Criar textos, vídeos ou apresentações',
        area: 'Comunicação',
      ),
      AnswerOption(text: 'Cuidar do bem-estar das pessoas', area: 'Saúde'),
      AnswerOption(
        text: 'Criar layouts, imagens ou produtos visuais',
        area: 'Design',
      ),
      AnswerOption(
        text: 'Ensinar e ajudar colegas a aprender',
        area: 'Educação',
      ),
    ],
  ),
  QuestionModel(
    text: 'Em um trabalho em grupo, qual papel você costuma assumir?',
    answers: [
      AnswerOption(text: 'Cuido das ferramentas digitais', area: 'Tecnologia'),
      AnswerOption(
        text: 'Organizo prazos e responsabilidades',
        area: 'Administração',
      ),
      AnswerOption(text: 'Apresento as ideias do grupo', area: 'Comunicação'),
      AnswerOption(text: 'Apoio quem está com dificuldade', area: 'Saúde'),
      AnswerOption(text: 'Melhoro a parte visual do trabalho', area: 'Design'),
      AnswerOption(text: 'Explico o conteúdo para o grupo', area: 'Educação'),
    ],
  ),
  QuestionModel(
    text: 'Qual matéria ou atividade você mais gosta?',
    answers: [
      AnswerOption(
        text: 'Tecnologia, matemática ou robótica',
        area: 'Tecnologia',
      ),
      AnswerOption(text: 'Empreendedorismo ou finanças', area: 'Administração'),
      AnswerOption(
        text: 'Português, teatro ou redes sociais',
        area: 'Comunicação',
      ),
      AnswerOption(text: 'Biologia ou atividades de cuidado', area: 'Saúde'),
      AnswerOption(text: 'Artes, desenho ou fotografia', area: 'Design'),
      AnswerOption(text: 'Monitoria ou projetos escolares', area: 'Educação'),
    ],
  ),
  QuestionModel(
    text: 'Que tipo de problema você prefere resolver?',
    answers: [
      AnswerOption(text: 'Automatizar algo repetitivo', area: 'Tecnologia'),
      AnswerOption(
        text: 'Melhorar processos e resultados',
        area: 'Administração',
      ),
      AnswerOption(
        text: 'Transmitir uma mensagem com clareza',
        area: 'Comunicação',
      ),
      AnswerOption(text: 'Ajudar alguém a se sentir melhor', area: 'Saúde'),
      AnswerOption(
        text: 'Tornar uma ideia mais bonita e funcional',
        area: 'Design',
      ),
      AnswerOption(
        text: 'Ajudar pessoas a entenderem um assunto',
        area: 'Educação',
      ),
    ],
  ),
  QuestionModel(
    text: 'Em qual ambiente você se imagina trabalhando?',
    answers: [
      AnswerOption(
        text: 'Escritório de tecnologia ou remoto',
        area: 'Tecnologia',
      ),
      AnswerOption(
        text: 'Empresa, loja ou setor administrativo',
        area: 'Administração',
      ),
      AnswerOption(
        text: 'Agência, rádio, eventos ou mídias digitais',
        area: 'Comunicação',
      ),
      AnswerOption(text: 'Clínica, hospital ou projeto social', area: 'Saúde'),
      AnswerOption(
        text: 'Estúdio criativo ou equipe de produto',
        area: 'Design',
      ),
      AnswerOption(
        text: 'Escola, curso ou espaço de aprendizagem',
        area: 'Educação',
      ),
    ],
  ),
  QuestionModel(
    text: 'Qual habilidade você gostaria de desenvolver?',
    answers: [
      AnswerOption(text: 'Programação e análise de dados', area: 'Tecnologia'),
      AnswerOption(text: 'Liderança e planejamento', area: 'Administração'),
      AnswerOption(text: 'Comunicação e escrita', area: 'Comunicação'),
      AnswerOption(text: 'Empatia e atendimento', area: 'Saúde'),
      AnswerOption(text: 'Criatividade visual', area: 'Design'),
      AnswerOption(text: 'Didática e paciência', area: 'Educação'),
    ],
  ),
  QuestionModel(
    text: 'Qual dessas tarefas parece mais interessante para você?',
    answers: [
      AnswerOption(text: 'Criar um aplicativo simples', area: 'Tecnologia'),
      AnswerOption(
        text: 'Controlar entradas, saídas e metas',
        area: 'Administração',
      ),
      AnswerOption(
        text: 'Planejar uma campanha para redes sociais',
        area: 'Comunicação',
      ),
      AnswerOption(
        text: 'Orientar alguém sobre hábitos saudáveis',
        area: 'Saúde',
      ),
      AnswerOption(text: 'Desenhar uma identidade visual', area: 'Design'),
      AnswerOption(
        text: 'Preparar uma explicação passo a passo',
        area: 'Educação',
      ),
    ],
  ),
  QuestionModel(
    text: 'Quando você aprende algo novo, o que mais chama sua atenção?',
    answers: [
      AnswerOption(
        text: 'Como a ferramenta funciona por trás',
        area: 'Tecnologia',
      ),
      AnswerOption(
        text: 'Como aplicar isso para melhorar uma rotina',
        area: 'Administração',
      ),
      AnswerOption(
        text: 'Como contar essa ideia para outras pessoas',
        area: 'Comunicação',
      ),
      AnswerOption(
        text: 'Como isso pode melhorar a vida de alguém',
        area: 'Saúde',
      ),
      AnswerOption(
        text: 'Como deixar a solução mais clara e bonita',
        area: 'Design',
      ),
      AnswerOption(
        text: 'Como ensinar esse conteúdo para outra pessoa',
        area: 'Educação',
      ),
    ],
  ),
  QuestionModel(
    text: 'Qual tipo de curso complementar você faria primeiro?',
    answers: [
      AnswerOption(
        text: 'Informática, programação ou lógica',
        area: 'Tecnologia',
      ),
      AnswerOption(
        text: 'Excel, gestão ou empreendedorismo',
        area: 'Administração',
      ),
      AnswerOption(
        text: 'Redação, oratória ou marketing digital',
        area: 'Comunicação',
      ),
      AnswerOption(
        text: 'Primeiros socorros ou atendimento humanizado',
        area: 'Saúde',
      ),
      AnswerOption(
        text: 'Design gráfico, fotografia ou edição',
        area: 'Design',
      ),
      AnswerOption(
        text: 'Monitoria, reforço escolar ou didática',
        area: 'Educação',
      ),
    ],
  ),
  QuestionModel(
    text: 'Qual resultado faria você se sentir mais realizado?',
    answers: [
      AnswerOption(
        text: 'Ver uma solução digital funcionando',
        area: 'Tecnologia',
      ),
      AnswerOption(
        text: 'Ver uma equipe trabalhando com mais organização',
        area: 'Administração',
      ),
      AnswerOption(
        text: 'Ver pessoas entendendo uma mensagem importante',
        area: 'Comunicação',
      ),
      AnswerOption(text: 'Ver alguém recebendo apoio e cuidado', area: 'Saúde'),
      AnswerOption(
        text: 'Ver uma ideia com uma aparência profissional',
        area: 'Design',
      ),
      AnswerOption(
        text: 'Ver alguém aprendendo por causa da sua ajuda',
        area: 'Educação',
      ),
    ],
  ),
];
