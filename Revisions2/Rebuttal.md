---
title: "Rebuttal"
fontfamily: fourier
linestretch: 1
fontsize: 10pt
output:
  pdf_document:
    latex_engine: xelatex
---


<!--
rmarkdown::render('./Revisions2/Rebuttal.md')
rmarkdown::render('./Revisions2/Rebuttal.md', 'word_document')
-->

<!--

TODO:
- [ ] At the end
  - [x] Add line numbers
  - [ ] Spell check
  - [ ] Check references

- [ ] Role of eDrivers in the analyses
  - [x] Paragraph in eDrivers section
  - [ ] Restructure repo and make it reproducible with eDrivers package
  - [ ] Maybe release a version of the package so that the paper will remain reproducible in the future
  - [ ] Write README.md to present the paper and provide links to zenodo archives
  - [ ] Document `eDrivers`
  - [ ] In development for `eDriversEx`
  - [ ] Transform everything to rasters

- [ ] Update bowler2019?
-->


<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
# Letter to the editor
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->

Dear Dr. Otto,

We are submitting a revised version of the manuscript “Next Generation Planning - Structuring and Sharing Environmental Drivers Data for the St. Lawrence System” (ID: 469411) for publication in Frontiers in Marine Science. After review, we now propose the following updated title for the manuscript: "*Characterizing Exposure to and Sharing Knowledge of Drivers of Environmental Change in the St. Lawrence System*". We would like to thank the reviewer for very constructive comments. We feel that we were able to address all the comments from the second reviewer and are now submitting an improved manuscript. Below, you will find our responses to the reviewer’s comments and how we have revised our manuscript in view of these.

We thank you for considering our revised manuscript and look forward to hearing back from you.

Best regards,

David Beauchesne


# Responses to the reviewer’s comments

<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
## Question 2
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->

***Please highlight the limitations and strengths***

***Comment 1:***

*I felt the manuscript was a bit disjointed. I find myself confused whether the eDrivers platform or characterizing cumulative exposures is the star of the manuscript. The abstract and title seem to imply that eDrivers is the focus but that is not the bulk of the body of the manuscript. As a matter of fact, section 5 of the manuscript which describes the eDrivers is mostly their rationale for developing the tool and does not even adequately address how the tool was used in the analysis.*

> - We thank the reviewer for pointing out this disconnect between title, abstract, and main text. Initial versions of this manuscript focused on *eDrivers*, but in the process of writing the focus shifted to characterizing cumulative exposure in the St. Lawrence, with the *eDrivers* initiative emerging from this process. This better reflects the process that led to the creation of the initiative. The title and abstract were, however, not modified accordingly. To address this we propose the following modification to the manuscript:

> 1. We propose an alternate title for the manuscript: *"Characterizing Exposure to and Sharing Knowledge of Drivers of Environmental Change in the St. Lawrence System"*.

> 2. We modified the abstract to mirror the structure of the paper and introduce the *eDrivers* initiative to conclude the abstract (Lines 53 to 56).

> 3. We modified the statement of the manuscript's objective at the end of the introduction (lines 132 to 147).

> - How *eDrivers* is used is not the focus of the manucript. As such, we would prefer not to expand extensively on this particular point in the main text body. We did, however, extend and conclude the section presenting the initiative with a short paragraph stating how the package was used for the analysis. We also provide a link to the github repository for this manuscript, which includes the code to reproduce all the analyses and figures. We also contextualize the rationale behind presenting Box 1 and removed reference to Box 1 from the results section. The goal of Box 1 is to introduce how the initiative and its accompanying tools can increase the ease with which holistic analyses can be performed with a simple coded and reproducible example (lines 508 to 513).


***Comment 2:***

