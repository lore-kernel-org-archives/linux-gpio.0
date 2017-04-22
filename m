From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 7/8] selftests: sync: override clean in lib.mk to fix warnings
Date: Sat, 22 Apr 2017 15:41:02 +1000
Message-ID: <87r30lyp75.fsf@concordia.ellerman.id.au>
References: <cover.1492815938.git.shuahkh@osg.samsung.com> <dc66a97137df1b6a913463775466a96e0f3c13db.1492815938.git.shuahkh@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48561 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1040723AbdDVFlE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 22 Apr 2017 01:41:04 -0400
In-Reply-To: <dc66a97137df1b6a913463775466a96e0f3c13db.1492815938.git.shuahkh@osg.samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: shuah@kernel.org, bamvor.zhangjian@linaro.org, benh@kernel.crashing.org, paulus@samba.org, dvhart@infradead.org
Cc: Shuah Khan <shuahkh@osg.samsung.com>, viro@zeniv.linux.org.uk, emilio.lopez@collabora.co.uk, mingo@kernel.org, luto@kernel.org, dave.hansen@linux.intel.com, dsafonov@virtuozzo.com, rkrcmar@redhat.com, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

Shuah Khan <shuahkh@osg.samsung.com> writes:

> Add override for lib.mk clean to fix the following warnings from clean
> target run.
>
> Makefile:24: warning: overriding recipe for target 'clean'
> ../lib.mk:55: warning: ignoring old recipe for target 'clean'
>
> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
> ---
>  tools/testing/selftests/sync/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/sync/Makefile b/tools/testing/selftests/sync/Makefile
> index 87ac400..f7d250d 100644
> --- a/tools/testing/selftests/sync/Makefile
> +++ b/tools/testing/selftests/sync/Makefile
> @@ -20,5 +20,6 @@ TESTS += sync_stress_merge.o
>  
>  sync_test: $(OBJS) $(TESTS)
>  
> -clean:
> +override define CLEAN
>  	$(RM) sync_test $(OBJS) $(TESTS)
> +endef

EXTRA_CLEAN := sync_test $(OBJS) $(TESTS)

cheers
