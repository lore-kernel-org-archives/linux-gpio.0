From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: ppc4xx: drop unused variable
Date: Fri, 01 Apr 2016 13:31:29 +1100
Message-ID: <1459477889.10334.1.camel@ellerman.id.au>
References: <1459408452-3483-1-git-send-email-linus.walleij@linaro.org>
	 <1459418980.24848.1.camel@ellerman.id.au>
	 <CACRpkdbbUfbe6LWVDFsgvne7oOEp7ZzOKr9tX7y-P=J8g7c5=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56267 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752210AbcDACbb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 31 Mar 2016 22:31:31 -0400
In-Reply-To: <CACRpkdbbUfbe6LWVDFsgvne7oOEp7ZzOKr9tX7y-P=J8g7c5=A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Anatolij Gustschin <agust@denx.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, "linuxppc-dev@lists.ozlabs.org list" <linuxppc-dev@lists.ozlabs.org>

On Thu, 2016-03-31 at 14:57 +0200, Linus Walleij wrote:
> On Thu, Mar 31, 2016 at 12:09 PM, Michael Ellerman <mpe@ellerman.id.au> wrote:
> 
> > If you feel like cross building powerpc in future it should be as simple as:
> > 
> >  $ dnf install gcc-powerpc64-linux-gnu || apt-get install gcc-powerpc-linux-gnu
> >  $ make ARCH=powerpc CROSS_COMPILE=powerpc-linux-gnu- ...
> 
> Ah hm yeah I guess everyone "should", it's just that these days I
> mainly rely on Fenguang's kautobuild to do this job for me and
> get back with the result from a plethora of arches.

Sure. That makes sense for all the silly little architectures.

But for powerpc you should really cross compile.

..

:P

> Sometimes a buggy bit slips through the cracks though, sorry
> about that.

No stress.

cheers

