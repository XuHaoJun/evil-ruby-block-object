;;; evil-ruby-block-object.el --- get ruby-block text object

;; Copyright (C) 2013 Free Software Foundation, Inc.
;; Author: xuhaojun <xuhaojuntw@gmail.com>
;; Keywords: evil, ruby, text-object
;; URL: http://github.com/xuhaojun/evil-ruby-block-object
;; FIXME: Package-Requires: ((evil "X.X"))

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;

;;; Useage:
;; The ruby-block text object bind on evil's text-object key 'r',
;; you can type like 'var','dir','car' ,like control other text object.

;;; Known issue:
;; problem with 'cir', should put cursor at a newline.

;; Code:

(evil-define-text-object evil-inner-ruby-block (count &optional beg end type)
  "Select inner ruby block"
  (evil-regexp-range count beg end type
                     (concat ruby-block-beg-re ".*\n?")
                     (concat "^\s*" ruby-block-end-re)
                     t))

(define-key evil-inner-text-objects-map "r" 'evil-inner-ruby-block)

(evil-define-text-object evil-outer-ruby-block (count &optional beg end type)
  "Select outer ruby block"
  (evil-regexp-range count beg end type
                     ruby-block-beg-re
                     ruby-block-end-re
                     nil))

(define-key evil-outer-text-objects-map "r" 'evil-outer-ruby-block)

(provide 'evil-ruby-block-object)
;;; evil-ruby-block-object.el ends here
