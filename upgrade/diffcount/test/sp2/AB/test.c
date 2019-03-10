   /*********************

  new->line0 = line0;
  new->line1 = line1;
  new->inserted = inserted;
  new->deleted = deleted;
  new->link = old;

**********************/

static struct change * add_change 
	    struct change *old)
{
  struct change *new = xmalloc (sizeof *new);

  new->line0 = line0;
  new->line1 = line1; /* --------- */
  new->inserted = inserted;
  new->deleted = deleted;
  /*-----*/ printf;
  new->link = old;
  return new;
  /* test **********
  ********/sadf
}
