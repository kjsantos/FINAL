// types.ts
export interface Candidate {
	children: {
		id: string
		lname: string
		fname: string
		total_donations: number
	}[]
}
