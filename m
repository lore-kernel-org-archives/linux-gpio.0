From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 4/8] selftests: gpio: override clean in lib.mk to fix warnings
Date: Sat, 22 Apr 2017 15:40:04 +1000
Message-ID: <87wpadyp8r.fsf@concordia.ellerman.id.au>
References: <cover.1492815938.git.shuahkh@osg.samsung.com> <b216b1808abff1e75c1b325a338a518b8477257a.1492815938.git.shuahkh@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b216b1808abff1e75c1b325a338a518b8477257a.1492815938.git.shuahkh@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: shuah@kernel.org, bamvor.zhangjian@linaro.org, benh@kernel.crashing.org, paulus@samba.org, dvhart@infradead.org
Cc: Shuah Khan <shuahkh@osg.samsung.com>, viro@zeniv.linux.org.uk, emilio.lopez@collabora.co.uk, mingo@kernel.org, luto@kernel.org, dave.hansen@linux.intel.com, dsafonov@virtuozzo.com, rkrcmar@redhat.com, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
List-Id: linux-gpio@vger.kernel.org

Shuah Khan <shuahkh@osg.samsung.com> writes:

> Add override for lib.mk clean to fix the following warnings from clean
> target run.
>
> Makefile:11: warning: overriding recipe for target 'clean'
> ../lib.mk:55: warning: ignoring old recipe for target 'clean'
>
> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
> ---
>  tools/testing/selftests/gpio/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/gpio/Makefile b/tools/testing/selftests/gpio/Makefile
> index 205e4d1..4f6d9e0 100644
> --- a/tools/testing/selftests/gpio/Makefile
> +++ b/tools/testing/selftests/gpio/Makefile
> @@ -7,8 +7,9 @@ include ../lib.mk
>  
>  all: $(BINARIES)
>  
> -clean:
> +override define CLEAN
>  	$(RM) $(BINARIES)
> +endef

This could be achieved more simply with:

EXTRA_CLEAN := $(BINARIES)

cheers
