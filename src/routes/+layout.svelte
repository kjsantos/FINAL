<script>
	import '../app.css'
</script>

<svelte:head>
	<link rel="stylesheet" href="https://use.typekit.net/qem3paa.css" />
	<style lang="postcss">
		h1 {
            font-family: "mrs-eaves-xl-serif", serif;
            font-weight: 400;
            font-style: italic;
            color: white;
            text-decoration: solid;
        }
        p {
            font-family: "sharik-sans", sans-serif;
            font-weight: 700;
            font-style: normal;
            color: white;
            text-decoration: solid;
            text-align: right;
        }

        a {
            font-family: "sharik-sans", sans-serif;
            font-weight: 700;
            font-style: normal;
            color: var(--color-theme-1);
            text-decoration: none;
            text-align: end;
        }
        a:hover {
            color: ;
        }
		body {
			background-color: #a3b39a;
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
		.ticker {
			color: #f1ffe8;
			font-style: italic;
			font-weight: 600;
			font-family: 'obviously-extended', sans-serif;
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
        .spacer, .top {
			height: 20vh;
		}
		.sticky {
			position: sticky;
			top: 10%;
			flex: 1 1 10%;
			width: 60%;
		}

		.section-container {
			display: flex;
			transition: background 100ms;
			margin-top: 1em;
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
			width: 75%;
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
			width: 40%;
			height: 100%;
		}

		.steps-container {
			flex: 1 1 80%;
			z-index: 10;
		}

		/* Comment out the following line to always make it 'text-on-top' */
		@media screen and (max-width: 768px) {
			.section-container {
				flex-direction: column-reverse;
			}
			.sticky {
				margin: auto;
				width: 95%;
			}
		}
		@media (min-width: 480px) {
			a {
				font-size: 0.5rem;
				line-height: 1.25;
			}
			.box {
				width: 45%;
				height: 45%;
			}
			.container {
				max-width: 480px;
			}
		}
		@media (min-width: 640px) {
			a {
				font-size: 1rem;
				line-height: 1.25;
			}
			.box {
				width: 60%;
				height: 60%;
			}
			.container {
				max-width: 640px;
			}
		}
		@media (min-width: 768px) {
			a {
				font-size: 1rem;
				line-height: 1.25;
			}
			.box {
				width: 60%;
				height: 60%;
			}
			.container {
				max-width: 768px;
			}
		}
		@media (min-width: 1024px) {
			a {
				font-size: 1rem;
				line-height: 1.25;
			}
			.box {
				width: 70%;
				height: 70%;
			}
			.container {
				max-width: 1024px;
			}
		}
		@media (min-width: 1280px) {
			.box {
				width: 80%;
				height: 80%;
			}
			.container {
				max-width: 1280px;
			}
		}
		@media (min-width: 1536px) {
			h1 {
				font-size: 4.75rem;
				line-height: 1.5;
			}
			p {
				font-size: 2rem;
				line-height: 1rem;
			}
			a {
				font-size: 2.25rem;
				line-height: 1.25;
			}
			.box {
				width: 100%;
				height: 100%;
			}
			.container {
				max-width: 1536px;
			}
			.ticker {
				display: inline-block;
				box-sizing: content-box;
				padding-right: 100%;
				height: 4rem;
				line-height: 4rem;
				white-space: nowrap;
			}
		}
	</style>
</svelte:head>

<slot />
