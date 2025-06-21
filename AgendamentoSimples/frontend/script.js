// Aguarda o carregamento completo do HTML antes de executar o script
document.addEventListener('DOMContentLoaded', () => {

    // Seleciona os elementos principais da página
    const screens = document.querySelectorAll('.screen');
    const loginForm = document.getElementById('login-form');
    const mainNav = document.getElementById('main-nav');
    const navLinksContainer = document.getElementById('nav-links');
    const userGreeting = document.getElementById('user-greeting');
    const logoutButton = document.getElementById('logout-button');

    /**
     * Função para mostrar uma tela específica e esconder as outras.
     * @param {string} screenId - O ID da div da tela a ser mostrada.
     */
    function showScreen(screenId) {
        // Esconde todas as telas
        screens.forEach(screen => {
            screen.classList.remove('active');
        });
        // Mostra apenas a tela desejada
        const activeScreen = document.getElementById(screenId);
        if (activeScreen) {
            activeScreen.classList.add('active');
        }
    }
    
    // Adiciona o evento de "submit" ao formulário de login
    loginForm.addEventListener('submit', (e) => {
        // Previne o recarregamento da página, que é o comportamento padrão do formulário
        e.preventDefault(); 
        
        const email = document.getElementById('email').value.toLowerCase();
        
        // Mostra a barra de navegação
        mainNav.classList.remove('hidden');
        
        // Limpa os links de navegação anteriores para carregar os novos
        navLinksContainer.innerHTML = '';
        
        let targetScreen = 'login-screen'; // Tela padrão caso o email não seja reconhecido

        // Verifica o tipo de usuário pelo email e configura a interface
        if (email.includes('profissional@email.com')) {
            userGreeting.textContent = 'Olá, Dr. Carlos!';
            navLinksContainer.innerHTML = `
                <a href="#" data-screen="professional-dashboard-screen" class="bg-indigo-700 text-white px-3 py-2 rounded-md text-sm font-medium">Painel</a>
                <a href="#" data-screen="manage-services-screen" class="text-gray-500 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium">Meus Serviços</a>
            `;
            targetScreen = 'professional-dashboard-screen';

        } else if (email.includes('cliente@email.com')) {
            userGreeting.textContent = 'Olá, Roberto!';
            navLinksContainer.innerHTML = `
                <a href="#" data-screen="client-dashboard-screen" class="bg-indigo-700 text-white px-3 py-2 rounded-md text-sm font-medium">Painel</a>
            `;
            targetScreen = 'client-dashboard-screen';

        } else if (email.includes('admin@email.com')) {
            userGreeting.textContent = 'Olá, Admin!';
            navLinksContainer.innerHTML = `
                 <a href="#" data-screen="admin-dashboard-screen" class="bg-indigo-700 text-white px-3 py-2 rounded-md text-sm font-medium">Gerenciar Usuários</a>
            `;
            targetScreen = 'admin-dashboard-screen';

        } else {
             // Se o email não for um dos emails de teste, esconde a navegação
             mainNav.classList.add('hidden');
        }

        // Mostra a tela correspondente ao usuário logado
        showScreen(targetScreen);
    });

    // Adiciona o evento de clique ao botão de logout
    logoutButton.addEventListener('click', () => {
        mainNav.classList.add('hidden'); // Esconde a navegação
        loginForm.reset(); // Limpa o formulário de login
        showScreen('login-screen'); // Volta para a tela de login
    });

    // Adiciona um único evento de clique na barra de navegação para gerenciar todos os links
    navLinksContainer.addEventListener('click', (e) => {
        // Verifica se o clique foi em um link (tag <a>)
        if (e.target.tagName === 'A') {
            e.preventDefault();
            const screenId = e.target.dataset.screen;
            if(screenId) {
                showScreen(screenId);
            }

            // Atualiza o estilo do link ativo
            navLinksContainer.querySelectorAll('a').forEach(link => {
                link.classList.remove('bg-indigo-700', 'text-white');
                link.classList.add('text-gray-500', 'hover:bg-gray-700', 'hover:text-white');
            });
            e.target.classList.add('bg-indigo-700', 'text-white');
            e.target.classList.remove('text-gray-500', 'hover:bg-gray-700', 'hover:text-white');
        }
    });

    // Função global para permitir que botões no HTML chamem o showScreen (ex: botão "Novo Agendamento")
    window.showScreen = showScreen;
});