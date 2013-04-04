Relog - Replace root python logging in python libraries
===========================================

Introduction
------------

This MODIFIES code.

3rd party python libraries using root logging got you down?

Use Relog to replace their calls with namespaced logging.

This is a temporary solution (HACK!).  The real solution is to get the a library's 
maintainers to use logging.getLogger('foo') intead of the default root logger.

Usage
-----

    relog <pylibrarypath>

Example
-------

Run this to fix the root logging in all the .py files in the google_appengine directory:

     relog google_appengine


What it does
------------

This:

    logging.warn("someone's behind you")
  
will be replaced with this:

    logging.getLogger(__name__).warn("someone's behind you")
  
This allows you to quiet their logging calls with something like this:

    logging.getLogger('annoying.library').setLevel(logging.ERROR)
    
Todo
----
This isn't very fast.  I'll make a faster version if I end up having to use this a lot.