*My other major criticism of this work is the loose use of terminology. While not explicitly using a DPSIR (Driver - Pressure- State - Impact - Response) framework, much of the cumulative impacts literature is familiar with this framework. Table 1 is actually a collage of drivers, pressures, and states. I also find it a stretch to characterize all of them as “environmental drivers” as many are definitely anthropogenic “drivers”. Another instance of loose terminology is actually pointed out by the authors where they use the term clusters in presenting methods but threat complexes when discussing results. I suggest the authors use one set of terminology throughout the manuscript to help the reader keep things straight.*

> - The reviewer is right about terminology issues: we loosely used certain terms such as *environmental drivers* in place of *drivers of environmental change*, and duplicated the terminology for other aspects of our work, such as *cumulative exposure regimes* and *threat complexes*; this awkwardly conveys our message. As such, we agree with the reviewer's comment and modified the manuscript to clarify the terminology used throughout the manuscript.

> - However, we avoided categorizing drivers of environmental change using the DPSIR framework. While the framework is widely used globally, it has numerous shortcomings (*e.g.* Gari et al. 2015, 10.1016/j.ocecoaman.2014.11.013). Namely, the difficulties in properly defining the components of the framework, the unclear classification of exogenic or natural drivers like climate change, and the context-dependencies of framework categories. For example, Dempsey et al. (2018; 10.1016/j.ecolind.2016.12.011) found it more useful to classify drivers of change as exogenic or endogenic (see Elliot et al. 2011, 10.1016/j.marpolbul.2010.11.033) because the indicators they used could be classified differently depending on the context or ecosystem in which they were studied. As an example, hypoxic environments may be considered a state if the goal is to study the impacts of climate change on ecosystems, or a pressure if the goal is to study the impacts of climate change on benthic communities. Furthermore, the DPSIR framework is used to structure initiatives that evaluate the chain of causal links between driving forces and responses (Kristensen et al. 2014, National Environmental Research Institute, Denmark). We do not do such an analyses; we rather focus on the exposure of natural systems to drivers, intentionally omitting valued components and their responses (see answers to reviewer 1). We do not dispute the usefulness of the DPSIR framework; it has provided clarity and guidance for many case studies both in terrestrial and marine ecosystems, and could be used with the data-based indicators that we provide through the *eDrivers* initiative. We simply wish to avoid generating further confusion by articulating our work around a specific framework, or forcing categories on our layers that may change depending on a user's objective. As such, we propose the following modifications to the manuscript:

> 1. We modified the definition in the introduction to: "*We broadly define drivers of environmental change (hereafter drivers) as any externality that affects environmental processes and disturbs natural systems*" (lines 84 to 87).

> 2. We added a paragraph at the beginning of the drivers section (3.1) providing more details on how the drivers of change we are providing are data-based indicators that may be viewed as drivers, pressures, stressors, or states depending on the context and objective: "*Drivers, as broadly defined in this study, are data-based indicators of environmental conditions and human activities that are often referred to as driving forces, stressors, pressures or states in the scientific and environmental assessment litterature (e.g. Kristensen, 2004; Halpern et al., 2019). Defining such categories, however, can be difficult and is often context- and ecosystem-specific (Gari et al., 2015; Dempsey et al., 2018). As such, we refrain from articulating our work around a specific framework or imposing categories on data-based products that may change with a user's objective. We rather focus on available data-based indicators that contribute to evaluating an ecosystem's cumulative exposure to multiple threats*" (lines 177 to 185).

> 3. We concluded the perspective paragraph presenting valued components by stating that interdisciplinary collections of knowledge could be used in a DPSIR framework to help in establishing causal relationship between drivers and valued ecosystem components: "*In turn, these could be used in conceptual frameworks that help in establishing causal relationships between drivers and valued ecosystem components such as the DPSIR (Driving forces -- Pressure -- State -- Impact -- Response) framework (Kristensen, 2004; Gari et al., 2015). Through such a framework, the data-based indicators provided through eDrivers could be categorized as driving forces, pressures or states, depending on the objective and context of a study*" lines 561 to 566).

