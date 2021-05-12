<script>
window.onload = () => {
    [...document.getElementsByTagName('img')].forEach(v => {
        if (v.src.match(/^data\:image\/svg\+xml;base64/) !== null) {
            v.parentElement.innerHTML = decodeURIComponent(escape(atob(v.src.replace(/^data\:image\/svg\+xml;base64,/, ''))))
        }
    })    
}
</script>
