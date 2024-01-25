console.log("***** Reply Module *****");
function getList(param) {
	let bnum = param.bnum;
	let sno = param.sno;
	let eno = param.eno;

	return fetch(`./reply/list/${bnum}/${sno}/${eno}`, { method: 'get' })
		.then(response => response.json())
		.catch(console.log)
}

function getPage(param) {
	let url = `./reply/page?${param}`;

	return fetch(url, { method: 'get' })
		.then(response => response.text())
		.catch(console.log)

}

function add(reply) {
	return fetch('./reply/create', {
		method: 'post',
		body: JSON.stringify(reply),
		headers: { 'Content-Type': "application/json; charset=utf-8" }
	})
		.then(response => response.text())
		.catch(console.log);
}

function get(rnum) {
	return fetch(`./reply/${rnum}`, { method: 'get' })
		.then(response => response.json())
		.catch(console.log);
}

function update(reply) {
	return fetch(`./reply/`, {
		method: 'put',
		body: JSON.stringify(reply),
		headers: { 'Content-Type': "application/json; charset=utf-8" }
	})
		.then(response => response.text())
		.catch(console.log);
}

function remove(rnum) {
	return fetch(`./reply/${rnum}`, { method: 'delete' })
		.then(response => response.text())
		.catch(console.log);
}