;   @file   driver.rkt
;   @author Jose Flores <jose.flores.152@gmail.com>
;
;   This file is the driver to the OPL Racket libraries project, It currently
;   Includes the server-handler class and kicks off the server.

;   Language Specification
#lang racket

;   REQUIRES
(require racket/include)

;   Including the server class
(include "server-handler.rkt")

;   Starting the server
((server-handler) 'start)





