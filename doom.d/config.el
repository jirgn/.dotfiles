(setq user-full-name "Jürgen Messner"
      user-mail-address "jirgn76@googlemail.com")

(setq doom-theme 'doom-nord)
(setq display-line-numbers-type t)

;; some common used vars
(setq 
  org-root-directory (concat (getenv "HOME") "/org")
  org-notes-directory (concat org-root-directory "/notes")
  slipbox-root-directory (concat org-root-directory "/slipbox")
  slipbox-references-directory (concat slipbox-root-directory "/references")
  zot_bib (concat slipbox-references-directory "/zotero_mylibrary.bib"))

(setq
   org-directory org-root-directory)

(use-package! org-fragtog
  :after org
  :hook (org-mode . org-fragtog-mode))

(use-package! org-appear
  :after org
  :hook (org-mode . org-appear-mode)
  :config (setq
           org-appear-autolinks t
           org-appear-autoentities t
           org-appear-autosubmarkers t ))
;;
(use-package! org-transclusion
  :after org-roam)

(setq org-roam-v2-ack t)

(use-package! org-roam
  :after org
  :config
  (setq org-roam-v2-ack t)
  (setq org-roam-mode-sections
        (list #'org-roam-backlinks-insert-section
              #'org-roam-reflinks-insert-section
              #'org-roam-unlinked-references-insert-section)))


(use-package! org-roam-ui
  :after org-roam
  :config
  (setq org-roam-ui-open-on-start nil)
  (setq org-roam-ui-browser-function #'xwidget-webkit-browse-url))

(after! org-roam
    (setq
      org-roam-directory slipbox-root-directory
      org-roam-dailies-directory "journals/"
      org-roam-dailies-capture-templates
      '(("d" "default" entry "* %?" 
         :target (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n"))
        ("b" "board" entry "* Jira [[CVSHOP-%?]]" 
         :target (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n")))

      org-roam-capture-templates
          `(("s" "standard" plain "%?"
     :if-new
     (file+head "pages/%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n
#+filetags: \n\n ")
     :unnarrowed t)

        ("d" "definition" plain "%?"
         :if-new
         (file+head "pages/${slug}.org"
                    "#+title: ${title}
#+filetags: :definition: \n
* Definition\n%?\n
* Examples\n")
         :unnarrowed t)

        ("h" "howto" plain "%?"
         :if-new
         (file+head "pages/${slug}.org"
                    "#+title: ${title}\n
#+filetags: :howto:\n
* Howto\n%?\n
* Examples\n")
         :unnarrowed t)

        ("r" "ref" plain "%?"
           :if-new
           (file+head "references/${citekey}.org"
                      "#+title: ${slug}: ${title}\n\n
#+filetags: :reference: ${keywords} \n\n
* ${title}\n\n\n
* Summary\n\n\n
* Rough note space\n")
           :unnarrowed t)

        ("p" "person" plain "%?"
         :if-new
         (file+head "pages/${slug}.org"
                    ":PROPERTIES:
    :FORNAME: ${forname}
    :LASTNAME: ${lastname}
    :BIRTHDAY: %^t
    :RELATION: %^{relation|family|friend|work}
:END:
#+title: ${slug} ")
         :unnarrowed t))))

(use-package deft
  :after org-roam
  :custom
  (deft-recursive t)
  (deft-use-filter-string-for-filename t)
  (deft-use-filename-as-title 't)
  (deft-default-extension "org")
  (deft-strip-summary-regexp
    (concat "\\("
        "[\n\t]" ;; blank
        "\\|^#\\+[[:alpha:]_]+:.*$" ;; org-mode metadata
        "\\|^:PROPERTIES:\n\\(.+\n\\)+:END:\n"
        "\\)"))
  (deft-directory slipbox-root-directory))

(use-package! org-ref
  :config
  (setq
   org-ref-completion-library 'org-ref-ivy-cite
   org-ref-note-title-format "* %y - %t\n
:PROPERTIES:\n
   :CUSTOM_ID: %k\n
   :NOTER_DOCUMENT: %F\n
   :ROAM_KEY: cite:%k\n
   :AUTHOR: %9a\n
   :JOURNAL: %j\n
   :YEAR: %y\n
   :VOLUME: %v\n
   :PAGES: %p\n
   :DOI: %D\n
   :URL: %U\n
:END:\n\n"
   org-ref-notes-directory slipbox-references-directory
   org-ref-notes-function 'orb-edit-notes
   ))

(after! org-ref
  (setq
   bibtex-completion-bibliography zot_bib
   bibtex-completion-notes (concat slipbox-references-directory "/bibnotes.org")
   bibtex-completion-notes-path slipbox-references-directory
   bibtex-completion-pdf-field "file"
   bibtex-completion-notes-template-multiple-files
   (concat
    "#+TITLE: ${title}\n"
    "#+ROAM_KEY: cite:${=key=}\n"
    "* TODO Notes\n"
    ":PROPERTIES:\n"
    ":Custom_ID: ${=key=}\n"
    ":NOTER_DOCUMENT: %(orb-process-file-field \"${=key=}\")\n"
    ":AUTHOR: ${author-abbrev}\n"
    ":JOURNAL: ${journaltitle}\n"
    ":DATE: ${date}\n"
    ":YEAR: ${year}\n"
    ":DOI: ${doi}\n"
    ":URL: ${url}\n"
    ":END:\n\n"
    )
   )
  )

(use-package! org-roam-bibtex
  :after org-roam
  :hook (org-mode . org-roam-bibtex-mode)
  :config
  (require 'org-ref)
  (setq orb-preformat-keywords
   '("citekey" "title" "url" "file" "author-or-editor" "keywords" "pdf" "doi" "author" "tags" "year" "author-bbrev")))
;)

(use-package! org-noter
  :after (:any org pdf-view)
  :config
  (setq
   org-noter-hide-other nil
   org-noter-notes-search-path `(slipbox-references-directory)
   )
  )

(use-package! org-pdftools
  :hook (org-load . org-pdftools-setup-link))
(use-package! org-noter-pdftools
  :after org-noter
  :config
  (with-eval-after-load 'pdf-annot
    (add-hook 'pdf-annot-activate-handler-functions #'org-noter-pdftools-jump-to-note)))

(use-package! org-ol-tree
  :after org
  :commands org-ol-tree
  :hook (org-ol-tree-mode . visual-line-mode)
  :config
  (setq org-ol-tree-ui-window-auto-resize nil
        org-ol-tree-ui-window-max-width 0.3
        org-ol-tree-ui-window-position 'left))
(map! :map org-mode-map
      :after org
      :localleader
      :desc "Outline" "O" #'org-ol-tree)

(defun +org-tree-to-indirect-buffer-options (option)
  (let* ((old-value org-indirect-buffer-display))
    (progn
      (setq org-indirect-buffer-display option)
      (org-tree-to-indirect-buffer)
      (setq org-indirect-buffer-display old-value))))

(defun +org-tree-to-indirect-other-window ()
  (interactive)
  (+org-tree-to-indirect-buffer-options 'other-window))

(defun +org-tree-to-indirect-current-window ()
  (interactive)
  (+org-tree-to-indirect-buffer-options 'current-window))

(defun +org-tree-to-indirect-dedicated-frame ()
  (interactive)
  (+org-tree-to-indirect-buffer-options 'dedicated-frame))

(after! org
  (custom-set-faces!
    '((org-block) :background nil)
    )
  (defface redd
    '((((class color) (min-colors 88) (background light))
       :foreground "red"))
    "Red."
    :group 'basic-faces)
  (custom-set-faces!
    '(org-document-title :height 1.6 :weight bold)
    '(org-level-1 :height 1.3 :weight extrabold :slant normal)
    '(org-level-2 :height 1.2 :weight bold :slant normal)
    '(org-level-3 :height 1.1 :weight regular :slant normal)
    '(org-document-info  :inherit 'nano-face-faded)
    '(org-document-title   ;:foreground ,(doom-color 'black)
      :family "Roboto"
      :height 250
      :weight medium)))

(after! org
  (setq org-emphasis-alist
        '(("*" (bold))
          ("/" italic)
          ("_" underline)
          ("=" redd)
          ("~" code)
          ("+" (:strike-through t)))))

(after! org
  (setq org-ellipsis " ▾ ")
  (appendq! +ligatures-extra-symbols
            `(:checkbox      "☐"
              :pending       "◼"
              :checkedbox    "☑"
              :list_property "∷"
              :em_dash       "—"
              :ellipses      "…"
              :arrow_right   "→"
              :arrow_left    "←"
              :title         nil
              :subtitle      "𝙩"
              :author        "𝘼"
              :date          "𝘿"
              :property      ""
              :options       "⌥"
              :startup       "⏻"
              :macro         "𝓜"
              :html_head     "🅷"
              :html          "🅗"
              :latex_class   "🄻"
              :latex_header  "🅻"
              :beamer_header "🅑"
              :latex         "🅛"
              :attr_latex    "🄛"
              :attr_html     "🄗"
              :attr_org      "⒪"
              :begin_quote   "❝"
              :end_quote     "❞"
              :caption       "☰"
              :header        "›"
              :results       "🠶"
              :begin_export  "⏩"
              :end_export    "⏪"
              :properties    ""
              :end           "∎"
              :priority_a   ,(propertize "⚑" 'face 'all-the-icons-red)
              :priority_b   ,(propertize "⬆" 'face 'all-the-icons-orange)
              :priority_c   ,(propertize "■" 'face 'all-the-icons-yellow)
              :priority_d   ,(propertize "⬇" 'face 'all-the-icons-green)
              :priority_e   ,(propertize "❓" 'face 'all-the-icons-blue)
              :roam_tags nil
              :filetags nil))

  (set-ligatures! 'org-mode
    :merge t
    :checkbox      "[ ]"
    :pending       "[-]"
    :checkedbox    "[X]"
    :list_property "::"
    :em_dash       "---"
    :ellipsis      "..."
    :arrow_right   "->"
    :arrow_left    "<-"
    :title         "#+title:"
    :subtitle      "#+subtitle:"
    :author        "#+author:"
    :date          "#+date:"
    :property      "#+property:"
    :options       "#+options:"
    :startup       "#+startup:"
    :macro         "#+macro:"
    :html_head     "#+html_head:"
    :html          "#+html:"
    :latex_class   "#+latex_class:"
    :latex_header  "#+latex_header:"
    :beamer_header "#+beamer_header:"
    :latex         "#+latex:"
    :attr_latex    "#+attr_latex:"
    :attr_html     "#+attr_html:"
    :attr_org      "#+attr_org:"
    :begin_quote   "#+begin_quote"
    :end_quote     "#+end_quote"
    :caption       "#+caption:"
    :header        "#+header:"
    :begin_export  "#+begin_export"
    :end_export    "#+end_export"
    :results       "#+RESULTS:"
    :property      ":PROPERTIES:"
    :end           ":END:"
    :priority_a    "[#A]"
    :priority_b    "[#B]"
    :priority_c    "[#C]"
    :priority_d    "[#D]"
    :priority_e    "[#E]"
    :roam_tags     "#+roam_tags:"
    :filetags      "#+filetags:")
  (plist-put +ligatures-extra-symbols :name "⁍")
  )

(with-eval-after-load 'org
  (plist-put org-format-latex-options :background 'default))

(setq org-agenda-files (append 
   '("~/org/slipbox/journals")
   (directory-files-recursively "~/org/notes" "\.org$" )))

(after! org
  (setq org-capture-templates `(("i" "Inbox"
                                 entry (file (concat org-notes-directory "/inbox.org"))
                                 "* %?\n%U\n\n  %i"
                                 :kill-buffer t)
                                ("m" "Meeting Todo"
                                 entry (file+headline (concat org-notes-directory "/meetings_agenda.org") "Future")
                                 ,(concat 
                                    "* TODO %? :meeting:\n"
                                    "<%<%Y-%m-%d %a %H:00>>"))
                                ))
  (set-face-attribute 'org-headline-done nil :strike-through t))

(use-package! org-super-agenda
  :hook (org-agenda-mode . org-super-agenda-mode)
)


(setq org-agenda-skip-scheduled-if-done t
      org-agenda-skip-deadline-if-done t
      org-agenda-include-deadlines t
      org-agenda-include-diary nil
      org-agenda-block-separator nil
      org-agenda-compact-blocks t
      org-agenda-start-with-log-mode t
      org-agenda-start-day nil)

(setq org-agenda-custom-commands
      '(("d" "Get Things DONE"
         ((agenda "" ((org-agenda-span 1)
                      (org-super-agenda-groups
                       '((:name "Today"
                          :time-grid t
                          :date nil
                          :todo "TODAY"
                          :scheduled nil
                          :order 1)))))
          (alltodo "" ((org-agenda-overriding-header "")
                       (org-super-agenda-groups
                        '((:discard (:todo "TODO"))
                          (:name "Important"
                           :tag "Important"
                           :priority "A"
                           :order 1)
                          (:name "Due Today"
                           :deadline today
                           :order 2)
                          (:name "Due Soon"
                           :deadline future
                           :order 8)
                          (:name "Overdue"
                           :deadline past
                           :order 7)
                          (:name "Thesis"
                           :tag "thesis"
                           :order 10)
                          (:name "ESN"
                           :tag "esn"
                           :order 12)
                          (:name "JOTE"
                           :tag "jote"
                           :order 13)
                          (:name "Emacs"
                           :tag "emacs"
                           :order 14)
                          (:name "Home"
                           :tag "home"
                           :order 30)
                          (:name "Waiting"
                           :todo "WAITING"
                           :order 20)
                          (:name "Notes"
                           :tag "notes"
                           :order 20)
                           ;(:name "Open Questions"
                           ;       :todo "OPEN"
                           ;       :order 3)
                          (:name "trivial"
                           :priority<= "C"
                           :tag ("Trivial" "Unimportant")
                           :todo ("SOMEDAY" )
                           :order 90)
                          (:discard (:tag ("Chore" "Routine" "Daily")))))))))))

(map! :leader
      (:prefix-map ("r" . "regular")
       :desc "find file"            "f"   #'org-roam-node-find
       :desc "find ref"             "F"   #'org-roam-ref-find
       :desc "center scroll"        "s"   #'prot/scroll-center-cursor-mode
       :desc "start taking notes"   "S"   #'org-noter
       :desc "toggle buffer"        "b"   #'org-roam-buffer-toggle
       :desc "insert note"          "i"   #'org-roam-node-insert
       :desc "server"               "g"   #'org-roam-server
       :desc "quit notes"           "q"   #'org-noter-kill-session
       :desc "tag (roam)"           "t"   #'org-roam-tag-add
       :desc "tag (org)"            "T"   #'org-set-tags-command
       :desc "pomodoro"             "p"   #'org-pomodoro
       :desc "change nano-theme"    "n"   #'nano-toggle-theme
       :desc "rebuid db"            "d"   #'org-roam-db-build-cache
       :desc "thesaurus this word"  "w"  #'powerthesaurus-lookup-word-at-point
       :desc "thesaurus lookup word" "W"   #'powerthesaurus-lookup-word
       :desc "outline"              "o"   #'org-ol-tree
       (:prefix  ("r" . "orui")
        :desc "orui-mode" "r" #'org-roam-ui-mode
        :desc "zoom" "z" #'orui-node-zoom
        :desc "open" "o" #'orui-open
        :desc "local" "l" #'orui-node-local
        :desc "sync theme" "t" #'orui-sync-theme
        :desc "follow" "f" #'orui-follow-mode)
       (:prefix ("m" . "transclusion")
        :desc "make link"            "m"   #'org-transclusion-make-from-link
        :desc "transclusion mode"    "t"   #'org-transclusion-mode
        :desc "add at point"         "a"   #'org-transclusion-add-at-point
        :desc "add all in buffer"    "A"   #'org-transclusion-add-all-in-buffer
        :desc "remove at point"      "r"   #'org-transclusion-remove-at-point
        :desc "remove all in buffer" "R"   #'org-transclusion-remove-all-in-buffer
        :desc "start live edit"      "s"   #'org-transclusion-live-sync-start-at-point
        :desc "stop live edit"       "S"   #'org-transclusion-live-sync-exit-at-point)
       ))
