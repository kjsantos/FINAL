<script lang="ts">
	import { onMount } from 'svelte'
	import { fade, fly } from 'svelte/transition'
	import { spring } from 'svelte/motion'
	let animate = false
	export let content = 'blah blah blah'

	onMount(() => {
		animate = true
	})
</script>

<svelte:head>
	<script
		src="https://cdn.plot.ly/plotly-latest.min.js"
		type="text/javascript"></script>
</svelte:head>

<main>
	{#if animate}
		<div
			class="container my-10 flex w-5/6 justify-end rounded-2xl bg-neutral-800 shadow-2xl shadow-slate-800">
			<div class="container flex justify-center">
				<div
					class="flex-column p-5 text-right text-3xl"
					in:fly={{ y: 80, duration: 1500, delay: 250 }}
					out:fade={{ duration: 50 }}>
					{@html content}
				</div>
			</div>
		</div>
	{/if}
</main>
