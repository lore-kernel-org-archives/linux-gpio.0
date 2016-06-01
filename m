From: Michael Welling <mwelling@ieee.org>
Subject: Re: [PATCH 2/2] tools/gpio: add the gpio-hammer tool
Date: Wed, 1 Jun 2016 13:09:06 -0500
Message-ID: <20160601180906.GA5286@deathstar>
References: <1461660866-18683-1-git-send-email-linus.walleij@linaro.org>
 <1461660866-18683-2-git-send-email-linus.walleij@linaro.org>
 <20160427160034.GA20392@deathstar>
 <CACRpkdYr8GSmQ-=G4XcTtfrBcKsXUsJOvE7W35Fk-ovDiyaPJA@mail.gmail.com>
 <20160601034343.GA3749@deathstar>
 <CACRpkdZrdwPwnLDnHfBxEi67cUsfUAo+ugHnZWxywg5Vjdzghw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:33743 "EHLO
	mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751624AbcFASJU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jun 2016 14:09:20 -0400
Received: by mail-pf0-f193.google.com with SMTP id b124so4805702pfb.0
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jun 2016 11:09:20 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CACRpkdZrdwPwnLDnHfBxEi67cUsfUAo+ugHnZWxywg5Vjdzghw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Markus Pargmann <mpa@pengutronix.de>, Lee Campbell <leecam@google.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Johan Hovold <johan@kernel.org>

On Wed, Jun 01, 2016 at 07:35:28PM +0200, Linus Walleij wrote:
> On Wed, Jun 1, 2016 at 5:43 AM, Michael Welling <mwelling@ieee.org> wrote:
> 
> > Did you ever find a solution for the exhausted char dev problem?
> 
> Not really. It seems it turned up that all systems that bugged were randomly
> generated QEMU models, not real systems.
> 
> They were also really doing far out stuff already, overwriting existing chardevs
> all over the place, which can be seen in logs after commit
> 49db08c35887 "chrdev: emit a warning when we go below dynamic major range"
> which I got merged.
>

Yeah I noticed that their config was pretty crazy.
 
> I'm now working on an event ABI so we get feature complete and also surpass
> the old sysfs.
>

Okay I will review and test it when the patch shows up.

Is there a way to name a group of GPIOs?

It seems you are passing around a byte of data for each GPIO state.
Is there a reason why the bits couldn't bit masked into single variable
given the max number of handles is 64?

> Yours,
> Linus Walleij
