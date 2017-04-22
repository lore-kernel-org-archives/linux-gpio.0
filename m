From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 8/8] selftests: x86: override clean in lib.mk to fix warnings
Date: Sat, 22 Apr 2017 15:41:26 +1000
Message-ID: <87o9vpyp6h.fsf@concordia.ellerman.id.au>
References: <cover.1492815938.git.shuahkh@osg.samsung.com> <31b94c5cb9a8f71fd3888b648f32c0bd91e4a9bd.1492815938.git.shuahkh@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55743 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1041172AbdDVFl3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 22 Apr 2017 01:41:29 -0400
In-Reply-To: <31b94c5cb9a8f71fd3888b648f32c0bd91e4a9bd.1492815938.git.shuahkh@osg.samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: shuah@kernel.org, bamvor.zhangjian@linaro.org, benh@kernel.crashing.org, paulus@samba.org, dvhart@infradead.org
Cc: Shuah Khan <shuahkh@osg.samsung.com>, viro@zeniv.linux.org.uk, emilio.lopez@collabora.co.uk, mingo@kernel.org, luto@kernel.org, dave.hansen@linux.intel.com, dsafonov@virtuozzo.com, rkrcmar@redhat.com, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

Shuah Khan <shuahkh@osg.samsung.com> writes:

> Add override for lib.mk clean to fix the following warnings from clean
> target run.
>
> Makefile:44: warning: overriding recipe for target 'clean'
> ../lib.mk:55: warning: ignoring old recipe for target 'clean'
>
> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
> ---
>  tools/testing/selftests/x86/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/x86/Makefile b/tools/testing/selftests/x86/Makefile
> index 38e0a9c..4d27550 100644
> --- a/tools/testing/selftests/x86/Makefile
> +++ b/tools/testing/selftests/x86/Makefile
> @@ -40,8 +40,9 @@ all_32: $(BINARIES_32)
>  
>  all_64: $(BINARIES_64)
>  
> -clean:
> +override define CLEAN
>  	$(RM) $(BINARIES_32) $(BINARIES_64)
> +endef

Simpler as:

EXTRA_CLEAN := $(BINARIES_32) $(BINARIES_64)

cheers
