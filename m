From: Tien Hock Loh <thloh@altera.com>
Subject: Re: [PATCH] dt-bindings: gpio: altera: Fix altr,interrupt-type
 property
Date: Tue, 1 Mar 2016 00:17:57 -0800
Message-ID: <1456820277.5100.3.camel@ubuntu>
References: <1456762997-7607-1-git-send-email-marex@denx.de>
	 <56D4EEE9.3060308@electromag.com.au> <56D4F097.3000105@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-by2on0099.outbound.protection.outlook.com ([207.46.100.99]:42144
	"EHLO na01-by2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751036AbcCAISQ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Mar 2016 03:18:16 -0500
In-Reply-To: <56D4F097.3000105@denx.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "marex@denx.de" <marex@denx.de>
Cc: Phil Reid <preid@electromag.com.au>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

Hey Marex, Phil

Sorry for the late reply, something went wrong with my open source mail
account. 

Yes the tool needs to be fixed, we're expecting to fix it once
socfpga-4.1 LTSi branch is ready to be released. We don't fix it now to
keep it compatible with the "old and released" socfpga-3.10-ltsi branch.

Thanks

On Tue, 2016-03-01 at 02:29 +0100, marex@denx.de wrote:
> On 03/01/2016 02:22 AM, Phil Reid wrote:
> > On 1/03/2016 12:23 AM, Marek Vasut wrote:
> >> The altr,interrupt-trigger property is not used by the driver.
> >> Instead, altr,interrupt-type is used by the driver and the driver
> >> does not probe if this property is not specified. Therefore, it
> >> is expected that there are no users of the -trigger property in
> >> the wild and that this is a typo in the documentation for the
> >> altera-pio controller. This patch fixes the typo.
> >>
> > 
> > On a related note. The Altera QSYS 15.0 device tree tools generate this
> > label this as altr,interrupt_type
> 
> Aaaaaaargh :-(
> 
> > Note: '_' instead of '-'.
> > I've locally patch the driver to look for both names.
> > Not sure if this is something that should be fixed in the driver or
> > require user to to post process the generated dts.
> > 
> > I haven't reported the issue to Altera either.
> 
> It's the tools which should be fixed in this case.
> 
> Since mainline does not mention this binding with '_' anywhere, it's not
> part of ABI and I would really go for fixing the tools in this case.
> 
> Thanks for the report!