> 4. We modified all instances of *environmental drivers* for *drivers of environmental change*

> 5. We removed all mentions of *threat complexes* and *cumulative exposure regimes* in favour of *cumulative exposure profiles*, which, we feel, better captures our intent without adding unecessary terms. We also refer to *threat complexes* identified through the clustering approach as clusters.



<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
## Question 3
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->

***Please provide your detailed review report to the editor and authors (including any comments on the Q4 Check List):***

*The manuscript 469411 entitled “Next Generation Planning - Structuring and Sharing Environmental Drivers Data for the St. Lawrence System” is a first cut at assessing the cumulative impacts of multiple “drivers” on a system. The authors provide an example of an analysis conducted through the collection of a massive amount of data through the development of an eDrivers platform. I applaud their efforts as I know that collecting large and often disparate data sets to conduct an assessment can be challenging. That being said, I felt the manuscript was a bit disjointed. I find myself confused whether the eDrivers platform or characterizing cumulative exposures is the star of the manuscript. The abstract and title seem to imply that eDrivers is the focus but that is not the bulk of the body of the manuscript. As a matter of fact, section 5 of the manuscript which describes the eDrivers is mostly their rationale for developing the tool and does not even adequately address how the tool was used in the analysis.*

> - See answer to question 2

*My other major criticism of this work is the loose use of terminology. While not explicitly using a DPSIR (Driver - Pressure- State - Impact - Response) framework, much of the cumulative impacts literature is familiar with this framework. Table 1 is actually a collage of drivers, pressures, and states. I also find it a stretch to characterize all of them as “environmental drivers” as many are definitely anthropogenic “drivers”. Another instance of loose terminology is actually pointed out by the authors where they use the term clusters in presenting methods but threat complexes when discussing results. I suggest the authors use one set of terminology throughout the manuscript to help the reader keep things straight.*

> - See answer to question 2


*Below are a few more specific comments:*


*Line 73 - How does the intensifying human footprint result in increasingly intricate environmental exposure regimes? I think this is confusing when you claim anthropogenic drivers as environmental drivers.*

> - We mean that the expanding and intensifying human footprint results in drivers of change increasingly overlapping at higher intensities, which in turns creates more intricate exposure regimes. We modified the terminology used throughout the manuscsript and do not refer to drivers as "environmental drivers" anymore. We rather use the expression "drivers of environmental change" (see answer to question 2 for more details). We also simplified this sentence to: *As a result, the St. Lawrence System is exposed to an increasing number of drivers of environmental change, as is observed across ecosystems globally (see Halpern et al., 2015b; Halpern et al., 2019)* (lines 79 to 84).



*Line 97 - The sentence “Describing drivers will therefore provide critical information on areas most exposed to drivers in the St. Lawrence.” does not make sense. Please clarify what you mean.*

> - We modified this sentence by: *While co-occurring drivers may not interact, driver co-occurrence is a requirement for interactions to exist. Knowledge of their co-distribution can therefore identify areas where driver interactions are most likely observed.* (lines 104 to 107).


*Line 124 - You never state an initial goal prior to this statement.*

> - We modified the statement of the objectives to address this issue (lines 132 to 147). See answer to question 2 for more details.


*Line 128 - Should your goal be to characterize the distribution and intensity of drivers with two objectives as stated starting on line 129?*

> - We now state: *Our main goal in this study is to characterize the distribution and intensity of drivers in the St. Lawrence. More specifically, our objectives are to: 1) identify areas of high cumulative exposure to drivers and 2) characterize areas with similar cumulative exposure profiles, i.e. areas exposed to similar suites of co-occurring drivers* (lines 135 to 138).



*Line 131 - Are cumulative exposure regimes the same as threat complexes described later in the manuscript?*

> - See answer to question 2.


*Section 3 - No mention of eDrivers or it’s role in the analysis.*

