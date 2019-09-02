" Vim syntax file
" Language:     Cascading Style Sheets
" Previous Contributor List:
"               Claudio Fleiner <claudio@fleiner.com> (Maintainer)
"               Yeti            (Add full CSS2, HTML4 support)
"               Nikolai Weibull (Add CSS2 support)
" URL:          https://github.com/JulesWang/css.vim
" Maintainer:   Jules Wang      <w.jq0722@gmail.com>
" Last Change:  2019 Jul. 29

" quit when a syntax file was already loaded
if !exists("main_syntax")
  if exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'css'
elseif exists("b:current_syntax") && b:current_syntax == "css"
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn case ignore

" HTML4 tags
syn keyword cssTagName abbr address area a b base
syn keyword cssTagName bdo blockquote body br button
syn keyword cssTagName caption cite code col colgroup dd del
syn keyword cssTagName dfn div dl dt em fieldset form
syn keyword cssTagName h1 h2 h3 h4 h5 h6 head hr html img i
syn keyword cssTagName iframe input ins isindex kbd label legend li
syn keyword cssTagName link map menu meta noscript ol optgroup
syn keyword cssTagName option p param pre q s samp script small
syn keyword cssTagName span strong sub sup tbody td
syn keyword cssTagName textarea tfoot th thead title tr ul u
syn keyword cssTagName object svg
syn match   cssTagName /\<select\>\|\<style\>\|\<table\>/

" 34 HTML5 tags
syn keyword cssTagName article aside audio bdi canvas command data
syn keyword cssTagName datalist details dialog embed figcaption figure footer
syn keyword cssTagName header hgroup keygen main mark menuitem meter nav
syn keyword cssTagName output progress rt rp ruby section
syn keyword cssTagName source summary time track video wbr

" Tags not supported in HTML5
" acronym applet basefont big center dir
" font frame frameset noframes strike tt

syn match cssTagName "\*"

" selectors
syn match cssSelectorOp "[,>+~]"
syn match cssSelectorOp2 "[~|^$*]\?=" contained
syn region cssAttributeSelector matchgroup=cssSelectorOp start="\[" end="]" contains=cssUnicodeEscape,cssSelectorOp2,cssStringQ,cssStringQQ

" .class and #id
syn match cssClassName "\.-\=[A-Za-z_][A-Za-z0-9_-]*" contains=cssClassNameDot
syn match cssClassNameDot contained '\.'

try
syn match cssIdentifier "#[A-Za-zÀ-ÿ_@][A-Za-zÀ-ÿ0-9_@-]*"
catch /^.*/
syn match cssIdentifier "#[A-Za-z_@][A-Za-z0-9_@-]*"
endtry

" digits
syn match cssValueInteger contained "[-+]\=\d\+" contains=cssUnitDecorators
syn match cssValueNumber contained "[-+]\=\d\+\(\.\d*\)\=" contains=cssUnitDecorators
syn match cssValueLength contained "[-+]\=\d\+\(\.\d*\)\=\(mm\|cm\|in\|pt\|pc\|em\|ex\|px\|rem\|dpi\|dppx\|dpcm\|fr\|vw\|vh\|vmin\|vmax\)\>" contains=cssUnitDecorators
syn match cssValueLength contained "[-+]\=\d\+\(\.\d*\)\=%" contains=cssUnitDecorators
syn match cssValueAngle contained "[-+]\=\d\+\(\.\d*\)\=\(deg\|grad\|rad\)\>" contains=cssUnitDecorators
syn match cssValueTime contained "+\=\d\+\(\.\d*\)\=\(ms\|s\)\>" contains=cssUnitDecorators
syn match cssValueFrequency contained "+\=\d\+\(\.\d*\)\=\(Hz\|kHz\)\>" contains=cssUnitDecorators

