#include <stdio.h>
#include "foo.h"

int
main(int argc, char *argv[])
{
  int i;

  for(i=1; i<argc; i++)
  {
    if(argv[i][0] =='-')
    {
      switch(argv[i][1])
      {
        case 'v' :
          printf("version %s\n", foo_version_string());
          break;
        case 'n' :
          printf("name %s\n", foo_name());
          break;
        case 'h' :
          fprintf(stderr, "usage: foo [ -v ] [ -n ] [ argument1 [ argument2 [ ... ] ] ]\n");
          fprintf(stderr, "       foo -h\n");
          break;
        default :
          fprintf(stderr, "unknown option: -%c\n", argv[i][1]);
          return 1;
      }
    }
    else
    {
      printf("arg[%d] = %s\n", i, argv[i]);
    }
  }

  return 0;
}
