<script>
	import TitleCard from '$lib/TitleCard.svelte'
	import { onMount } from 'svelte'
	import { fade } from 'svelte/transition'
	import Corrplot from '$lib/assets/Corrplot.png'
	import data from './only_ran.js'
	import BarChart from '$lib/BarChart.svelte'
	import Scrolly from '$lib/Scrolly.svelte'
	import PackedBubbles from '$lib/PackedBubbles.svelte'

	let value = 0

	export let steps = [
		{
			text: "If you're unfamiliar with Political Action Committees, you can think of them as banks for politicians. Their ability to raise money in order to endorse their preferred candidates is often insurmountable when fundraising against them, making it difficult for grassroots movements to gain support.",
		},
		{
			text: 'Political Action Committees funded 260 Senate Candidates who either ran for office in 2022 or plan to seek office in a future election. In total, these committees tallied over $104,580,122 in contributions.',
		},
		{
			text: "By far, the top contributions came from party leadership PACs. Both Nancy Pelosi and Mitt Romney's Super PACs were in the top spending PACs in 2022. Combined, Leadership PACs made up 51% of single-issue contributions.",
		},
	]

	export let steps2 = [
		{
			text: 'Outside of Leadership PACs headed by top U.S. Lawmakers, Pro-Israel and Environmental committees have the most money to spare candidates, having contributed $9,941,524 to just a handful of candidates last year.',
		},
		{
			text: 'The graphic to the right shows a correlation chart based on the amount of influence a PAC has on the number of votes a candidate may receive in a given election. The larger and bluer the circle is, the more correlation there is between a win and a loss.',
		},
	]

	export let steps3 = [
		{
			text: 'In cases where Party Leadership PACs strongly backed a candidate and outspent their counterparts, those candidates typically won. Some high profile candidates include Rapahel Warnock, Maggie Hassan, and Ron Johnson, who were all involved in highly contested battlegrounds.',
		},
		{
			text: "However, despite there being a number of high-profile races, some sitting senators received more donations in a non-election year. They won't show up on the chart to the left, but you can see which candidates took the most PAC money last year for future reference.",
		},
	]
</script>

<section>
	<div class="section-container justify-center">
		<div class="sticky mt-72 w-60 p-10">
			<img
				in:fade={{ duration: 700, delay: 250 }}
				out:fade={{ duration: 100 }}
				class="h-4/5 w-4/5 shadow-md shadow-slate-800"
				src="https://www.brennancenter.org/sites/default/files/styles/campaign_750x560_small_1x/public/2019-10/L4_HR1_LincolnAgnew_1400x800_new_0.jpg?itok=r5q5f_Ze"
				alt="Election money hands" />
		</div>
		<div class="steps-container mt-40 w-1/3">
			<Scrolly bind:value>
				{#each steps as step, i}
					<div class="step" class:active={value === i}>
						<TitleCard
							content="<p style='color: white; font-style: normal; font-weight: 700; font-family: 'sharik-sans', sans-serif; text-decoration: solid; text-shadow: 1px 1px black;>{step.text}</p>" />
					</div>
				{/each}
			</Scrolly>
		</div>
	</div>
</section>
<section>
	<div
		class="section-container justify-center"
		in:fade={{ duration: 500, delay: 250 }}>
		<div class="steps-container mx-16 w-1/3 text-left">
			<Scrolly bind:value>
				{#each steps2 as step, i}
					<div class="step" class:active={value === i}>
						<TitleCard
							content="<p style='color: white; font-style: normal; font-weight: 700; font-family: 'sharik-sans', sans-serif; text-decoration: solid; text-shadow: 1px 1px black;>{step.text}</p>" />
					</div>
				{/each}
			</Scrolly>
		</div>
		<div class="sticky mb-40 mt-40 w-60 p-10">
			<img
				in:fade={{ duration: 500, delay: 250 }}
				out:fade={{ duration: 100 }}
				class="w-4/5"
				src={Corrplot}
				alt="A correlation matrix showing which industries have the most impact on voting." />
		</div>
	</div>
</section>
<section>
	<div class="section-container justify-center">
		<div
			class="sticky top-10 my-20 ml-0 mr-10 mt-0"
			in:fade={{ duration: 1500, delay: 250 }}>
			<BarChart {data} />
		</div>
		<div class="steps-container w-1/5">
			<Scrolly bind:value>
				{#each steps3 as step, i}
					<div class="step" class:active={value === i}>
						<TitleCard
							content="<p style='color: white; font-style: normal; font-weight: 700; font-family: 'sharik-sans', sans-serif; text-decoration: solid; text-shadow: 1px 1px black;>{step.text}</p>" />
					</div>
				{/each}
			</Scrolly>
		</div>
	</div>
</section>

<section>
	<div class="section-container justify-center">
		<div class="sticky top-10 mx-auto w-full">
			<PackedBubbles />
		</div>
	</div>
</section>

<div class="hero">
	<h2 class="text-9xl">Thank you for reading!</h2>
</div>

<style lang="postcss">
	img {
		border-radius: 2.5rem;
	}
</style>
