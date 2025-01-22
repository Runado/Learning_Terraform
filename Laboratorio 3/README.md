# Terraform_Codes

## Terraform
Vamos começar com uma definição. O Terraform é definido pela HashiCorp, o criador do Terraform, como uma ferramenta para construir, alterar e criar versões de infraestrutura com segurança e eficiência. Isso se parece com uma infraestrutura como solução de código, porque Terraform é uma infraestrutura como solução de código.

Infraestrutura como código

A infraestrutura como código, ou IaC (Infrastructure as Code), ganhou muito impulso ao longo dos anos, porque ajuda a resolver vários problemas que afetavam o gerenciamento de infraestrutura no passado:

Ambientes reproduzíveis: ao usar código para gerar infraestrutura, o mesmo ambiente pode ser criado continuamente. Com o tempo, um ambiente pode se distanciar do seu estado desejado e problemas difíceis de diagnosticar podem se infiltrar no seu canal de liberação. Com IaC, nenhum ambiente recebe tratamento especial e novos ambientes são facilmente criados e destruídos.
Idempotência e Convergência: estendendo o último ponto, idempotência é o traço que não importa se você aplique a configuração descrita pelo seu IaC, não há efeitos colaterais no ambiente. Convergência é a característica de que as ações só são realizadas se forem necessárias. Em IaC, apenas as ações necessárias para trazer o ambiente ao estado desejado são executadas. Se o ambiente já estiver no estado desejado, nenhuma ação será executada.
Facilitando a colaboração: Ter o código em um sistema de controle de versão como o Git permite que as equipes colaborem na infraestrutura. Os membros da equipe podem obter versões específicas do código e criar seus próprios ambientes para teste ou outros cenários.
Infraestrutura de autoatendimento: um ponto problemático que muitas vezes existia para desenvolvedores antes de mudar para a infraestrutura em nuvem, eram os atrasos necessários para que as equipes de operações criassem a infraestrutura de que precisavam para construir novos recursos e ferramentas. Com a elasticidade da nuvem, permitindo que os recursos sejam criados sob demanda, os desenvolvedores podem provisionar a infraestrutura de que precisam, quando precisam. O IaC melhora ainda mais a situação, permitindo que os desenvolvedores usem módulos de infraestrutura para criar ambientes idênticos em qualquer ponto do ciclo de vida de desenvolvimento do aplicativo. Os módulos de infraestrutura podem ser criados por operações e compartilhados com os desenvolvedores, livrando os desenvolvedores de aprender outra habilidade.
Todos esses benefícios combinados tornam o IaC um elemento básico nas práticas de DevOps.

Algumas outras opções IaC

Os provedores de nuvem geralmente fornecem a sua própria infraestrutura nativa como solução de código. Por exemplo:

Amazon Web Services tem CloudFormation,

O Microsoft Azure tem modelos do Azure Resource Manager e

O Google Cloud Platform possui gerenciador de implantação.

Cada um vem com a sua própria maneira única de descrever a infraestrutura em código. Isso também vale para nuvens privadas como OpenStack, que tem Heat para descrever a infraestrutura no código. Com a tendência do setor de se mover para a adoção de várias nuvens, incluindo nuvens híbridas, é mais eficiente ter uma ferramenta e um fluxo de trabalho comum para gerenciar a infraestrutura, independentemente de onde ela esteja hospedada. Mesmo se você estiver usando apenas uma nuvem agora, pode valer a pena se preparar para o futuro, caso você aproveite várias nuvens mais tarde.

## Infraestrutura com Suporte

O Terraform pode ajudar com várias nuvens, tendo um único fluxo de trabalho para todas as nuvens. A infraestrutura que o Terraform gerencia pode ser hospedada em nuvens públicas, como Amazon Web Services, Azure e Google Cloud Platform, ou no local, em nuvens privadas, como OpenStack, VMWare vSphere ou CloudStack. As integrações de infraestrutura do Terraform também permitem gerenciar software e serviços, incluindo bancos de dados como MySQL, sistemas de controle de origem como GitHub, ferramentas de gerenciamento de configuração como Chef e muito mais. Existem mais de 100 integrações de infraestrutura disponíveis publicamente. É muito poderoso ser capaz de descrever toda a sua infraestrutura no Terraform. Mesmo se você estiver usando apenas uma nuvem, o Terraform é uma ótima opção e pode facilitar o uso de várias nuvens posteriormente.

