From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 3/8] selftests: futex: override clean in lib.mk to fix
 warnings
Date: Thu, 27 Apr 2017 14:54:37 -0700
Message-ID: <20170427215437.GC29261@fury>
References: <cover.1492815938.git.shuahkh@osg.samsung.com>
 <2ccc4e205a4e25e227e7a90c0037d9e6a6f99ed1.1492815938.git.shuahkh@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:37968 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754292AbdD0VzD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Apr 2017 17:55:03 -0400
Content-Disposition: inline
In-Reply-To: <2ccc4e205a4e25e227e7a90c0037d9e6a6f99ed1.1492815938.git.shuahkh@osg.samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Shuah Khan <shuahkh@osg.samsung.com>
Cc: shuah@kernel.org, bamvor.zhangjian@linaro.org, benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, viro@zeniv.linux.org.uk, emilio.lopez@collabora.co.uk, mingo@kernel.org, luto@kernel.org, dave.hansen@linux.intel.com, dsafonov@virtuozzo.com, rkrcmar@redhat.com, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

On Fri, Apr 21, 2017 at 05:14:45PM -0600, Shuah Khan wrote:
> Add override for lib.mk clean to fix the following warnings from clean
> target run.
> 
> Makefile:36: warning: overriding recipe for target 'clean'
> ../lib.mk:55: warning: ignoring old recipe for target 'clean'
> 
> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
> ---
>  tools/testing/selftests/futex/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/futex/Makefile b/tools/testing/selftests/futex/Makefile
> index c8095e6..e2fbb89 100644
> --- a/tools/testing/selftests/futex/Makefile
> +++ b/tools/testing/selftests/futex/Makefile
> @@ -32,9 +32,10 @@ override define EMIT_TESTS
>  	echo "./run.sh"
>  endef
>  
> -clean:
> +override define CLEAN
>  	for DIR in $(SUBDIRS); do		\
>  		BUILD_TARGET=$(OUTPUT)/$$DIR;	\
>  		mkdir $$BUILD_TARGET  -p;	\
>  		make OUTPUT=$$BUILD_TARGET -C $$DIR $@;\
>  	done
> +endef

Taking the move of clean into lib.mk as a given,

Acked-by: Darren Hart (VMware) <dvhart@infradead.org>

-- 
Darren Hart
VMware Open Source Technology Center
