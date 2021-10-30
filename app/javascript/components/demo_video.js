const embedVideo = (YTCode) => {
  const demo = document.querySelector("#demo-video");
  demo.insertAdjacentHTML("beforeend", YTCode);
}

embedVideo(`${@service.demo_link}`)
