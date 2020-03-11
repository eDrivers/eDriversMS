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
rmarkdown::render('./Revisions/Rebuttal.md')
rmarkdown::render('./Revisions/Rebuttal.md', 'word_document')
-->


<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
# Letter to the editor
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->

Dear Dr. Otto,

We are submitting a revised version of the manuscript “Next Generation Planning - Structuring and Sharing Environmental Drivers Data for the St. Lawrence System” (ID: 469411) for publication in Frontiers in Marine Science. We would like to thank the reviewer for very constructive comments. We feel that we were able to address all the comments and are now submitting an improved manuscript. Below, you will find our responses to the reviewer’s comments and how we have revised our manuscript in view of these.

We thank you for considering our revised manuscript and look forward to hearing back from you.

Best regards,

David Beauchesne


# Responses to the reviewer’s comments

<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
## Question 1
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->

***Please summarize the main findings of the study***

*This article presents 22 environmental drivers and uses these environmental drivers to identify areas of high cumulative exposure and characterize areas with similar cumulative exposure in the St. Lawrence System. In particular, the article introduces an open knowledge platform named eDrivers, though it doesn’t seem to be working at this moment (https://github.com/eDrivers - this site contains zero repositories, zero people, zero projects; the R package eDrivers is not available on CRAN). When this R package and the website become available, I believe the article and its related sources will be beneficial to the scientific and management communities. Despite its weaknesses (shown below), I believe this work is a good start for assessing and managing cumulative effects in the St. Lawrence System and can serve as a good example for other marine ecosystems.*

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
**Answer:**

> - The material has yet to be released publicly on GitHub as we were waiting for the review process to be completed. We can, however, provide access to the repositories for the review process if the reviewer wishes to review the contents.

> - As for the package and the data, it will be available on Github, but we will not release a version on CRAN just yet. The material is not yet implemented on the St. Lawrence Global Observatory (SLGO; https://ogsl.ca/en) servers (our partners on this project) and the data are currently embedded directly in the R package. Our goal is to publish the package and submit it for peer-review once the data are available and accessible through SLGO's API.

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->


<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
## Question 2
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->

***Please highlight the limitations and strengths***

*Weaknesses (and potential solutions) are listed below:*

***Comment 1:***

*Authors need to make it clear up in the front that this work is only focusing on one of the four elements required to evaluate environmental impacts. Besides moving Lines 119-122 to around Line 77, it will be helpful to introduce the best practices in cumulative effects assessment and management: (1) selecting valued (ecosystem) components, (2) selecting indicators, (3) setting temporal and spatial scales, (4) addressing uncertainties, and (5) public participation. It will also be helpful to differentiate the two different indicators: effects-based and stressor-based. Effects-based indicators are direct measurements of the valued components (such as species abundance, biodiversity, etc.) and inherently encompass cumulative effects of multiple drivers. However, because of the poorly understood cause-effect linkages between stressors and valued components, it is currently hard to be used for decision-making. In comparison, stressor-based indicators (i.e., driver-based as this article defines and the type that this article uses) are usually better understood and can be proactively linked to management actions. However, these indicators do not capture the effects of all stressors and are not able to discern non-additive cumulative effects (e.g. synergism, antagonism). This point leads to the next weakness of this article.*


<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
***Answer:***

> - We agree with the reviewer about the importance of clearly stating that this manuscript solely focuses on drivers. The goal of this manuscript and the eDrivers initiative is to facilitate the widespread accessibility of such data for environmental assessments and integrative management. We believe that we are clearly stating that the goal of our manuscript is focused on a single element of a fully operational impact assessment given the title of the manuscript and the 3rd sentence of the abstract: “Our objective in this paper is to systematically characterize the distribution and intensity of drivers in the St. Lawrence System.” (lines 38-39). Our goal is not to address cumulative effects. It is rather to provide knowledge on an element common to most holistic approaches, i.e. drivers characterization. We strived to make this as clear as possible throughout the manuscript, namely in the introduction and in the perspectives sections, as noted by the reviewer. As such, and considering the focus of the manuscript, we are hesitant to accept the reviewer’s suggestion to discuss cumulative effect assessment, best practices and indicator types at the beginning of the introduction. We feel that, considering the objective of this manuscript, the beginning of the introduction should focus specifically on drivers.

> - We, nonetheless, agree with the reviewer’s suggestions and agree that a broader context is necessary to properly position our manuscript in the environmental assessment literature. We are, therefore, proposing the following modifications to the manuscript, as we hope that these will consolidate the essence of the suggestions made by the reviewer:

  > 1. We modified the introduction to broadly state the major steps that are generally undertaken in holistic environmental approaches (lines 101-105).

  > 2. We modified the statement of the objectives that appears at the end of the introduction to clearly state that we are specifically focusing on drivers (lines 130-136).

  > 3. We modified the paragraph in the perspective sections (lines 496-518) in which the importance of valued components is discussed. It now presents eDrivers as a suite of useful, stressor-based indicators that, nevertheless,  fail to capture effects on valued components and non-additive effects. We present effects-based indicators and discuss their importance for understanding cumulative effects. We then argue that both are required to properly diagnose and attribute causes of ecosystem change to stressors (Dubé 2003, Environmental Impact Assessment Review 23(6):723-745; Jones 2016, Environmental Reviews 24(2):187-204).


<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->

***Comment 2:***

*Because of this inherent weakness of stressor-based indicators, the dealing and conclusion of this article related to driver interactions (Sections 3.4 and 4.2) are inadequate. How different stressors (or drivers) interact to create nonlinear, non-additive cumulative effects are dependent on a specific valued component of interest. This article simply assumes the summed intensity of two drivers as interactions, which is inaccurate and misleading. Consequently, the results based on the two drivers (hypoxia and fisheries) are not convincing (Section 4.2). How to create indicators that truly reflect negative impacts is essential and can be specific to a specific value component. For instance, temperature positive anomalies may have negative impact on certain species, it may not necessarily degrade ecosystem production. While the calculation of drivers intensity in Appendix is only one way of doing it, it is important for the computer package to provide users with flexibility to define their own indicators (i.e., one potential solution to the weakness).*

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
***Answer:***

> - We thank the reviewer for pointing out this obvious weakness of the manuscript. We now realize that, even though we did not want to mislead readers in thinking we were evaluating driver interactions, we were doing just that. As noted by the reviewer, driver co-occurrence provides no information on valued component-specific driver interactions and non-additive effects. That said, driver co-occurrence is necessary for interactions to exist, and therefore it is expected that interactions and non-additive effects will be most likely observed in areas where drivers overlap at high relative intensities. These areas delineate where the effects of both drivers are most likely to impact valued components simultaneously. In sections 3.4 and 4.2, we illustrate how a simple two-drivers case could be used to identify areas of such high relative intensity driver overlap. This example should serve as a stepping stone to the integrative cumulative footprint and hotspot indicators. As rightfully noted by the reviewer, however, the manuscript is misleading on the topic of driver interactions. We have therefore made the following modifications to the manuscript:

  > 1. We removed objective 2 from the manuscript and mentions of driver interactions, except in the context of discussing the likelihood of observing interactions in areas of driver co-occurrence.

  > 2. The methodology and results/discussions sections on driver interactions were moved to sections 3.3 and 4.1, respectively, and renamed Driver co-occurrence. We then modified the methods section and provided a simplified example of driver co-occurrence (lines 194-204). We did not, however, modify the results/discussion section. The only mention of driver interactions was in the title itself. In the discussion, we merely discuss the areas of high intensity of driver co-occurrence and describe individual and combined adverse effects that these drivers may have on species.

  > 3. We clarified our stance on driver co-occurrence and risk of interactions in the introduction, noting that individual and interactive effects of both drivers are species- and community-dependent and that the co-occurrence of drivers in itself is not evidence of driver interaction. We then state that, assuming driver co-occurrence is a prerequisite for driver interactions, it expected that interactions will occur in areas where both drivers co-occur simultaneoustly (lines 93-96).

> - Ultimately, this portion of the manuscript should serve as a simple illustration to better understand the complete cumulative footprint indicators. In this sense, if the reviewer still feels that the proposed changes are insufficient, we are willing to remove these sections from the manuscript.

> - As for providing flexibility in indicator definition, it is a feature that we wish to provide in future iterations of the package and platform. We would, however, rather not include such enhancements in this manuscript, as they are more technical in nature and we feel that they should not prevent us from publishing this work. Instead, we present this idea as a perspective and of future work (lines 524-526), as suggested by the reviewer.

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->

***Comment 3:***

*Because of the paramount importance of defining valued components in the process of cumulative effects assessment and management, the absence of this element is the third weakness of this article. This weakness can potentially be overcome by adding “Future work”. In the future, similar work can be carried out to select and mapping valued components, which will allow explicit linkages between drivers and value components to be explored for better understanding cumulative effects.*

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
***Answer:***

> - We agree with the reviewer on the importance of valued components for cumulative effects assessments. Presenting a full cumulative impact assessment and defining valued components are, however, not the objectives of this manuscript or of the platform, nor is it to discuss cumulative impacts in particular. By themselves, we believe stressor-based indicators offer valuable insights into the dynamics of a system which can help managers to prioritize decision-making and scientists in target specific areas for in situ measurements for hypothesis testing, especially when data on valued components are lacking. Furthermore, the choices of valued components are fully dependent on the objective of a particular assessment or management scheme. In our experience, time and money are spent on recurring initiatives that seek to characterize sources of stress in a system for impacts assessments and integrative management. Our goal was therefore to build an initiative that would curb this approach and provide access to formatted and comparable knowledge on sources of stress that are typically used for impact assessments and integrative management. This integrative dataset can then be used and adapted to the need of a user to assess impacts on a single or multiple valued components of interest, or the user can identify gaps in knowledge in the platform and ultimately contribute to the knowledge contained in the platform. We were therefore very deliberate in our decision not to include and discuss specific valued components. This manuscript is part of a broader project that aims at evaluating cumulative impact on the ecological communities of the St. Lawrence. The description of drivers will thus be used on specific valued components in the St. Lawrence System.

> - We already had included a paragraph on the importance of valued components and their vulnerability to sources of stress. We now realize, however, that it was ineffectual to provide perspective and direction as to how eDrivers may be used in the future. We therefore extended this paragraph, also in response to the reviewer’s first comment, to better address the significance of valued components and the different types of indicators used for cumulative effects assessment (lines 496-518).

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->

<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
## Question 3
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->

***Please provide your detailed review report to the editor and authors (including any comments on the Q4 Check List):***

*This article is generally well written, presenting 22 environmental drivers. It uses these environmental drivers to identify areas of high cumulative exposure and characterize areas with similar cumulative exposure in the St. Lawrence System. In particular, the article introduces an open knowledge platform named eDrivers, though it doesn’t seem to be working at this moment (https://github.com/eDrivers - this site contains zero repositories, zero people, zero projects; the R package eDrivers is not available on CRAN). When this R package and the website become available, I believe the article and its related sources will be beneficial to the scientific and management communities. Despite its weaknesses (shown below), I believe this work is a good start for assessing and managing cumulative effects in the St. Lawrence System and can serve as a good example for other marine ecosystems.*

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
***Answer:***

> - See answer to question 1
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->

*Weaknesses (and potential solutions) are listed below:*

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
***Comment 1:***

*Authors need to make it clear up in the front that this work is only focusing on one of the four elements required to evaluate environmental impacts. Besides moving Lines 119-122 to around Line 77, it will be helpful to introduce the best practices in cumulative effects assessment and management: (1) selecting valued (ecosystem) components, (2) selecting indicators, (3) setting temporal and spatial scales, (4) addressing uncertainties, and (5) public participation. It will also be helpful to differentiate the two different indicators: effects-based and stressor-based. Effects-based indicators are direct measurements of the valued components (such as species abundance, biodiversity, etc.) and inherently encompass cumulative effects of multiple drivers. However, because of the poorly understood cause-effect linkages between stressors and valued components, it is currently hard to be used for decision-making. In comparison, stressor-based indicators (i.e., driver-based as this article defines and the type that this article uses) are usually better understood and can be proactively linked to management actions. However, these indicators do not capture the effects of all stressors and are not able to discern non-additive cumulative effects (e.g. synergism, antagonism). This point leads to the next weakness of this article.*

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
***Answer:***

> - See answer to question 2
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->

***Comment 2:***

*Because of this inherent weakness of stressor-based indicators, the dealing and conclusion of this article related to driver interactions (Sections 3.4 and 4.2) are inadequate. How different stressors (or drivers) interact to create nonlinear, non-additive cumulative effects are dependent on a specific valued component of interest. This article simply assumes the summed intensity of two drivers as interactions, which is inaccurate and misleading. Consequently, the results based on the two drivers (hypoxia and fisheries) are not convincing (Section 4.2). How to create indicators that truly reflect negative impacts is essential and can be specific to a specific value component. For instance, temperature positive anomalies may have negative impact on certain species, it may not necessarily degrade ecosystem production. While the calculation of drivers intensity in Appendix is only one way of doing it, it is important for the computer package to provide users with flexibility to define their own indicators (i.e., one potential solution to the weakness).*

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
***Answer:***

> - See answer to question 2
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->

***Comment 3:***

*Because of the paramount importance of defining valued components in the process of cumulative effects assessment and management, the absence of this element is the third weakness of this article. This weakness can potentially be overcome by adding “Future work”. In the future, similar work can be carried out to select and mapping valued components, which will allow explicit linkages between drivers and value components to be explored for better understanding cumulative effects.*

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
***Answer:***

> - See answer to question 2
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->

*Comment on the methods, results and data interpretation: The method on dealing with driver interactions is inadequate, and the resultant conclusions with regard to interactions are not convincing.*

***Answer:***

> - See answer to question 2




***Minor comments:***

*Line 229: add “on” before the analysis.*

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
> - This was modified in the text.
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->

*Lines 327-328: fix language issue.*

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
> - We have modified the sentences on lines 327-328 (now lines 348-352). "Of particular concern are threat complexes 3 and 6, which are the two most exposed complexes in the St. Lawrence and are characterized by distinct cumulative exposure regimes between them, they capture most of the coastal and offshore hotspots identified in the St. Lawrence." now becomes "Threat complexes 3 and 6 capture most of the coastal and offshore hotspots and are the two most exposed complexes in the St. Lawrence."
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->

*Figure 5 caption: tp becomes to*

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
> - The figure caption was modified accordingly.
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->

*Please check Appendix carefully for language errors. In addition, Appendix can be tightened up.*

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
> - We have performed a thorough review of the material presented in the Appendix.

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->


<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
## Question 4
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->

***Please comment on the methods, results and data interpretation. If there are any objective errors, or if the conclusions are not supported, you should detail your concerns.***

*The method on dealing with driver interactions is inadequate, and the resultant conclusions with regard to interactions are not convincing.*

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
***Answer:***

> - See answer to question 2
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->

<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->
## Question 5
<!-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= -->

*Is the English language of sufficient quality?
- Yes*

*Is the quality of the figures and tables satisfactory?
- Yes*

*Does the reference list cover the relevant literature adequately and in an unbiased manner?
- Yes*

*Are the statistical methods valid and correctly applied? (e.g. sample size, choice of test)
- Not Applicable*

*Are the methods sufficiently documented to allow replication studies?
- Yes*

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
***Answer:***

> - All the code to reproduce the driver layers and the analyses of the paper will be openly available once the GitHub repositories are made public.

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->


*Are the data underlying the study available in either the article, supplement, or deposited in a repository? (Sequence/expression data, protein/molecule characterizations, annotations, and taxonomy data are required to be deposited in public repositories prior to publication) (yes/no/not applicable)
- No*

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->
***Answer:***

> - The formatted driver data will be available through the package and the raw data will be archived on Zenodo and accessible upon request to the authors. The archive is ready to be published, but we are waiting for the publication process to be completed so that the proper citation can be referenced with the material. Likewise, the workflows used for the first iteration of the platform will be released and archived on Zenodo with the paper publication.

<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  -->

*Does the study adhere to ethical standards including ethics committee approval and consent procedure?
- Not Applicable*

*Have standard biosecurity and institutional safety procedures been adhered to?
- Not Applicable*
