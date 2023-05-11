<script>
	import TitleCard from './TitleCard.svelte'
	import Scrolly from './Scrolly.svelte'
	import { onMount } from 'svelte'
	import { spring } from 'svelte/motion'
	import { fade, fly } from 'svelte/transition'
	import Plotlytest from './Plotlytest.svelte'
	import Corrplot from '$lib/assets/Corrplot.png'
	import { each } from 'svelte/internal'
	import data from './only_ran.js'
	import BarChart from './BarChart.svelte'

	/**
	 * @type {number | undefined}
	 */
	let value

	onMount(() => {
		let value = 0
		let data = []
	})
	export let steps = [
		"<p style='color: white; font-style: normal; font-weight: 700; font-family: 'sharik-sans', sans-serif; text-decoration: solid; text-shadow: 1px 1px black;>If you're unfamiliar with Political Action Committees, you can think of them as banks for politicians. Their ability to raise money in order to endorse their preferred candidates is often insurmountable when fundraising against them, making it difficult for grassroots movements to gain support.</p>",
		"<p style='color: white; font-style: normal; font-weight: 700; font-family: 'sharik-sans', sans-serif; text-decoration: solid; text-shadow: 1px 1px black;>Political Action Committees funded 260 Senate Candidates who either ran for office in 2022 or plan to seek office in a future election. In total, these committees tallied over $104,580,122 in contributions. </p>",
		"<p style='color: white; font-style: normal; font-weight: 700; font-family: 'sharik-sans', sans-serif; text-decoration: solid; text-shadow: 1px 1px black;>By far, the top contributions came from party leadership PACs. Both Nancy Pelosi and Mitt Romney's Super PACs were in the top spending PACs in 2022. Combined, Leadership PACs made up 51% of single-issue contributions</p>",
	]
	export let steps2 = [
		"<p style='color: white; font-style: normal; font-weight: 700; font-family: 'sharik-sans', sans-serif; text-decoration: solid; text-align: left; text-shadow: 1px 1px black;>Outside of Leadership PACs headed by top U.S. Senators, Pro-Israel and Environmental committees have had the most influence, having contributed $9,941,524 to candidates</p>",
		"<p style='color: white; font-style: normal; font-weight: 700; font-family: 'sharik-sans', sans-serif; text-decoration: solid; text-align: left; text-shadow: 1px 1px black;>The graphic to the right shows a correlation chart based on the amount of influence a PAC has on the number of votes a candidate may receive in a given election. The larger and bluer the circle is, the more correlation there is between a win and a loss</p>",
	]
	export let steps3 = [
		"<p style='color: white; font-style: normal; font-weight: 700; font-family: 'sharik-sans', sans-serif; text-decoration: solid; text-align: left; text-shadow: 1px 1px black;>In cases where Party Leadership PACs strongly backed a candidate and outspent their counterparts, those candidates typically won. Some high profile candidates include Rapahel Warnock, Maggie Hassan, and Ron Johnson, who were all involved in highly contested battlegrounds. </p>",
		"<p style='color: white; font-style: normal; font-weight: 700; font-family: 'sharik-sans', sans-serif; text-decoration: solid; text-align: left; text-shadow: 1px 1px black;> However, despite there being a number of high-profile races, some sitting senators received more donations in a non-election year. They won't show up on the chart to the left, but you can see which candidates took the most PAC money last year for future reference.",
	]
</script>

<svelte:head>
	<script
		src="https://cdn.plot.ly/plotly-latest.min.js"
		type="text/javascript"></script>
</svelte:head>

<section>
	<div class="section-container justify-center">
		<div class=" sticky mt-72 w-60 p-10">
			{#if value === 0}
				<img
					in:fade={{ duration: 700, delay: 250 }}
					out:fade={{ duration: 100 }}
					class="h-4/5 w-4/5 shadow-md shadow-slate-800"
					src="https://www.brennancenter.org/sites/default/files/styles/campaign_750x560_small_1x/public/2019-10/L4_HR1_LincolnAgnew_1400x800_new_0.jpg?itok=r5q5f_Ze"
					alt="Election money hands" />
			{:else if value == 2}
				<img
					in:fade={{ duration: 700, delay: 250 }}
					out:fade={{ duration: 200 }}
					class="h-4/5 w-4/5 shadow-md shadow-slate-800"
					src="https://www.sltrib.com/resizer/GWRizXvj44O_DU-cCB3kkNRsRDI=/1024x650/arc-anglerfish-arc2-prod-sltrib.s3.amazonaws.com/public/UZPXQHRNQJCNFNNCMOKW7LJERM.jpg"
					alt="Nancy Pelosi and Mitt Romney head two of the top Political Super PACs in the country." />
			{/if}
		</div>
		<div class="steps-container mt-40 w-1/3">
			<Scrolly this:container bind:value>
				{#each steps as text, i}
					<div class="step" class:active={value === i}>
						<TitleCard content={text} />
					</div>
				{/each}
				<div class="spacer" />
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
				{#each steps2 as text, i}
					<div
						in:fade={{ duration: 500, delay: 250 }}
						class="step"
						class:active={value === i}>
						<TitleCard content={text} />
					</div>
				{/each}
				<div class="spacer" />
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
			class="sticky my-4 ml-0 mr-10 mt-0"
			in:fade={{ duration: 1500, delay: 250 }}>
			<BarChart {data} />
		</div>
		<div class="steps-container w-1/5">
			<Scrolly bind:value>
				{#each steps3 as text, i}
					<div class="step" class:active={value === i}>
						<TitleCard content={text} />
					</div>
				{/each}
				<div class="spacer" />
			</Scrolly>
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
