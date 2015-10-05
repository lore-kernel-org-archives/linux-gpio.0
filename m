From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] gpio: keep the GPIO line names internal
Date: Mon, 5 Oct 2015 11:01:47 +0100
Message-ID: <20151005100147.GB25143@localhost>
References: <1443050853-24601-1-git-send-email-linus.walleij@linaro.org>
 <20151004133742.GO4284@localhost>
 <CACRpkdaB=Sne1Vq=apQE5r8FDvfvQ-4w0nths-dVnuJvBaGDOA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:36065 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752053AbbJEKAh (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Oct 2015 06:00:37 -0400
Received: by wicgb1 with SMTP id gb1so111491314wic.1
        for <linux-gpio@vger.kernel.org>; Mon, 05 Oct 2015 03:00:35 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CACRpkdaB=Sne1Vq=apQE5r8FDvfvQ-4w0nths-dVnuJvBaGDOA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Markus Pargmann <mpa@pengutronix.de>

On Mon, Oct 05, 2015 at 10:54:52AM +0200, Linus Walleij wrote:
> On Sun, Oct 4, 2015 at 3:37 PM, Johan Hovold <johan@kernel.org> wrote:
> 
> > This looks good (apart from the checkpatch warning for the warning
> > message string).
> 
> Yeah the GPIO maintainer is liberal about that rule...

Heh. I'm sticking to the 80 column limit too, but having grepable error
messages do have its merit.

> > You also need to revert ddd5404007b8 ("gpio-sysfs: Use gpio descriptor
> > name instead of gpiochip names array") however as this is an ABI change.
> > Otherwise pins with a name in DT will now be exported using the gpio name
> > rather than number as they used to be. [ The current behaviour is
> > maintained by exporting names from chip->names for hard coded names
> > only. ]
> 
> I think it is ABI-correct: it uses desc->name if that is set, and
> currently that is only set from chip->names[] so status quo.

Yes, but this work was aiming at generalising the hogs so that they
could later be requested (and exported), right?

This means that a pin used today from userspace, can not be initialised
using this mechanism without breaking the ABI.

My suggestion is to leave gpiolib-sysfs.c as is, and make sure to limit
the name export to legacy board files as before.

Thanks,
Johan