## Quando Usar o Terraform?
Agora você tem uma boa ideia do que você pode realizar com o Terraform. Para reforçar quando você deve considerar o uso do Terraform, vamos considerar alguns exemplos de casos de uso destacados pela HashiCorp.

O primeiro que consideraremos são os ambientes descartáveis. É uma prática comum ter um ambiente de produção e de teste ou de controle de qualidade. Esses ambientes são clones menores da sua contraparte de produção, mas são usados ​​para testar novos aplicativos antes de lançá-los na produção. À medida que o ambiente de produção fica maior e mais complexo, torna-se cada vez mais oneroso manter um ambiente de preparação atualizado.

Usando o Terraform, o ambiente de produção pode ser codificado e compartilhado com teste, controle de qualidade ou desenvolvimento. Essas configurações podem ser usadas para ativar rapidamente novos ambientes para teste e, em seguida, ser facilmente descartados. O Terraform pode ajudar a domar a dificuldade de manter ambientes paralelos e torna prático criá-los e destruí-los elasticamente.

Outro exemplo de caso de uso do Terraform é a implantação de várias nuvens. Pode ser atraente espalhar a infraestrutura em várias nuvens para aumentar a tolerância a falhas. Usando apenas uma única região ou provedor de nuvem, a tolerância a falhas é limitada pela disponibilidade desse provedor. Ter uma implantação de várias nuvens permite uma recuperação mais harmoniosa da perda de uma região ou de um provedor inteiro. O aumento da tolerância a falhas também se aplica a nuvens híbridas, nas quais você tem a sua própria nuvem privada em execução no local, mas também aproveita uma nuvem pública para continuidade de negócios e recuperação de desastres. Como exemplos, fazer backup de dados, hierarquizar o acesso aos dados ou executar um banco de dados ou aplicativo secundário no caso de falha de seus servidores locais primários.

Realizar implantações em várias nuvens pode ser muito desafiador, pois muitas ferramentas existentes para gerenciamento de infraestrutura são específicas da nuvem. O Terraform é independente da nuvem e permite que uma única configuração seja usada para gerenciar vários provedores e até mesmo lidar com dependências entre nuvens. Isso simplifica o gerenciamento e a orquestração, ajudando as operadoras a construírem infraestruturas de várias nuvens em larga escala.

Aplicativos multicamadas são outro exemplo de onde o Terraform pode brilhar. Um padrão muito comum é a arquitetura N-tier. A arquitetura de 2 camadas mais comum é um pool de servidores da Web que usa uma camada de banco de dados. Camadas adicionais são adicionadas para servidores API, servidores de cache, malhas de roteamento, etc. Esse padrão é usado porque as camadas podem ser escaladas independentemente e fornecem uma separação de interesses.

Terraform é uma ferramenta ideal para construir e gerenciar essas infraestruturas. Cada camada pode ser descrita como uma coleção de recursos e as dependências entre cada camada são tratadas automaticamente. O Terraform garantirá que a camada do banco de dados esteja disponível antes que os servidores da web sejam iniciados e que os balanceadores de carga estejam cientes dos nós da web. Cada nível pode então ser escalado facilmente usando o Terraform, modificando um único valor de configuração de contagem. Como a criação e o provisionamento de um recurso são codificados e automatizados, o dimensionamento elasticamente com a carga se torna trivial.

O último caso de uso que mencionarei são os Agendadores de recursos. Em infraestruturas de grande escala, a atribuição estática de aplicativos a máquinas torna-se cada vez mais desafiadora. Para resolver esse problema, existem vários agendadores, como Borg, Mesos, YARN e Kubernetes. Eles podem ser usados ​​para agendar dinamicamente contêineres Docker, Hadoop, Spark e muitas outras ferramentas de software.

