From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] tools: testing: selftests: Remove duplicate headers
Date: Tue, 26 Feb 2019 12:48:47 +1100
Message-ID: <87tvgr1fr4.fsf@concordia.ellerman.id.au>
References: <20190223070901.GA10274@jordon-HP-15-Notebook-PC>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190223070901.GA10274@jordon-HP-15-Notebook-PC>
Sender: netdev-owner@vger.kernel.org
To: Souptick Joarder <jrdr.linux@gmail.com>, bamv2005@gmail.com, shuah@kernel.org, davem@davemloft.net, benh@kernel.crashing.org, paulus@samba.org, adobriyan@gmail.com, mathieu.desnoyers@efficios.com, peterz@infradead.org, paulmck@linux.ibm.com, boqun.feng@gmail.com, john.stultz@linaro.org, tglx@linutronix.de, sboyd@kernel.org, akpm@linux-foundation.org
Cc: linux-gpio@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-fsdevel@vger.kernel.org, sabyasachi.linux@gmail.com
List-Id: linux-gpio@vger.kernel.org

Souptick Joarder <jrdr.linux@gmail.com> writes:
> Remove duplicate headers which are included twice.
>
> Signed-off-by: Sabyasachi Gupta <sabyasachi.linux@gmail.com>
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> ---
...
>  tools/testing/selftests/powerpc/pmu/ebb/fork_cleanup_test.c | 1 -

I took this hunk via the powerpc tree.

> diff --git a/tools/testing/selftests/powerpc/pmu/ebb/fork_cleanup_test.c b/tools/testing/selftests/powerpc/pmu/ebb/fork_cleanup_test.c
> index 167135b..af1b802 100644
> --- a/tools/testing/selftests/powerpc/pmu/ebb/fork_cleanup_test.c
> +++ b/tools/testing/selftests/powerpc/pmu/ebb/fork_cleanup_test.c
> @@ -11,7 +11,6 @@
>  #include <sys/wait.h>
>  #include <unistd.h>
>  #include <setjmp.h>
> -#include <signal.h>
>  
>  #include "ebb.h"


cheers
