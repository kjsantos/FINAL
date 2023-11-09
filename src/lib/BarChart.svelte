<script>
	import { scaleBand, scaleLinear } from 'd3-scale'
	import { init_binding_group } from 'svelte/internal'
	export let data

	const width = 1000
	const height = 824

	const margin = { top: 10, right: 30, bottom: 100, left: 120 }
	const innerHeight = height - margin.top - margin.bottom
	const innerWidth = width - margin.left - margin.right

	$: yDomain = data.map((d) => +d.total_donations)
	$: xDomain = data.map((d) => d.lname)

	$: xScale = scaleLinear()
		.domain([0, Math.max.apply(null, yDomain)])
		.range([0, innerWidth])
	$: yScale = scaleBand().domain(xDomain).range([0, innerHeight]).padding(0.1)
</script>

<svg {width} {height}>
	<g transform={`translate(${margin.left},${margin.top})`}>
		{#each xScale.ticks() as tickValue}
			<g transform={`translate(${xScale(tickValue)},0)`}>
				<line y2={innerHeight} stroke="gray" />
				<text
					text-anchor="middle"
					dy=".71em"
					y={innerHeight + 3}
					fill="lightgray">
					{#if tickValue % 1000000 == 0 && tickValue != 0}
						${tickValue / 1000000}m
					{/if}
				</text>
			</g>
		{/each}
		{#each data as d}
			<text
				text-anchor="end"
				x="-3"
				dy=".22em"
				y={yScale(d.lname) + yScale.bandwidth() / 2}
				fill="white"
				stroke="slate">
				{d.lname}
			</text>
			{#if d.in_office == 0}
				<rect
					x="0"
					y={yScale(d.lname)}
					width={xScale(d.total_donations)}
					height={yScale.bandwidth()}
					fill="gray"
					stroke="black" />
			{:else}
				<rect
					x="0"
					y={yScale(d.lname)}
					width={xScale(d.total_donations)}
					height={yScale.bandwidth()}
					fill="steelblue"
					stroke="black" />
			{/if}
		{/each}
	</g>
	<text
		class="sub"
		x={innerWidth / 2 + margin.left}
		dy=".71em"
		y={innerHeight + 35}
		fill="white"
		text-anchor="middle"
		font-size="14px"
		font-weight="bold">Total Donations in Millions</text>
</svg>

<style lang="postcss">
	:global(text) {
		color: white;
		font-style: normal;
		font-weight: 300;
		font-family: 'sharik-sans', sans-serif;
		font-size: small;
	}
</style>