> - See answer to question 2.


*Line 142 - I’m not familiar with the St. Lawrence system. Is it simply called the Estuary or the Estuary of the St. Lawrence? I see it listed as Estuary on the map but there is no label for the Gulf of St. Lawrence.*

> - The proper names are the St. Lawrence Estuary and the Gulf of St. Lawrence. We modified the methods section title and text (line 150) and adjusted the map accordingly (see updated Figure 1).


*Line 172 - Is the reference Halpern et al. 2015 a or b?*

> - This reference refers to the data repository, hence Halpern et al. 2015. We are using the journal's reference style `.csl` file, which formats the references as presented in the manuscript. This is why there is no letter `a` after this reference. Frontiers website states: *"Frontiers referencing style will be applied during typesetting, and is dependent on the journal."* We therefore left the reference as is in the revised manuscript.

*Line 177 - The sentence “We selected global data . . . ” feels like it needs more context. Are you saying all drivers in Table 1 were unavailable at the regional scale?*

> - We mean that we used global datasets with sufficient resolution in instances where regional data on drivers were not available,. We modified the text to clarify this: *"Where regional data on drivers were unavailable, available global data at a resolution adequate for the scale of the St. Lawrence System were used instead (*e.g.* marine pollution)"* (lines 190 to 194).

*Line 192 - The figure of the hexagonal cells seems integral to the analysis and should be included in the main manuscript. Actually as I write this, I realize that the sentence reads 245k of 1 km2 hexagonal cells. My original reading was of much larger size cells. Perhaps rewording to say that the system was divided into a regular grid of 1 km2 hexagonal cells is sufficient. Also just an FYI that the hex cells are not shown in figure S2.*

> - We modified the text accordingly: *"The St. Lawrence System was divided into a regular grid of 1 $km^2$ cells in which all drivers were integrated (Figure S2)"* (lines 209 to 212).

> - As for the cells on figure S2, they are invisible due to the scale of the system. Showing cell borders hides fill colors, especially with so many maps shown on a single figure. We doubt whether it would be relevant to the manuscript, but, if requested, we could provde a finer scale view of the system and show the grid. Incidentally, we have since modified our grid for a grid with square cells, which allows us to work with rasters rather than vectorized polygons, which is more computationally efficient.


*Section 3.3 - I fail to see what this section and subsequent results add to the study.*

> - See answer to question 4

*Line 206 - I was confused by what objective 1 was and hence my comment on Line 128.*

> - We agree with this comment and have adjusted the statement of the objectives in the introduction accordingly (lines 135 to 138). Specific references to objectives in the text should now be clear.


*Line 226 - Don’t use different terms in different parts of the manuscript as that makes it difficult for the reader to follow.*

> - See answer to question 2.


*Line 272 - What is Box 1?*

> - The goal of Box 1 is to introduce how the *eDrivers* initiative and its accompanying tools can increase the ease with which holistic analyses can be performed. We removed reference to Box 1 from the results section and now introduce it in the perspective section. See answer to question 2 for more details.

*Section 4.1 - Does this fit with overall goal and objectives as stated in the intro?*

> - See answer to question 4



*Line 285 - Cumulative exposure is called footprints in figure caption.*

> - We modified the figure and the figure caption.


*Line 373 - What are the four guiding principles? I assume they are section 5.1 - 5.4 but it would not hurt to make that explicit.*

> - We modified the text accordingly (line 412).


*Section 5.2 - Is this a principle of principles?*

> - We are adopting a preexisting and unified set of principles dubbed as the FAIR Data Principles as one of our guiding principles. As this can indeed be confusing, we now state that we adopt the unified FAIR Data Principles as a set of subprinciples guiding our initiative (lines 463 to 465).


*Figure 1 - The figure and caption should be stand alone from the manuscript so it would be helpful to add contextual information presented in the text.*

