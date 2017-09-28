#ifdef DEFINE1
#ifdef DEFINE2
#endif /* DEFINE2 */
#ifdef DEFINE3
#ifdef DEFINE4
#endif /* DEFINE4 */
#endif /* DEFINE3 */
#ifdef DEFINE5
#ifdef DEFINE6
#endif /* DEFINE6 */
#if defined DEFINE7
#if defined(DEFINE8)
#ifdef DEFINE9
#endif /* DEFINE 9 */
#endif /* DEFINE 8 */
#endif /* DEFINE 7 */
#if defined(DEFINE8)
void function(void);
#endif /* DEFINE 8 */
#endif /* DEFINE5 */
/*
Function to be truncated.
This comment should not
be taken to processing.
*/
void function(void);
#endif /* DEFINE1 */
