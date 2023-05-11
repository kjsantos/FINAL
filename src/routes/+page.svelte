<script>
	import { fly, fade } from 'svelte/transition'
	import { onMount } from 'svelte'
	let animate = false

	onMount(() => {
		animate = true
	})
</script>

<svelte:head>
	<title>Home</title>
	<link rel="stylesheet" href="https://use.typekit.net/vnt8kss.css" />
</svelte:head>

<section>
	{#if animate}
		<div class="spacer top" />
		<div class="flex h-fit w-full gap-20 text-center">
			<div
				class="flex-item w-2/3 p-10 text-left sm:text-4xl md:text-7xl xl:text-9xl"
				in:fly={{ y: 300, duration: 1000 }}
				out:fade={{ duration: 1000 }}>
				<h1>Paying it Forward: Whose Money Talks?</h1>
			</div>
			<div
				class="flex-item w-1/3 pt-72 xl:text-3xl"
				in:fly={{ y: 300, duration: 1000 }}
				out:fade={{ duration: 1000 }}>
				<p>
					A close look into the Political Action Committees that
					funded the 2022 midterm elections.
				</p>
				<div class="mt-20 animate-bounce text-right text-white">
					<a class="animate-bounce" href="/scrollyteller"
						>Click here to begin presentation &rarr;</a>
				</div>
			</div>

			<div class="spacer" />
		</div>
		<div class="spacer" />
	{/if}
</section>
