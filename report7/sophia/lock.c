#include <stdint.h>
typedef uint8_t ssspinlock;

#if defined(__x86_64__) || defined(__i386) || defined(_X86_)
# define CPU_PAUSE __asm__ ("pause")
#elif defined(__powerpc__)
# define CPU_PAUSE __asm__ ("ori 27, 27, 27")
#else
# define CPU_PAUSE do { } while(0)
#endif

static inline void
ss_spinlockinit(ssspinlock *l) {
	*l = 0;
}

static inline void
ss_spinlockfree(ssspinlock *l) {
	*l = 0;
}

static inline void
ss_spinlock(ssspinlock *l) {
	if (__sync_lock_test_and_set(l, 1) != 0) {
		unsigned int spin_count = 0U;
		for (;;) {
			CPU_PAUSE;
			if (*l == 0U && __sync_lock_test_and_set(l, 1) == 0)
				break;
			if (++spin_count > 100U)
				break;
		}
	}
}

int main()
{
 return 0;
}