syn match cssProp "\(align-content\|align-items\|align-self\|all\|animation\|animation-delay\|animation-direction\|animation-duration\|animation-fill-mode\|animation-iteration-count\|animation-name\|animation-play-state\|animation-timing-function\|backface-visibility\|background\|background-attachment\|background-blend-mode\|background-clip\|background-color\|background-image\|background-origin\|background-position\|background-repeat\|background-size\|border\|border-bottom\|border-bottom-color\|border-bottom-left-radius\|border-bottom-right-radius\|border-bottom-style\|border-bottom-width\|border-collapse\|border-color\|border-image\|border-image-outset\|border-image-repeat\|border-image-slice\|border-image-source\|border-image-width\|border-left\|border-left-color\|border-left-style\|border-left-width\|border-radius\|border-right\|border-right-color\|border-right-style\|border-right-width\|border-spacing\|border-style\|border-top\|border-top-color\|border-top-left-radius\|border-top-right-radius\|border-top-style\|border-top-width\|border-width\|bottom\|box-decoration-break\|box-shadow\|box-sizing\|caption-side\|caret-color\|@charset\|clear\|clip\|clip-path\|color\|column-count\|column-fill\|column-gap\|column-rule\|column-rule-color\|column-rule-style\|column-rule-width\|column-span\|column-width\|columns\|content\|counter-increment\|counter-reset\|cursor\|direction\|display\|empty-cells\|filter\|flex\|flex-basis\|flex-direction\|flex-flow\|flex-grow\|flex-shrink\|flex-wrap\|float\|font\|@font-face\|font-family\|font-kerning\|font-size\|font-size-adjust\|font-stretch\|font-style\|font-variant\|font-weight\|grid\|grid-area\|grid-auto-columns\|grid-auto-flow\|grid-auto-rows\|grid-column\|grid-column-end\|grid-column-gap\|grid-column-start\|grid-gap\|grid-row\|grid-row-end\|grid-row-gap\|grid-row-start\|grid-template\|grid-template-areas\|grid-template-columns\|grid-template-rows\|hanging-punctuation\|height\|hyphens\|@import\|isolation\|justify-content\|@keyframes\|left\|letter-spacing\|line-height\|list-style\|list-style-image\|list-style-position\|list-style-type\|margin\|margin-bottom\|margin-left\|margin-right\|margin-top\|max-height\|max-width\|@media\|min-height\|min-width\|mix-blend-mode\|object-fit\|object-position\|opacity\|order\|outline\|outline-color\|outline-offset\|outline-style\|outline-width\|overflow\|overflow-x\|overflow-y\|padding\|padding-bottom\|padding-left\|padding-right\|padding-top\|page-break-after\|page-break-before\|page-break-inside\|perspective\|perspective-origin\|pointer-events\|position\|quotes\|resize\|right\|scroll-behavior\|tab-size\|table-layout\|text-align\|text-align-last\|text-decoration\|text-decoration-color\|text-decoration-line\|text-decoration-style\|text-indent\|text-justify\|text-overflow\|text-shadow\|text-transform\|top\|transform\|transform-origin\|transform-style\|transition\|transition-delay\|transition-duration\|transition-property\|transition-timing-function\|unicode-bidi\|user-select\|vertical-align\|visibility\|white-space\|width\|will-change\|word-break\|word-spacing\|word-wrap\|writing-mode\|z-index\):"

syn match cssImportant contained "!\s*important\>"
syn match cssCustomProp contained "--[a-zA-Z0-9-_]*"

syn region cssURL contained matchgroup=cssFunctionName start="\<\(uri\|url\|local\|format\)\s*(" end=")" contains=cssStringQ,cssStringQQ oneline
syn region cssFunction contained matchgroup=cssFunctionName start="\<\(var\|calc\)(" end=")" contains=cssCustomProp,cssValue.*,cssFunction,cssColor,cssStringQ,cssStringQQ oneline
syn region cssFunction contained matchgroup=cssFunctionName start="\<\(repeat\|minmax\)(" end=")" contains=cssValue.*,cssFunction,cssColor,cssStringQ,cssStringQQ oneline
syn region cssFunction contained matchgroup=cssFunctionName start="\<\(rgb\|clip\|attr\|counter\|rect\|cubic-bezier\|steps\)\s*(" end=")" oneline  contains=cssValueInteger,cssValueNumber,cssValueLength,cssFunctionComma
syn region cssFunction contained matchgroup=cssFunctionName start="\<\(rgba\|hsl\|hsla\|color-stop\|from\|to\)\s*(" end=")" oneline  contains=cssColor,cssValueInteger,cssValueNumber,cssValueLength,cssFunctionComma,cssFunction
syn region cssFunction contained matchgroup=cssFunctionName start="\<\(linear-\|radial-\)\=\gradient\s*(" end=")" oneline  contains=cssColor,cssValueInteger,cssValueNumber,cssValueLength,cssFunction,cssGradientAttr,cssFunctionComma
syn region cssFunction contained matchgroup=cssFunctionName start="\<\(matrix\(3d\)\=\|scale\(3d\|X\|Y\|Z\)\=\|translate\(3d\|X\|Y\|Z\)\=\|skew\(X\|Y\)\=\|rotate\(3d\|X\|Y\|Z\)\=\|perspective\)\s*(" end=")" oneline contains=cssValueInteger,cssValueNumber,cssValueLength,cssValueAngle,cssFunctionComma
syn keyword cssGradientAttr contained top bottom left right cover center middle ellipse at
syn match cssFunctionComma contained ","

" unicode-range attributes
syn match cssFontDescriptorAttr contained "U+[0-9A-Fa-f?]\+"
syn match cssFontDescriptorAttr contained "U+\x\+-\x\+"

syn match cssBraces contained "[{}]"
syn match cssError contained "{@<>"
syn region cssDefinition transparent matchgroup=cssBraces start='{' end='}' contains=cssTagName,cssAttributeSelector,cssClassName,cssIdentifier,cssAtRule,cssAttrRegion,css.*Prop,cssComment,cssValue.*,cssColor,cssURL,cssImportant,cssCustomProp,cssError,cssStringQ,cssStringQQ,cssFunction,cssUnicodeEscape,cssVendor,cssDefinition,cssHacks,cssNoise fold
syn match cssBraceError "}"
syn match cssAttrComma ","

" Pseudo class
" http://www.w3.org/TR/css3-selectors/
syn match cssPseudoClass ":[A-Za-z0-9_-]*" contains=cssNoise,cssPseudoClassId,cssUnicodeEscape,cssVendor,cssPseudoClassFn
syn keyword cssPseudoClassId contained link visited active hover before after left right
syn keyword cssPseudoClassId contained root empty target enable disabled checked invalid
syn match cssPseudoClassId contained "\<first-\(line\|letter\)\>"
syn match cssPseudoClassId contained "\<\(first\|last\|only\)-\(of-type\|child\)\>"
syn region cssPseudoClassFn contained matchgroup=cssFunctionName start=":\(not\|lang\|\(nth\|nth-last\)-\(of-type\|child\)\)(" end=")" contains=cssStringQ,cssStringQQ,cssPseudoClassId
" ------------------------------------
" Vendor specific properties
syn match cssPseudoClassId contained  "\<selection\>"
syn match cssPseudoClassId contained  "\<focus\(-inner\)\=\>"
syn match cssPseudoClassId contained  "\<\(input-\)\=placeholder\>"

" Misc highlight groups
syntax match cssUnitDecorators /\(#\|-\|+\|%\|mm\|cm\|in\|pt\|pc\|em\|ex\|px\|ch\|rem\|vh\|vw\|vmin\|vmax\|dpi\|dppx\|dpcm\|Hz\|kHz\|s\|ms\|deg\|grad\|rad\|fr\)/ contained
" syntax match cssNoise contained /\(:\|;\|\/\)/

" Comment
syn region cssComment start="/\*" end="\*/" contains=@Spell fold

syn match cssUnicodeEscape "\\\x\{1,6}\s\?"
syn match cssSpecialCharQQ +\\\\\|\\"+ contained
syn match cssSpecialCharQ +\\\\\|\\'+ contained
syn region cssStringQQ start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=cssUnicodeEscape,cssSpecialCharQQ
syn region cssStringQ start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=cssUnicodeEscape,cssSpecialCharQ

" Vendor Prefix
syn match cssVendor contained "-\(webkit\|moz\|o\|ms\)-"

" Various CSS Hack characters
" In earlier versions of IE (6 and 7), one can prefix property names
" with a _ or * to isolate those definitions to particular versions of IE
" This is purely decorative and therefore we assign to the same highlight
" group to cssVendor, for more information:
" http://www.paulirish.com/2009/browser-specific-css-hacks/
syn match cssHacks contained /\(_\|*\)/

" Attr Enhance
" Some keywords are both Prop and Attr, so we have to handle them
" cssPseudoClassId is hidden by cssAttrRegion, so we add it here. see #69
syn region cssAttrRegion start=/:/ end=/\ze\(;\|)\|}\|{\)/ contained contains=cssPseudoClassId,css.*Attr,cssColor,cssImportant,cssValue.*,cssFunction,cssString.*,cssURL,cssComment,cssUnicodeEscape,cssVendor,cssError,cssAttrComma,cssNoise

" Hack for transition
" 'transition' has Props after ':'.
syn region cssAttrRegion start=/transition\s*:/ end=/\ze\(;\|)\|}\)/ contained contains=css.*Prop,css.*Attr,cssColor,cssImportant,cssValue.*,cssFunction,cssString.*,cssURL,cssComment,cssUnicodeEscape,cssVendor,cssError,cssAttrComma,cssNoise

syn match cssAtKeyword /@\(font-face\|media\|keyframes\|import\|charset\|namespace\|page\|supports\)/

syn keyword cssAtRuleLogical only not and contained

" @media
" Reference: http://www.w3.org/TR/css3-mediaqueries/
syn region cssAtRule start=/@media\>/ end=/\ze{/ skipwhite skipnl matchgroup=cssAtKeyword contains=cssMediaProp,cssValueLength,cssAtRuleLogical,cssValueInteger,cssMediaAttr,cssVendor,cssMediaType,cssComment,cssCustomProp,cssFunctionName nextgroup=cssDefinition
syn keyword cssMediaType contained screen print aural braille embossed handheld projection tty tv speech all contained

" @page
" http://www.w3.org/TR/css3-page/
syn region cssAtRule start=/@page\>/ end=/\ze{/ skipwhite skipnl matchgroup=cssAtKeyword contains=cssPagePseudo,cssComment nextgroup=cssDefinition
syn match cssPagePseudo /:\(left\|right\|first\|blank\)/ contained skipwhite skipnl
" @keyframe
" http://www.w3.org/TR/css3-animations/#keyframes
syn region cssAtRule start=/@\(-[a-z]\+-\)\=keyframes\>/ end=/\ze{/ skipwhite skipnl matchgroup=cssAtKeyword contains=cssVendor,cssComment nextgroup=cssDefinition

syn region cssAtRule start=/@import\>/    end=/\ze;/ contains=cssStringQ,cssStringQQ,cssUnicodeEscape,cssComment,cssAtKeyword,cssURL,cssMediaProp,cssValueLength,cssAtRuleLogical,cssValueInteger,cssMediaAttr,cssMediaType
syn region cssAtRule start=/@charset\>/   end=/\ze;/ contains=cssStringQ,cssStringQQ,cssUnicodeEscape,cssComment,cssAtKeyword
syn region cssAtRule start=/@namespace\>/ end=/\ze;/ contains=cssStringQ,cssStringQQ,cssUnicodeEscape,cssComment,cssAtKeyword

" @supports
" https://www.w3.org/TR/css3-conditional/#at-supports
syn region cssAtRule start=/@supports\>/ end=/\ze{/ skipwhite skipnl contains=cssAtRuleLogical,cssAttrRegion,css.*Prop,cssValue.*,cssVendor,cssAtKeyword,cssComment nextgroup=cssDefinition


if main_syntax == "css"
  syn sync minlines=10
endif

" Define the default highlighting.
" Only when an item doesn't have highlighting yet

hi def link cssComment Comment
hi def link cssVendor Comment
hi def link cssHacks Comment
hi def link cssTagName Statement
hi def link cssDeprecated Error
hi! def link cssSelectorOp GruvboxGreenBold
hi! def link cssSelectorOp2 GruvboxGreenBold
hi def link cssAttrComma Special

hi def link cssPseudoClassId PreProc
hi def link cssPseudoClassLang Constant
hi def link cssFunction Constant
hi def link cssURL String
hi def link cssFunctionName Function
hi def link cssFunctionComma Function
hi def link cssColor Constant
hi def link cssIdentifier Function
hi def link cssAtRule Include
hi def link cssAtKeyword PreProc
hi def link cssImportant Special
hi def link cssCustomProp Special
hi! def link cssBraces GruvboxOrangeBold
hi def link cssBraceError Error
hi def link cssError Error
hi def link cssUnicodeEscape Special
hi def link cssStringQQ String
hi def link cssStringQ String
hi def link cssAttributeSelector String
hi def link cssMediaType Special
hi def link cssMediaComma Normal
hi def link cssAtRuleLogical Statement
hi def link cssMediaAttr cssAttr
hi def link cssPagePseudo PreProc
hi def link cssFontDescriptorAttr cssAttr
hi def link cssClassName Function
hi def link cssClassNameDot Function
hi def link cssAttr Constant
hi def link cssNoise Noise

hi def link cssProp GruvboxBlue
hi def link cssUnitDecorators GruvboxPurpleBold

hi def link cssValueLength Number
hi def link cssValueInteger Number
hi def link cssValueNumber Number
hi def link cssValueAngle Number
hi def link cssValueTime Number
hi def link cssValueFrequency Number

let b:current_syntax = "css"

if main_syntax == 'css'
  unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save
" vim: ts=8

