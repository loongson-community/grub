
static inline int
ffs (int i)
{
  unsigned j;
  for (j = 0; j < sizeof (i) * 8; j++)
    if (i & (1 << j))
      return j + 1;
  return 0;
}
