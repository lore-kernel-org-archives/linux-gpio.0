From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] gpio: keep the GPIO line names internal
Date: Mon, 5 Oct 2015 11:07:03 +0100
Message-ID: <20151005100703.GC25143@localhost>
References: <1443050853-24601-1-git-send-email-linus.walleij@linaro.org>
 <20151004133742.GO4284@localhost>
 <20151005094704.GG19355@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f173.google.com ([209.85.212.173]:33060 "EHLO
	mail-wi0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752173AbbJEKGJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Oct 2015 06:06:09 -0400
Received: by wiclk2 with SMTP id lk2so112363292wic.0
        for <linux-gpio@vger.kernel.org>; Mon, 05 Oct 2015 03:06:08 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20151005094704.GG19355@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Johan Hovold <johan@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>

On Mon, Oct 05, 2015 at 11:47:04AM +0200, Markus Pargmann wrote:
> On Sun, Oct 04, 2015 at 03:37:42PM +0200, Johan Hovold wrote:

> > You also need to revert ddd5404007b8 ("gpio-sysfs: Use gpio descriptor
> > name instead of gpiochip names array") however as this is an ABI change.  
> > Otherwise pins with a name in DT will now be exported using the gpio name
> > rather than number as they used to be. [ The current behaviour is
> > maintained by exporting names from chip->names for hard coded names
> > only. ]
> 
> Even for GPIOs from DT it is not a ABI change. The only GPIOs that have
> a GPIO name at the moment are using the GPIO hogging mechanism. But
> hogged GPIOs can't be exported to userspace so there is no difference
> for these.

Yes, but you're aiming at generalising the hogging mechanism so that
such pins can be requested, and that would break the ABI.

Let's keep the legacy chip->names and named-gpio exports separate from
defining line names in DT for now.

Thanks,
Johan
