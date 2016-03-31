From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] powerpc: ppc4xx: drop unused variable
Date: Thu, 31 Mar 2016 14:57:49 +0200
Message-ID: <CACRpkdbbUfbe6LWVDFsgvne7oOEp7ZzOKr9tX7y-P=J8g7c5=A@mail.gmail.com>
References: <1459408452-3483-1-git-send-email-linus.walleij@linaro.org>
	<1459418980.24848.1.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:36397 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756739AbcCaM5u (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Mar 2016 08:57:50 -0400
Received: by mail-oi0-f54.google.com with SMTP id r187so58860450oih.3
        for <linux-gpio@vger.kernel.org>; Thu, 31 Mar 2016 05:57:50 -0700 (PDT)
In-Reply-To: <1459418980.24848.1.camel@ellerman.id.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Anatolij Gustschin <agust@denx.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, "linuxppc-dev@lists.ozlabs.org list" <linuxppc-dev@lists.ozlabs.org>

On Thu, Mar 31, 2016 at 12:09 PM, Michael Ellerman <mpe@ellerman.id.au> wrote:

> If you feel like cross building powerpc in future it should be as simple as:
>
>  $ dnf install gcc-powerpc64-linux-gnu || apt-get install gcc-powerpc-linux-gnu
>  $ make ARCH=powerpc CROSS_COMPILE=powerpc-linux-gnu- ...

Ah hm yeah I guess everyone "should", it's just that these days I
mainly rely on Fenguang's kautobuild to do this job for me and
get back with the result from a plethora of arches.

Sometimes a buggy bit slips through the cracks though, sorry
about that.

Yours,
Linus Walleij
