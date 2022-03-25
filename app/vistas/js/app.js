
console.log("Hola");

const btnAgregarproduct = document.getElementById("btnAgregarproduct"); //Se crea el proceso para poder agregar un producto
btnAgregarproduct.addEventListener("click", ()=>{

    let name = document.getElementById("txtnproducto").value;
    let precio = document.getElementById("txtnprecio").value;
    let cantidad = document.getElementById("txtncantidad").value;

    let data = {name:name,
                cost:precio,
                quantity:cantidad};

    console.log(data);

    fetch('http://localhost:1339/api/productos/',{
        method:'post',
        body: JSON.stringify(data),
        headers: {'Content-Type':'application/json'}})
    .then(response => response.json())
    .then(json=>{
        let detprod = document.getElementById("detProdutos");
        detprod.innerHTML = `<p>Se inserto un producto en BD</p>`;
    })
});

const btnAgregarcliente = document.getElementById("btnAgregarcliente"); //se crea el proceso para agregar un cliente
btnAgregarcliente.addEventListener("click", ()=>{

    let name = document.getElementById("txtnCliente").value;
    let zipcode = document.getElementById("txtnZipcodecliente").value;
    let rfc = document.getElementById("txtnRfccliente").value;

    let data = {
        name:name,
        zipcode:zipcode,
        RFC:rfc
    };

    console.log(data);

    fetch('http://localhost:1339/api/client',{
        method:'post',
        body: JSON.stringify(data),
        headers: {'Content-Type':'application/json'}})
        .then(response => response.json())
        .then(json=>{
            let detprod = document.getElementById("detclientes");
            detprod.innerHTML = `<p>Se inserto un cliente en BD</p>`;
        })      
});


const btnCargarproductos = document.getElementById("btnCargarproductos");//Se llaman a los productos
btnCargarproductos.addEventListener("click", ()=>{
    fetch('http://localhost:1339/api/productos/')
    .then(response => response.json())
    .then(json => {
        const slcProductos = document.getElementById("slcProductos");
        const slcProductoscantidad = document.getElementById("slcProductoscantidad");
        const data= document.getElementById("data");
        let options ="";
        let cantidad ="";
        let body="";
        for(i=0; i<json.length; i++)
        {
            options += `<option value='${json[i].id}'>${json[i].name} ${json[i].cost}</option>`
            cantidad += `<option value='${json[i].id}'>${json[i].quantity}</option>`
            body += `<tr><td>${json[i].name}</td><td>${json[i].quantity}</td><td>${json[i].cost}</td></tr>`

        }
        slcProductos.innerHTML=options;
        slcProductoscantidad.innerHTML=cantidad;
        data.innerHTML=body;
    });
});

const btnCargaClientes = document.getElementById("btnCargarclientes");//se llaman a los clientes
btnCargaClientes.addEventListener("click", ()=>{
    fetch('http://localhost:1339/api/client/')
    .then(response => response.json())
    .then(json => {
        const slcClientes= document.getElementById("slcClientes");
        const data= document.getElementById("data2");
        let options ="";
        let body="";
        for(i=0; i<json.length; i++)
        {
            options += `<option value='${json[i].id}'>${json[i].name}</option>`
            body += `<tr><td>${json[i].name}</td><td>${json[i].zipcode}</td><td>${json[i].RFC}</td></tr>`
        }
        slcClientes.innerHTML=options;
        data.innerHTML=body;
    });    
});
