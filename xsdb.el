(require 'comint)

(defcustom xsdb-command
  "xsdb"
  "The C compiler flags to use.  Should have -I flags for system includes."
  :group 'xsdb
  :type 'string
  :safe #'stringp)

(defcustom xsdb-hdf-file
  nil
  "The C compiler flags to use.  Should have -I flags for system includes."
  :group 'xsdb
  :type 'file
  :safe #'stringp)

(defun xsdb-restart ()
  (interactive)
  (let ((cmdproc-buffer (or (get-buffer "*xsdb*") (xsdb))))
    (process-send-string cmdproc-buffer "echo \"Bla\"\n"))
  )

(defun xsdb ()
  (interactive)
	(let ((cmdproc-buffer (make-comint "xsdb" xsdb-command)))
    (pop-to-buffer cmdproc-buffer)
    ;; (setq process (get-buffer-process cmdproc-buffer))
    ;; (process-put process 'buffer cmdproc-buffer)
    cmdproc-buffer))


(provide 'xsdb)

