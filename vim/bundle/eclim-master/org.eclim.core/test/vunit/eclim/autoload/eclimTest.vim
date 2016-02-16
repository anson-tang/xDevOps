" Author:  Eric Van Dewoestine
"
" License: {{{
"
" Copyright (C) 2005 - 2014  Eric Van Dewoestine
"
" This program is free software: you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation, either version 3 of the License, or
" (at your option) any later version.
"
" This program is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
" GNU General Public License for more details.
"
" You should have received a copy of the GNU General Public License
" along with this program.  If not, see <http://www.gnu.org/licenses/>.
"
" }}}

function! TestChooseEclimdInstance() " {{{
  exec 'cd ' . g:TestEclimWorkspace . 'eclim_unit_test'
  let instance = eclim#client#nailgun#ChooseEclimdInstance()
  let expected = substitute(g:TestEclimWorkspace, '/$', '', '')
  call vunit#AssertEquals(expected, instance.workspace,
    \ "Wrong workspace dir returned.")
endfunction " }}}

function! TestGetEclimCommand() " {{{
  let instance = eclim#client#nailgun#ChooseEclimdInstance()
  let [retcode, result] = eclim#client#nailgun#GetEclimCommand(instance.home)
  call vunit#AssertTrue(result =~ '\<eclim\>', "Invalid eclim command.")
endfunction " }}}

function! TestPing() " {{{
  let result = eclim#PingEclim(0)
  call vunit#AssertTrue(result, "Ping did not return true.")

  "let g:Ping = ''
  "call PushRedir('=> g:Ping')
  "try
  "  call eclim#PingEclim(1)
  "  call vunit#AssertTrue(g:Ping =~ 'eclim [0-9]\+\.[0-9]\+\.[0-9]\+', "Invalid ping output.")
  "finally
  "  unlet! g:Ping
  "  call PopRedir()
  "endtry
endfunction " }}}

function! TestWorkspaceSettings() " {{{
  exec 'WorkspaceSettings ' . g:TestEclimWorkspace
  call vunit#AssertEquals('Workspace_Settings', expand('%'),
    \ "Didn't open settings window.")
  close
endfunction " }}}

function! TestVimSettings() " {{{
  VimSettings
  call vunit#AssertEquals('Vim_Settings', expand('%'),
    \ "Didn't open settings window.")
  close
endfunction " }}}

" vim:ft=vim:fdm=marker
