const c = document.querySelector('.move-page')
const indexs = Array.from(document.querySelectorAll('.move-page-index'))
let cur = -1
indexs.forEach((index, i) => {
	
  index.addEventListener('click', (e) => {
    // clear
    console.log("move");
    c.className = 'move-page'
    void c.offsetWidth; // Reflow
    c.classList.add('open')
    c.classList.add(`i${i + 1}`)
    if (cur > i) {
      c.classList.add('flip')
    }
    cur = i
  })
})