> - We modified Figure 1 to show that the map presents the St. Lawrence and to clearly identify the Gulf of St. Lawrence and St. Lawrence Estuary. We also modified Figure 1's caption to provide a brief description of the Estuary and Gulf (see updated Figure 1 and accompanying caption).


*Figure 6 - What do you mean by night lights in the caption? Also, what do the dots mean? You can also make the diagram specific with the R packages and shiny app to which you are referring.*

> - Night lights referred to the raw data used for the coastal development driver layer. However, as these examples -- along with the acidification example -- do not confer any clarity to that figure, we simply removed them.

> - The dots were in fact two arrows that meant that those processes should be adaptive and iterative; these were unclear. We modified the figure to clarify it, and added an explanation in the figure caption.

> - As suggested, we made the figure specific to the tools and organizations presented in the manuscript.


*Table 1 - What do you mean by Lat/long spatial resolution? I think you mean point estimates or Lat/Lon. Also, what does Dissemination areas mean? I am also confused by what you mean with the 1981 - 2010 vs 2013 - 2017 under years. Is one of those sets the climatology you used? This should be explicit in the main manuscript even if it is explained further in the supplemental materials. Also, positive is spelled wrong for SBT+.*

> - The Lat/long resolution are either sampling coordinates or activity coordinates such as aquaculture or fishing. We modified "Lat/long" for "Lat/Lon" in the table.

> - Dissemination areas are the smallest standard geographic area in which census data, *i.e.* population count, are disseminated and they combine to cover all of Canada and their size and shape is highly variable. For example, their sizes range from 0.0003 to over 44000 $km^2$ in our study area. We modified the table to include this range by stating "Variable: < 1 to > 40000 $km^2$" and included this information in the Supplementary Material. We also indicated that methods and details for each driver are available in the supplementary materials.

> - The years 1981 to 2010 is the climatology used as a reference and 2013-2017 is the current period. We modified the table to clarify this by stating: "Climatology: 1980-2010; Current: 2013-2017"

> - We corrected the word "positive", thank you for identifying the error.


## Question 4

***Please comment on the methods, results and data interpretation. If there are any objective errors, or if the conclusions are not supported, you should detail your concerns.***

***Comment 1:***

*The abstract and title seem to imply that eDrivers is the focus but that is not the bulk of the body of the manuscript. As a matter of fact, section 5 of the manuscript which describes the eDrivers is mostly their rationale for developing the tool and does not even adequately address how the tool was used in the analysis.*

***Answer:***

> - See answer to question 2

***Comment 2:***

*I wonder is section 3.3 and it's corresponding results section 4.1 is necessary to address their overall goal and stated objectives.*

***Answer:***

> - In sections 3.3 and 4.1, we illustrated how a simple 2-driver case could be used to identify areas of such high relative intensity driver overlap. These sections provide an example that demonstrates how driver co-occurrence is evaluated; it should serve as a stepping stone to the integrative exposure indicators that we use after. As such, we believe that they offer valuable support in interpreting our results. However, we agree with the reviewer that these sections appear superfluous. We therefore modified the manuscript to better introduce this example:

> 1. We removed sections 3.3 and 4.1 and incorporated the example in the section on cumulative exposure (lines 221 to 225 and lines 310 to 318).

> 2. We now clearly state that this is an example provided for better clarity and that it serves as a stepping stone to the integrative indicators of exposure (lines 227 to 229).

> 3. We removed the discussion on species-specific responses to hypoxia and fisheries. We intentionally avoid discussing valued components throughout the manuscript to focus specificaly on drivers. Discussing species responses in presenting the simplified example undoubtedly contributed to the example feeling out of place.

> 4. We modified the figure caption to state that it is a simplified example.

> - Although we believe that the example is valuable, it does not address a specific objective, as rightfully identified by the reviewer. As such, if the reviewer still feels that the proposed changes are insufficient, we are willing to remove it entirely from the manuscript.
