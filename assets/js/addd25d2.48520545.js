"use strict";(self.webpackChunkrelational_migrator_lab=self.webpackChunkrelational_migrator_lab||[]).push([[494],{7059:(e,t,o)=>{o.r(t),o.d(t,{assets:()=>d,contentTitle:()=>l,default:()=>u,frontMatter:()=>i,metadata:()=>r,toc:()=>c});var n=o(5893),s=o(1151),a=o(4421);const i={},l="\ud83d\udc50 Add authors details to the books collection",r={id:"Edit Mapping Rules/add-mapping-books-authors",title:"\ud83d\udc50 Add authors details to the books collection",description:"We want to modify the MongoDB schema so that each book contains an array of its authors.",source:"@site/docs/80-Edit Mapping Rules/30-add-mapping-books-authors.mdx",sourceDirName:"80-Edit Mapping Rules",slug:"/Edit Mapping Rules/add-mapping-books-authors",permalink:"/relational-migrator-lab/docs/Edit Mapping Rules/add-mapping-books-authors",draft:!1,unlisted:!1,editUrl:"https://github.com/mongodb-developer/relational-migrator-lab/blob/main/docs/80-Edit Mapping Rules/30-add-mapping-books-authors.mdx",tags:[],version:"current",sidebarPosition:30,frontMatter:{},sidebar:"tutorialSidebar",previous:{title:"\ud83d\udc50 Add genres to books (not only genre ids)",permalink:"/relational-migrator-lab/docs/Edit Mapping Rules/edit-mapping-books-book-genre"},next:{title:"\ud83d\udc50 Remove unused ids from author details in books collection",permalink:"/relational-migrator-lab/docs/Edit Mapping Rules/edit-mapping-books-author-book"}},d={},c=[];function h(e){const t={code:"code",h1:"h1",header:"header",li:"li",p:"p",ul:"ul",...(0,s.a)(),...e.components};return(0,n.jsxs)(n.Fragment,{children:[(0,n.jsx)(t.header,{children:(0,n.jsx)(t.h1,{id:"-add-authors-details-to-the-books-collection",children:"\ud83d\udc50 Add authors details to the books collection"})}),"\n",(0,n.jsxs)(t.p,{children:["We want to modify the MongoDB schema so that each book contains an array of its authors.\nIn this step we will embed the book details into the empty array from the join table (which right now only contains ",(0,n.jsx)(t.code,{children:"authorId"})," and ",(0,n.jsx)(t.code,{children:"bookId"}),")"]}),"\n",(0,n.jsxs)(t.ul,{children:["\n",(0,n.jsxs)(t.li,{children:["On the MongoDB diagram view, click the ",(0,n.jsx)(t.code,{children:"books"})," collection"]}),"\n",(0,n.jsxs)(t.li,{children:["On the relational mappings list on the right, click ",(0,n.jsx)(t.code,{children:"+ Add"})]}),"\n",(0,n.jsxs)(t.li,{children:["Select ",(0,n.jsx)(t.code,{children:"Embedded documents"})]}),"\n",(0,n.jsxs)(t.li,{children:["Select ",(0,n.jsx)(t.code,{children:"authors"})," as Source table"]}),"\n",(0,n.jsx)(t.li,{children:"In the advanced settings, check 'Merge fields into parent`"}),"\n",(0,n.jsxs)(t.li,{children:["Check the ",(0,n.jsx)(t.code,{children:"id"})," and ",(0,n.jsx)(t.code,{children:"name"})," fields and uncheck the rest"]}),"\n",(0,n.jsxs)(t.li,{children:["Click ",(0,n.jsx)(t.code,{children:"Save and close"})]}),"\n"]}),"\n",(0,n.jsx)(a.Z,{url:"https://www.mongodb.com/products/tools/relational-migrator",src:"img/130-image-001.png",alt:"Screenshot of the connect modal"})]})}function u(e={}){const{wrapper:t}={...(0,s.a)(),...e.components};return t?(0,n.jsx)(t,{...e,children:(0,n.jsx)(h,{...e})}):h(e)}},4421:(e,t,o)=>{o.d(t,{Z:()=>i});o(7294);var n=o(5893);function s(e){const t=e.url||"http://localhost:3000";return(0,n.jsxs)("div",{className:"browser container",children:[(0,n.jsxs)("div",{className:"row",children:[(0,n.jsxs)("div",{className:"column left",children:[(0,n.jsx)("span",{className:"dot",style:{background:"#ED594A"}}),(0,n.jsx)("span",{className:"dot",style:{background:"#FDD800"}}),(0,n.jsx)("span",{className:"dot",style:{background:"#5AC05A"}})]}),(0,n.jsx)("div",{className:"column middle",children:(0,n.jsx)("input",{type:"text",value:t})}),(0,n.jsx)("div",{className:"column right",children:(0,n.jsxs)("div",{style:{float:"right"},children:[(0,n.jsx)("span",{className:"bar"}),(0,n.jsx)("span",{className:"bar"}),(0,n.jsx)("span",{className:"bar"})]})})]}),(0,n.jsx)("div",{className:"content",children:e.children})]})}var a=o(4996);function i(e){return(0,n.jsx)(s,{...e,children:(0,n.jsx)("img",{src:(0,a.ZP)(e.src),alt:e.alt})})}},1151:(e,t,o)=>{o.d(t,{Z:()=>l,a:()=>i});var n=o(7294);const s={},a=n.createContext(s);function i(e){const t=n.useContext(a);return n.useMemo((function(){return"function"==typeof e?e(t):{...t,...e}}),[t,e])}function l(e){let t;return t=e.disableParentContext?"function"==typeof e.components?e.components(s):e.components||s:i(e.components),n.createElement(a.Provider,{value:t},e.children)}}}]);