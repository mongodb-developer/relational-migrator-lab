"use strict";(self.webpackChunkrelational_migrator_lab=self.webpackChunkrelational_migrator_lab||[]).push([[945],{5207:(o,t,e)=>{e.r(t),e.d(t,{assets:()=>c,contentTitle:()=>r,default:()=>p,frontMatter:()=>i,metadata:()=>l,toc:()=>d});var n=e(5893),a=e(1151),s=e(4421);const i={},r="\ud83d\udc50 Edit mapping to books collection (from author_book table)",l={id:"Edit Mapping Rules/edit-mapping-books-author-book",title:"\ud83d\udc50 Edit mapping to books collection (from author_book table)",description:"We want to modify the MongoDB schema so that each book contains an array of its authors.",source:"@site/docs/80-Edit Mapping Rules/30-edit-mapping-books-author-book.mdx",sourceDirName:"80-Edit Mapping Rules",slug:"/Edit Mapping Rules/edit-mapping-books-author-book",permalink:"/relational-migrator-lab/docs/Edit Mapping Rules/edit-mapping-books-author-book",draft:!1,unlisted:!1,editUrl:"https://github.com/mongodb-developer/relational-migrator-lab/blob/main/docs/80-Edit Mapping Rules/30-edit-mapping-books-author-book.mdx",tags:[],version:"current",sidebarPosition:30,frontMatter:{},sidebar:"tutorialSidebar",previous:{title:"\ud83d\udc50 Edit mapping to authors collection (from author_book table)",permalink:"/relational-migrator-lab/docs/Edit Mapping Rules/edit-mapping-authors-authorbook"},next:{title:"\ud83d\udc50 Add mapping to books collection (from authors table)",permalink:"/relational-migrator-lab/docs/Edit Mapping Rules/add-mapping-books-authors"}},c={},d=[];function h(o){const t={code:"code",h1:"h1",header:"header",li:"li",p:"p",ul:"ul",...(0,a.a)(),...o.components};return(0,n.jsxs)(n.Fragment,{children:[(0,n.jsx)(t.header,{children:(0,n.jsx)(t.h1,{id:"-edit-mapping-to-books-collection-from-author_book-table",children:"\ud83d\udc50 Edit mapping to books collection (from author_book table)"})}),"\n",(0,n.jsx)(t.p,{children:"We want to modify the MongoDB schema so that each book contains an array of its authors.\nIn this step we will remove the redundant ID fields from the join table."}),"\n",(0,n.jsxs)(t.ul,{children:["\n",(0,n.jsxs)(t.li,{children:["On the MongoDB diagram view, click the ",(0,n.jsx)(t.code,{children:"books"})," collection"]}),"\n",(0,n.jsxs)(t.li,{children:["On the relational mappings list on the right, click on the edit icon of ",(0,n.jsx)(t.code,{children:"author_book"})]}),"\n",(0,n.jsxs)(t.li,{children:["Edit the field name from ",(0,n.jsx)(t.code,{children:"authorBooks"})," to just ",(0,n.jsx)(t.code,{children:"authors"})]}),"\n",(0,n.jsxs)(t.li,{children:["In the list of fields, uncheck ",(0,n.jsx)(t.code,{children:"authorId"})," and ",(0,n.jsx)(t.code,{children:"bookId"}),", leaving all fields unchecked."]}),"\n",(0,n.jsxs)(t.li,{children:["Click ",(0,n.jsx)(t.code,{children:"Save and close"})]}),"\n"]}),"\n",(0,n.jsx)(s.Z,{url:"https://www.mongodb.com/products/tools/relational-migrator",src:"img/140-image-001.png",alt:"Screenshot of the connect modal"})]})}function p(o={}){const{wrapper:t}={...(0,a.a)(),...o.components};return t?(0,n.jsx)(t,{...o,children:(0,n.jsx)(h,{...o})}):h(o)}},4421:(o,t,e)=>{e.d(t,{Z:()=>i});e(7294);var n=e(5893);function a(o){const t=o.url||"http://localhost:3000";return(0,n.jsxs)("div",{className:"browser container",children:[(0,n.jsxs)("div",{className:"row",children:[(0,n.jsxs)("div",{className:"column left",children:[(0,n.jsx)("span",{className:"dot",style:{background:"#ED594A"}}),(0,n.jsx)("span",{className:"dot",style:{background:"#FDD800"}}),(0,n.jsx)("span",{className:"dot",style:{background:"#5AC05A"}})]}),(0,n.jsx)("div",{className:"column middle",children:(0,n.jsx)("input",{type:"text",value:t})}),(0,n.jsx)("div",{className:"column right",children:(0,n.jsxs)("div",{style:{float:"right"},children:[(0,n.jsx)("span",{className:"bar"}),(0,n.jsx)("span",{className:"bar"}),(0,n.jsx)("span",{className:"bar"})]})})]}),(0,n.jsx)("div",{className:"content",children:o.children})]})}var s=e(4996);function i(o){return(0,n.jsx)(a,{...o,children:(0,n.jsx)("img",{src:(0,s.ZP)(o.src),alt:o.alt})})}},1151:(o,t,e)=>{e.d(t,{Z:()=>r,a:()=>i});var n=e(7294);const a={},s=n.createContext(a);function i(o){const t=n.useContext(s);return n.useMemo((function(){return"function"==typeof o?o(t):{...t,...o}}),[t,o])}function r(o){let t;return t=o.disableParentContext?"function"==typeof o.components?o.components(a):o.components||a:i(o.components),n.createElement(s.Provider,{value:t},o.children)}}}]);