O Terraform não se limita a provedores físicos como AWS. Agendadores de recursos podem ser tratados como um provedor, permitindo que o Terraform solicite recursos deles. Isso permite que o Terraform seja usado em camadas: para configurar a infraestrutura física executando os Agendadores, bem como provisionar na grade agendada.

Você pode encontrar esses casos de uso e muito mais no site do Terraforms https://www.terraform.io/intro/use-cases.html.

##Terraform Product Streams

O Terraform pode se referir a diferentes produtos e camadas.

O produto principal é a versão de código aberto do Terraform. Inclui todas as peças necessárias para fornecer infraestrutura como código e inclui suporte para as mais de 100 integrações de infraestrutura discutidas anteriormente. O código-fonte do produto Terraform de código aberto reside no GitHub e é escrito na linguagem Go. A HashiCorp hospeda lançamentos de código aberto compilados como um único binário compactado no site terraform.io. A versão de código aberto fornece uma interface de linha de comando para gerenciar a sua infraestrutura.

O outro produto é o Terraform Enterprise, que está disponível em duas camadas. Ambas as camadas incluem os recursos do produto de código aberto e adicionam recursos adicionais úteis para equipes maiores.

O Pro é o primeiro nível. Pro é um software como serviço executado na nuvem e gerenciado pela HashiCorp. O nível pro inclui uma interface gráfica do usuário, conexões de controle de versão para modificar a infraestrutura conforme as alterações são confirmadas, acesso à API para integrar o terraform às ferramentas existentes e um registro de módulo de infraestrutura privado para compartilhar módulos reutilizáveis ​​em sua organização. Você também recebe suporte para horário comercial da HashiCorp com o nível Pro.

O Premium é o segundo nível empresarial. O Premium é instalado na sua própria infraestrutura de nuvem, que atualmente deve estar na AWS. Inclui os recursos do Pro, bem como a política como o código, logon único com SAML e fornece logs de auditoria de cada alteração na infraestrutura. Você também recebe suporte 24 horas por dia, 7 dias por semana e suporte de nível ouro da HashiCorp.

## Terraform CLI
O produto Terraform de código aberto é compilado em uma ferramenta com a qual você interage na linha de comando. Como exemplo, esta imagem mostra um fragmento da saída quando você executa o terraform na linha de comando. A ferramenta de linha de comando usa arquivos de configuração que especificam a sua infraestrutura como código.

Obtendo a CLI

Mencionei que a HashiCorp hospeda downloads dos lançamentos dos binários de código aberto do Terraform. Você pode encontrá-los em terraform.io/downloads.html. O link é fornecido no final da transcrição desta lição. A página de downloads sempre terá a versão mais recente do Terraform. A HashiCorp também hospeda versões de lançamento anteriores para todas as plataformas. Você pode usar a versão que funciona para você e atualizar quando quiser.

Como o Terraform é um binário único, não há um instalador. Você só precisa descompactar os arquivos compactados dos hosts HashiCorp no site do Terraform e colocar o binário em um diretório no PATH do seu ambiente ou adicionar o diretório do Terraform ao seu PATH.

Fluxo de Trabalho Típico

Você sabe que existe uma CLI e arquivos de configuração, mas não discutimos um fluxo de trabalho típico para gerenciamento de infraestrutura com Terraform. Este slide ilustrará como você usaria o Terraform ao desenvolver um código de infraestrutura.

Primeiro, você grava ou modifica os arquivos de configuração para a sua infraestrutura. Os arquivos de configuração declaram o estado desejado da sua infraestrutura. Você modifica os arquivos de configuração existentes para declarar como deseja alterar a infraestrutura existente.

