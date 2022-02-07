<template>
  <div>
    <nav class="datlearn datlearn--show" />
    <!-- Spinner Button HTML -->
    <button class="btn">
      <span class="spinner" />
      <span class="btn__text">loading...</span>
    </button>
  </div>
</template>

<script>

export default {

}

</script>

<style>

/*----------- Main Style ------*/

.btn {
  display: flex;
  align-items: center;
  font-size: 1.3rem;
  border: none;
  background-color: #1d3557;
  color: #f1faee;
  padding: 0.8rem 1.5rem;
  border-radius: 2rem;
  cursor: pointer;
  transition: 0.3s ease;
  box-shadow: 0 1rem 2rem -1rem rgba(0, 0, 0, 0.445);
}

.btn:hover {
  background-color: #003049;
  color: #eae2b7;
  box-shadow: 0 1rem 1rem -1rem rgba(0, 0, 0, 0.445);
}

.btn__text {
  margin-left: 0.8rem;
}

.spinner {
  width: 1.5rem;
  height: 1.5rem;
  display: inline-block;
  border: 3px solid #dddf00;
  border-top-color: transparent;
  border-bottom-color: transparent;
  border-radius: 50%;
  animation: spin 1s infinite;
}

@keyframes spin {
  0% {
    transform: rotate(0);
  }
  50% {
    transform: rotate(180deg);
    border-top-color: #fcab41;
    border-bottom-color: #80ffdb;
    border-right-color: transparent;
    border-left-color: transparent;
  }
  100% {
    transform: rotate(360deg);
  }
}
/*----------- End Main Style ------*/
/* ======= Datlearn ======= */
.datlearn {
  position: fixed;
  top: 0;
  text-align: center;
  font-family: cursive;
  display: flex;
  justify-content: center;
  align-items: center;
  width: 50%;
  color: #222;
  visibility: hidden;
}

.datlearn--show {
  visibility: visible;
}
.datlearn__love {
  margin-left: 1rem;
}

a {
  text-decoration: none;
}

.typing {
  display: flex;
  align-items: center;
}

.typing::after {
  content: " |";
  background-color: #fff;
  font-size: 2rem;
  animation: blink 1s infinite;
}

.typing__text {
  color: #fff;
  font-size: 1.3rem;
  font-family: cursive;
  text-transform: capitalize;
  max-width: 0;
  background-color: #0d47a1;
  padding-left: 0.9rem;
  padding-right: 0.4rem;
  overflow: hidden;
  white-space: nowrap;
  animation: typing 3s steps(20) infinite;
}

@keyframes blink {
  25% {
    opacity: 0;
  }
  50%,
  70%,
  100% {
    opacity: 1;
  }
}

@keyframes typing {
  to {
    max-width: 20rem;
  }
}

</style>
