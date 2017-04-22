From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 2/8] selftests: lib.mk: define CLEAN macro to allow Makefiles to override clean
Date: Sat, 22 Apr 2017 15:38:46 +1000
Message-ID: <87zif9ypax.fsf@concordia.ellerman.id.au>
References: <cover.1492815938.git.shuahkh@osg.samsung.com> <b39e21f8c47318d82be999aae310bdf6bcfc9bb9.1492815938.git.shuahkh@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51919 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1040866AbdDVFit (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 22 Apr 2017 01:38:49 -0400
In-Reply-To: <b39e21f8c47318d82be999aae310bdf6bcfc9bb9.1492815938.git.shuahkh@osg.samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: shuah@kernel.org, bamvor.zhangjian@linaro.org, benh@kernel.crashing.org, paulus@samba.org, dvhart@infradead.org
Cc: Shuah Khan <shuahkh@osg.samsung.com>, viro@zeniv.linux.org.uk, emilio.lopez@collabora.co.uk, mingo@kernel.org, luto@kernel.org, dave.hansen@linux.intel.com, dsafonov@virtuozzo.com, rkrcmar@redhat.com, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

Shuah Khan <shuahkh@osg.samsung.com> writes:

> Define CLEAN macro to allow Makefiles to override common clean target
> in lib.mk. This will help fix the following failures:
>
> warning: overriding recipe for target 'clean'
> ../lib.mk:55: warning: ignoring old recipe for target 'clean'
>
> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>

Should probably have:

Fixes: 88baa78d1f31 ("selftests: remove duplicated all and clean target")


In hindsight I'm not sure moving the clean target into lib.mk was
the best idea, but anyway it's a bit late to change our mind on that.

This patch is a good solution to fix the warnings.

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers
