"use strict";(self.webpackChunkrelational_migrator_lab=self.webpackChunkrelational_migrator_lab||[]).push([[71],{1067:(e,t,n)=>{n.r(t),n.d(t,{assets:()=>c,contentTitle:()=>r,default:()=>p,frontMatter:()=>a,metadata:()=>l,toc:()=>d});var o=n(5893),i=n(1151),s=n(4421);const a={},r="\ud83d\udc50 Add mapping to books collection (from reviews table)",l={id:"Edit Mapping Rules/add-mapping-books-reviews",title:"\ud83d\udc50 Add mapping to books collection (from reviews table)",description:"We want to modify the MongoDB schema so that each book contains an array of its latest three reviews.",source:"@site/docs/80-Edit Mapping Rules/50-add-mapping-books-reviews.mdx",sourceDirName:"80-Edit Mapping Rules",slug:"/Edit Mapping Rules/add-mapping-books-reviews",permalink:"/relational-migrator-lab/docs/Edit Mapping Rules/add-mapping-books-reviews",draft:!1,unlisted:!1,editUrl:"https://github.com/mongodb-developer/relational-migrator-lab/blob/main/docs/80-Edit Mapping Rules/50-add-mapping-books-reviews.mdx",tags:[],version:"current",sidebarPosition:50,frontMatter:{},sidebar:"tutorialSidebar",previous:{title:"\ud83d\udc50 Edit mapping to books collection (from author_book table)",permalink:"/relational-migrator-lab/docs/Edit Mapping Rules/edit-mapping-books-author-book"},next:{title:"\ud83d\udc50 Edit mapping to authors collection (from from author_alias table)",permalink:"/relational-migrator-lab/docs/Edit Mapping Rules/edit-mapping-authors-alias"}},c={},d=[];function h(e){const t={a:"a",code:"code",h1:"h1",header:"header",li:"li",p:"p",ul:"ul",...(0,i.a)(),...e.components};return(0,o.jsxs)(o.Fragment,{children:[(0,o.jsx)(t.header,{children:(0,o.jsx)(t.h1,{id:"-add-mapping-to-books-collection-from-reviews-table",children:"\ud83d\udc50 Add mapping to books collection (from reviews table)"})}),"\n",(0,o.jsxs)(t.p,{children:["We want to modify the MongoDB schema so that each book contains an array of its latest three reviews.\nThis is actually an implementation of the ",(0,o.jsx)(t.a,{href:"https://www.mongodb.com/blog/post/building-with-patterns-the-subset-pattern",children:"Subset Pattern"}),"."]}),"\n",(0,o.jsx)(t.p,{children:"In this step we will embed the book details into the empty array from the join table."}),"\n",(0,o.jsxs)(t.ul,{children:["\n",(0,o.jsxs)(t.li,{children:["On the MongoDB diagram view, click the ",(0,o.jsx)(t.code,{children:"books"})," collection"]}),"\n",(0,o.jsxs)(t.li,{children:["On the relational mappings list on the right, click ",(0,o.jsx)(t.code,{children:"+ Add"})]}),"\n",(0,o.jsxs)(t.li,{children:["Select ",(0,o.jsx)(t.code,{children:"Embedded array"})]}),"\n",(0,o.jsxs)(t.li,{children:["Select ",(0,o.jsx)(t.code,{children:"reviews"})," as Source table"]}),"\n",(0,o.jsxs)(t.li,{children:["In the advanced settings, check ",(0,o.jsx)(t.code,{children:"Add array conditions"})]}),"\n",(0,o.jsxs)(t.li,{children:["In ",(0,o.jsx)(t.code,{children:"Sort by and order"})," option, select ",(0,o.jsx)(t.code,{children:"timestamp"})," and toggle the order to descending"]}),"\n",(0,o.jsxs)(t.li,{children:["Set ",(0,o.jsx)(t.code,{children:"Limit number of rows"})," to ",(0,o.jsx)(t.code,{children:"3"})]}),"\n",(0,o.jsxs)(t.li,{children:["Uncheck the ",(0,o.jsx)(t.code,{children:"bookId"})," and leave the rest of the fields checked"]}),"\n",(0,o.jsxs)(t.li,{children:["Click ",(0,o.jsx)(t.code,{children:"Save and close"})]}),"\n"]}),"\n",(0,o.jsx)(t.p,{children:"Limitations:"}),"\n",(0,o.jsxs)(t.ul,{children:["\n",(0,o.jsx)(t.li,{children:"Continuous Migration Mode will not support this transformation"}),"\n",(0,o.jsx)(t.li,{children:"You will not be able to enable Data Verification when you create the Migration Job."}),"\n"]}),"\n",(0,o.jsx)(s.Z,{url:"https://www.mongodb.com/products/tools/relational-migrator",src:"img/150-image-002.png",alt:"Screenshot of the connect modal"})]})}function p(e={}){const{wrapper:t}={...(0,i.a)(),...e.components};return t?(0,o.jsx)(t,{...e,children:(0,o.jsx)(h,{...e})}):h(e)}},4421:(e,t,n)=>{n.d(t,{Z:()=>a});n(7294);var o=n(5893);function i(e){const t=e.url||"http://localhost:3000";return(0,o.jsxs)("div",{className:"browser container",children:[(0,o.jsxs)("div",{className:"row",children:[(0,o.jsxs)("div",{className:"column left",children:[(0,o.jsx)("span",{className:"dot",style:{background:"#ED594A"}}),(0,o.jsx)("span",{className:"dot",style:{background:"#FDD800"}}),(0,o.jsx)("span",{className:"dot",style:{background:"#5AC05A"}})]}),(0,o.jsx)("div",{className:"column middle",children:(0,o.jsx)("input",{type:"text",value:t})}),(0,o.jsx)("div",{className:"column right",children:(0,o.jsxs)("div",{style:{float:"right"},children:[(0,o.jsx)("span",{className:"bar"}),(0,o.jsx)("span",{className:"bar"}),(0,o.jsx)("span",{className:"bar"})]})})]}),(0,o.jsx)("div",{className:"content",children:e.children})]})}var s=n(4996);function a(e){return(0,o.jsx)(i,{...e,children:(0,o.jsx)("img",{src:(0,s.ZP)(e.src),alt:e.alt})})}},1151:(e,t,n)=>{n.d(t,{Z:()=>r,a:()=>a});var o=n(7294);const i={},s=o.createContext(i);function a(e){const t=o.useContext(s);return o.useMemo((function(){return"function"==typeof e?e(t):{...t,...e}}),[t,e])}function r(e){let t;return t=e.disableParentContext?"function"==typeof e.components?e.components(i):e.components||i:a(e.components),o.createElement(s.Provider,{value:t},e.children)}}}]);