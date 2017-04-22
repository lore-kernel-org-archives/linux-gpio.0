From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 6/8] selftests: splice: override clean in lib.mk to fix warnings
Date: Sat, 22 Apr 2017 15:40:32 +1000
Message-ID: <87tw5hyp7z.fsf@concordia.ellerman.id.au>
References: <cover.1492815938.git.shuahkh@osg.samsung.com> <18f3784fe7bf463595f7261fb4e8e9fd6548b0d5.1492815938.git.shuahkh@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56523 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1041294AbdDVFkf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 22 Apr 2017 01:40:35 -0400
In-Reply-To: <18f3784fe7bf463595f7261fb4e8e9fd6548b0d5.1492815938.git.shuahkh@osg.samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: shuah@kernel.org, bamvor.zhangjian@linaro.org, benh@kernel.crashing.org, paulus@samba.org, dvhart@infradead.org
Cc: Shuah Khan <shuahkh@osg.samsung.com>, viro@zeniv.linux.org.uk, emilio.lopez@collabora.co.uk, mingo@kernel.org, luto@kernel.org, dave.hansen@linux.intel.com, dsafonov@virtuozzo.com, rkrcmar@redhat.com, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

Shuah Khan <shuahkh@osg.samsung.com> writes:

> Add override for lib.mk clean to fix the following warnings from clean
> target run.
>
> Makefile:8: warning: overriding recipe for target 'clean'
> ../lib.mk:55: warning: ignoring old recipe for target 'clean'
>
> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
> ---
>  tools/testing/selftests/splice/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/splice/Makefile b/tools/testing/selftests/splice/Makefile
> index 559512c..3f967ba 100644
> --- a/tools/testing/selftests/splice/Makefile
> +++ b/tools/testing/selftests/splice/Makefile
> @@ -4,5 +4,6 @@ all: $(TEST_PROGS) $(EXTRA)
>  
>  include ../lib.mk
>  
> -clean:
> +override define CLEAN
>  	rm -fr $(EXTRA)
> +endef

Could just be:

EXTRA_CLEAN := $(EXTRA)

cheers
