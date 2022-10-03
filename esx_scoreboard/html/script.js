const BACKSPACE_KEY_ID = 8;
const ESC_KEY_ID = 27;
const F6_KEY_ID = 117;

$(window).ready(function () {
	window.addEventListener('message', function (event) {
		const jqContainer = $('#container');
		let data = event.data;
		if (data.showMenu) {
			jqContainer.show();

			const jqPlayers = $('#players');
			jqPlayers.empty();

			let pos = 0;
			data.players.sort((a, b) => b.kills - a.kills);
			for (const player of data.players) {
				pos++
				let trClass = player.online ? 'success' : 'danger';
				if (player.isLocalPlayer) {
					trClass += ' strong';
				}
				const kdr = ((Math.round((player.kills/(player.deaths || 1)) * 100) / 100) || 0);
				let playerHtml = 
					'<tr class="' + trClass + '">' +
						'<td>' + pos + '</td>' +
						'<td>' + player.name + '</td>' +
						'<td class="text-center">' + player.level + '</td>' +
						'<td class="text-right">' + Number(player.kills).toLocaleString('pt-BR') + '</td>' +
						'<td class="text-right">' + Number(player.deaths).toLocaleString('pt-BR') + '</td>' +
						'<td class="text-right">' + Number(kdr).toLocaleString('pt-BR') + '</td>' +
					'</tr>';
				jqPlayers.append(playerHtml);
			}
		} else {
			jqContainer.hide();
		}
	});

	document.onkeyup = function (data) {
		if (data.which == ESC_KEY_ID || data.which == F6_KEY_ID || data.which == BACKSPACE_KEY_ID) {
			close();
		}
	};

	$('#close-button').on('click', function () {
		close();
	})

	function close() {
		const url = `https://${GetParentResourceName()}/close`;
		$.post(url, '{}');
	}
});
