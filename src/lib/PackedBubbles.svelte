<script lang="ts">
	import { onMount } from 'svelte'
	import * as d3 from 'd3'
	import { afterUpdate } from 'svelte'
	import type { Candidate } from './types.ts'
	import data from './only_ran.js'
	let selectedColumn = 'total_donations' // Default selected column
	let visualData = []

	const columns = [
		'total_donations',
		'anti_abortion',
		'pro_abortion_rights',
		'candidate_committees',
		'democratic_candidate_committees',
		'democratic_leadership_pac',
		'democratic',
		'environment',
		'foreign_defense_policy',
		'gun_control',
		'gun_rights',
		'human_rights',
		'leadership_pacs',
		'lgbtqia_rights',
		'pro_israel',
		'republican_candidate_committees',
		'republican_leadership_pac',
		'republican',
		'womens_issues',
		'in_office',
		'votes',
	]

	let svg: any
	let hierarchy: any
	let root: any
	let node: any

	onMount(() => {
		const margin = { top: 10, right: 10, bottom: 10, left: 10 }
		const width = 800 - margin.left - margin.right
		const height = 600 - margin.top - margin.bottom

		// Create a D3 SVG container
		svg = d3
			.select('#packed-bubble-chart')
			.append('svg')
			.attr('width', width + margin.left + margin.right)
			.attr('height', height + margin.top + margin.bottom)
			.append('g')
			.attr('transform', `translate(${margin.left},${margin.top})`)

		// Initialize the visualization
		initializeVisualization()

		// Watch for changes in the selectedColumn variable
		afterUpdate(() => {
			updateVisualization()
		})
	})

	// Function to initialize the visualization
	function initializeVisualization() {
		// Flatten the data and specify types explicitly
		const flattenedData = data.map((d: any) => ({
			id: d.id,
			fname: d.fname,
			lname: d.lname,
			total_donations: +d.total_donations,
			anti_abortion: +d.anti_abortion,
			pro_abortion_rights: +d.pro_abortion_rights,
			candidate_committees: +d.candidate_committees,
			democratic_candidate_committees: +d.democratic_candidate_committees,
			democratic_leadership_pac: +d.democratic_leadership_pac,
			democratic: +d.democratic,
			environment: +d.environment,
			foreign_defense_policy: +d.foreign_defense_policy,
			gun_control: +d.gun_control,
			gun_rights: +d.gun_rights,
			human_rights: +d.human_rights,
			leadership_pacs: +d.leadership_pacs,
			lgbtqia_rights: +d.lgbtqia_rights,
			pro_israel: +d.pro_israel,
			republican_candidate_committees: +d.republican_candidate_committees,
			republican_leadership_pac: +d.republican_leadership_pac,
			republican: +d.republican,
			womens_issues: +d.womens_issues,
			in_office: +d.in_office,
			votes: +d.votes,
		}))

		// Create a hierarchy with your data
		hierarchy = d3.hierarchy({ children: flattenedData })
		updateVisualization()
	}

	// Function to update the visualization based on the selected column
	function updateVisualization() {
		// Apply the pack layout to the hierarchy
		root = d3.pack().size([800, 600]).padding(3)(
			hierarchy.sum((d: any) => d.data[selectedColumn])
		)

		// Remove the previous visualization
		svg.selectAll('*').remove()

		// Create circles for the packed bubble chart
		node = svg
			.selectAll('.node')
			.data(root.descendants().slice(1)) // Remove the first element, which is the root
			.enter()
			.append('g')
			.attr('class', (d: any) => 'node' + (!d.children ? ' leaf' : ''))
			.attr('transform', (d: any) => `translate(${d.x},${d.y})`)

		node.append('circle')
			.attr('r', (d: any) => d.r)
			.style('fill', 'steelblue')
			.on('mouseover', handleMouseOver) // Add mouseover event

		// Add text labels for each bubble
		node.append('text')
			.text((d: any) => d.data.lname) // Update the label based on the selected column
			.attr('dy', '0.3em')
			.style('text-anchor', 'middle')
			.style('font-size', (d: any) => d.r / 5 + 'px')
	}

	// Function to show tooltip on mouseover
	function handleMouseOver(d: any) {
		const x = d.x + d.r
		const y = d.y + d.r
		const tooltip = d3.select('#tooltip')
		tooltip
			.style('left', x + 'px')
			.style('top', y + 'px')
			.style('display', 'block')
			.html(
				`Name: ${d.data.fname} ${d.data.lname}<br>${selectedColumn}: ${d.data[selectedColumn]}`
			)
	}

	// Function to hide tooltip on mouseout
	function handleMouseOut() {
		const tooltip = d3.select('#tooltip')
		tooltip.style('display', 'none')
	}
</script>

<!-- Dropdown selector for column totals -->
<select bind:value={selectedColumn}>
	{#each columns as column}
		<option value={column}>{column}</option>
	{/each}
</select>

<div id="packed-bubble-chart" />

<!-- Tooltip element -->
<div
	id="tooltip"
	style="position: absolute; display: none; background: white; padding: 10px; border: 1px solid #ccc;" />
