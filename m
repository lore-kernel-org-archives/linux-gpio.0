From: Alexander Stein <alexanders83@web.de>
Subject: Re: Re: [PATCH v2 00/63] Allow compile testing of most gpio drivers
Date: Mon, 11 Apr 2016 20:01:22 +0200
Message-ID: <5292489.ilMSvEcqfC@kongar>
References: <1459877772-11289-1-git-send-email-alexanders83@web.de> <CACRpkdZAfa34PSKniVhRbJFYCy=+1M6QSaucVFWHDzZw4DFFLg@mail.gmail.com> <CACRpkdbA1vShcBkbi0ap=8V3i0RV91tMKppOPd4sLNLtqLU9QQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.4]:58317 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752464AbcDKSBb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 11 Apr 2016 14:01:31 -0400
In-Reply-To: <CACRpkdbA1vShcBkbi0ap=8V3i0RV91tMKppOPd4sLNLtqLU9QQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Monday 11 April 2016, 09:01:45 wrote Linus Walleij:
> On Fri, Apr 8, 2016 at 2:24 PM, Linus Walleij <linus.walleij@linaro.org> 
wrote:
> > Let's see what happens.
> 
> As it turns out, it makes things explode to the left and right on
> the build servers.
> 
> I guess we need to trickle in a few patches at a time, while
> fixing the compile errors they raise.
> 
> Unfortunately the build servers have this tendency to shoot
> the messenger, but on the other hand, if we churn through them,
> drivers get fixed. Mostly Kconfig stuff it seems?

Good to see this actually raises some errors.
Especially the blackfin errors related error appear to be Kconfig related.
x86_64 errors are storing/restoring 32 bit integers in pointers.
arm, sparc and i386 can be fixed by adding COMPILED_TEST to amba and 
mfd/intel_msic. Dunno what would be a good approach.

Best regards,
Alexander

