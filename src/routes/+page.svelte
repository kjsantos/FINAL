<script>
    import {fly, fade} from 'svelte/transition';
    import {onMount} from 'svelte';
    import { page } from '$app/stores';
    let animate = false

	onMount(() => {
        animate = true
    })
</script>

<svelte:head>
	<title>Home</title>
	<link rel="stylesheet" href="https://use.typekit.net/vnt8kss.css">
	<meta name="description" content="Svelte demo app" />
</svelte:head>

<section>

	{#if animate}
		<div class='spacer top'></div>
		<div class="flex w-full h-fit text-center gap-20">
			<div class="flex-item p-8 text-left w-2/3 xl:text-9xl md:text-7xl sm:text-4xl" in:fly="{{ y: 300, duration: 1000 }}" out:fade="{{duration: 100}}">
				<h1>Buying Elections: Whose Money talks?</h1>
			</div>
			<div class="flex-item w-1/3 my-40 xl:text-3xl" in:fly="{{ y: 300, duration: 1000 }}" out:fade="{{duration: 100}}">
				<p>A look into the Political Action committees that fund our elections.</p>
				<div class='animate-bounce mt-12 text-right'>
					<a class="animate-bounce" href="/scroll">Click here to begin presentation</a>
				</div>
			</div>

		<div class='spacer'></div>
		</div>
	<div class='spacer'></div>
	{/if}
</section>