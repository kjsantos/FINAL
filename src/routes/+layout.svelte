<script>
	import { text } from 'svelte/internal'
	import '/src/app.css'
	import { page } from '$app/stores'
	/** @type {import('@sveltejs/adapter-vercel').Config} */
	export const config = {
		runtime: 'nodejs18.x',
	}
</script>

<svelte:head>
	<link rel="stylesheet" href="https://use.typekit.net/vnt8kss.css" />
	<style lang="postcss">
		h1 {
			color: white;
			font-style: italic;
			font-weight: 400;
			font-family: 'mrs-eaves-xl-serif', serif;
			text-decoration-outline: 0.2em solid black;
			text-decoration: underline;
			text-decoration-color: white;
			text-decoration-thickness: 0.01em;
			text-shadow: 3px 2px #4143b0;
			-webkit-text-stroke: 2px #ab333f;
		}
		h2 {
			color: transparent;
			font-style: normal;
			font-weight: 400;
			font-family: 'mrs-eaves-xl-serif', serif;
			-webkit-text-stroke: 0.5px black;
		}
		p {
			color: white;
			font-style: normal;
			font-weight: 700;
			font-family: 'sharik-sans', sans-serif;
			text-align: right;
			text-decoration: solid;
			text-shadow: 1px 1px black;
			-webkit-text-stroke: 0.5px black;
		}
		a {
			color: white;
			font-style: normal;
			font-weight: 700;
			font-family: 'sharik-sans', sans-serif;
			text-align: end;
			text-decoration: none;
			text-shadow: 0px 1px black;
		}
		a:hover {
			color: #81ba75;
		}
		body {
			background: rgb(0, 7, 18);
			background: linear-gradient(
				0deg,
				rgba(0, 7, 18, 0.850577731092437) 22%,
				rgba(60, 59, 59, 1) 94%
			);
			padding: 0;
		}
		nav {
			position: fixed;
			top: 0%;
			flex: 1 1 10%;
			width: 60%;
		}
		.box {
			background-color: #9ab3ae;
		}
		.hero {
			display: flex;
			flex-direction: column;
			justify-content: center;
			place-items: center;
			height: 60vh;
			text-align: center;
		}

		.hero h2 {
			margin-top: 0;
			font-weight: 200;
		}

		.spacer {
			height: 40vh;
		}
		.spacer,
		.top {
			height: 20vh;
		}
		.sticky {
			position: sticky;
			top: 20%;
			flex: 1 1 40%;
			width: 100%;
			height: 100%;
		}

		.section-container {
			display: flex;
			justify-items: center;
			transition: background 100ms;
			margin-top: 0em;
			text-align: center;
		}

		.step {
			display: flex;
			justify-content: center;
			place-items: center;
			height: 80vh;
		}

		.step-content {
			display: flex;
			flex-direction: column;
			justify-content: center;
			transition: background 500ms ease;
			margin: auto;
			box-shadow: 1px 1px 10px rgba(0, 0, 0, 0.2);
			border-radius: 5px;
			background: whitesmoke;
			padding: 0.5rem 1rem;
			width: 25%;
			max-width: 500px;
			color: #ccc;
			font-size: 1rem;
			text-align: left;
		}

		.step.active .step-content {
			background: white;
			color: black;
		}

		.steps-container,
		.sticky {
			width: 100%;
			height: 100%;
		}

		.steps-container {
			flex: 1 1 40%;
			z-index: 2;
		}
		@media screen and (max-width: 768px) {
			.section-container {
				flex-direction: column-reverse;
			}
			.sticky {
				margin: auto;
				width: 95%;
			}
		}
	</style>
</svelte:head>

<slot />