Quando estiver satisfeito com a configuração declarada, você pode pedir ao Terraform para gerar um plano de execução para ela. O comando plan no CLI é usado para gerar um plano de execução a partir de uma configuração. O plano de execução informa quais mudanças o Terraform precisaria fazer para trazer a sua infraestrutura atual ao estado declarado na sua configuração. Como o Terraform é convergente, ele planejará o mínimo de ações necessárias para trazer a infraestrutura para a configuração desejada. O Terraform também considera as dependências para determinar a ordem em que as alterações devem ser aplicadas. O estágio do plano é relativamente barato em comparação com a aplicação real das alterações, portanto, você pode usar o comando plan ao desenvolver a sua configuração para ver quais alterações precisam ocorrer. Para infraestruturas complexas, o estágio do plano pode levar muito tempo. Isso ocorre porque, para planejar as mudanças corretamente, o terraform deve obter o estado atual de todos os componentes na sua infraestrutura, fazendo solicitações de API. Existem maneiras de contornar a geração lenta de planos se você se deparar com essa situação. Você pode dizer ao Terraform para direcionar apenas um subconjunto da infraestrutura ou dizer ao Terraform para usar as informações de estado obsoleto para um plano.

Com base nas mudanças necessárias que você vê no plano, você pode aceitar ou rejeitar as mudanças. Ao planejar as alterações separadamente antes de aplicá-las, o Terraform permite que você evite erros e incertezas.

Se você não gosta do que vê no plano, pode voltar e modificar a sua configuração sem ter causado nenhum dano.

Se você aceitar o plano, pode instruir o Terraform a aplicar as alterações. Você usa o comando apply para fazer isso. O comando aplicar pode usar o plano que você gera com o comando plano. Se você não fornecer um plano, o apply pode gerar um e pedir para você aceitar o plano antes de aplicar as alterações. O Terraform fará as chamadas de API necessárias para implementar as mudanças. Se algo der errado, o terraform não tentará reverter automaticamente a infraestrutura ao estado em que estava antes de executar a aplicação. Isso ocorre porque a aplicação segue o plano. Não excluirá um recurso se o plano não exigir. Se você controla a versão do código de configuração da sua infraestrutura, e eu o encorajo fortemente a isso, você pode usar uma versão anterior da sua configuração para reverter. Como alternativa, você pode usar o comando destroy ou taint para direcionar os componentes que precisam ser excluídos ou recriados, respectivamente.

Gráfico de Recursos

Mencionei que o Terraform usa informações de dependência para planejar a ordem das mudanças na infraestrutura. O Terraform cria um gráfico de recursos que captura todas as informações de dependência na sua infraestrutura. As dependências geralmente são expressas naturalmente por meio da configuração e não exigem que você marque o que depende de quê. Usando o gráfico de recursos, o Terraform pode aplicar alterações em paralelo quando não houver dependências e construir a sua infraestrutura da forma mais eficiente possível. O Terraform pode gerar o gráfico e você pode visualizá-lo para entender mais sobre a sua infraestrutura. O exemplo mostra um exemplo de Manage AWS Resources with Terraform Lab aqui no Cloud Academy. O gráfico mostra as dependências entre uma instância, sub-redes e um VPC. Você aprenderá mais sobre o gráfico de recursos ao fazer o laboratório.

Fluxos de Trabalho com Automação

O fluxo de trabalho típico que descrevi é quando você está trabalhando manualmente na configuração da sua infraestrutura.

No entanto, o Terraform oferece suporte à automação, por exemplo, integrando-se à integração contínua ou pipelines de implantação contínua. Você pode criar infraestrutura automaticamente para implantar novas filiais

Se você decidir que é apropriado, você pode aceitar automaticamente os planos para ter a infraestrutura atualizada para a versão mais recente sem qualquer intervenção humana. Provavelmente não é uma boa ideia para ambientes de produção.

Em vez disso, você pode optar por manter a etapa de aprovação manual. Com o plano de execução gerado e o gráfico de recursos, é fácil entender o que vai mudar e em que ordem. Mesmo para conjuntos de alterações complexos, a chance de aplicar alterações não intencionais é bastante reduzida.

Por último, você também pode gerar apenas um plano. Isso pode ser útil para revisar solicitações pull. Você pode ver rapidamente as implicações das mudanças na sua infraestrutura atual inspecionando o plano.
