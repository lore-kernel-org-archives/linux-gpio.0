From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 06/23] gpio: sysfs: clean up chip class-device handling
Date: Mon, 27 Apr 2015 10:47:25 +0200
Message-ID: <20150427084725.GC27877@localhost>
References: <1429630951-27082-1-git-send-email-johan@kernel.org>
 <1429630951-27082-7-git-send-email-johan@kernel.org>
 <CAAVeFuLFc8A7opQXuy0LkTfw1dxjzCgdyCATR0dXv6K=GSOC7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f43.google.com ([209.85.215.43]:33124 "EHLO
	mail-la0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932217AbbD0IrZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Apr 2015 04:47:25 -0400
Content-Disposition: inline
In-Reply-To: <CAAVeFuLFc8A7opQXuy0LkTfw1dxjzCgdyCATR0dXv6K=GSOC7g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Apr 27, 2015 at 12:54:41PM +0900, Alexandre Courbot wrote:
> On Wed, Apr 22, 2015 at 12:42 AM, Johan Hovold <johan@kernel.org> wrote:
> > Clean gpio-chip class device registration and deregistration.
> >
> > The class device is registered when a gpio-chip is added (or from
> > gpiolib_sysfs_init post-core init call), and deregistered when the chip
> > is removed.
> >
> > Store the class device in struct gpio_chip directly rather than do a
> > class-device lookup on deregistration. This also removes the need for
> > the exported flag.
> >
> > Signed-off-by: Johan Hovold <johan@kernel.org>

> > diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> > index f1b36593ec9f..8c26855fc6ec 100644
> > --- a/include/linux/gpio/driver.h
> > +++ b/include/linux/gpio/driver.h
> > @@ -20,6 +20,7 @@ struct seq_file;
> >   * struct gpio_chip - abstract a GPIO controller
> >   * @label: for diagnostics
> >   * @dev: optional device providing the GPIOs
> > + * @cdev: class device (may be NULL)
> 
> Maybe a comment explaining that this field is non-NULL when a chip is
> exported would be useful to understand how it is used in the code?

I've added comments where the field is used. I didn't want to get into
explaining sysfs implementation details in the header file, but the "may
be NULL" is there as a hint to actually look at the code.

And a gpio chip will always be registered with driver core (rather than
"exported" ;) ) until it is removed. [ Currently we also allow for
"late" registration, though. ]

This is related to the issue discussed in my last mail, and again the
plan is to let chip registration be used for more than the sysfs
interface.

Johan
