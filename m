From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 0/6] GPIO character device skeleton
Date: Fri, 30 Oct 2015 10:55:17 +0900
Message-ID: <CAAVeFu+FfgM7tUa0_mWaqQfDiKp2o5TT+ggyAK+yRW4cgHemsw@mail.gmail.com>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f180.google.com ([209.85.213.180]:35076 "EHLO
	mail-ig0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758040AbbJ3Bzh (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Oct 2015 21:55:37 -0400
Received: by igpw7 with SMTP id w7so1949178igp.0
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2015 18:55:36 -0700 (PDT)
In-Reply-To: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>

Hi Linus,

On Thu, Oct 22, 2015 at 5:32 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> OK so this is it, I had no patience waiting for users to come up
> with this new ABI, and the requests for a way for userspace to
> use GPIOs properly is coming up again and again. So I created the
> basics for it, so we can then build on top of this to get things
> right. I want to get these very first things right before we go
> wild with setting/getting pin values etc.
>
> We add ONE ioctl() to get information on the gpiochip. Now we can
> do this (example from ux500):
>
> root@Ux500:/ lsgpio
> GPIO chip: a03fe000.gpio, 32 GPIO lines
> GPIO chip: 8011e080.gpio, 32 GPIO lines
> GPIO chip: 8011e000.gpio, 32 GPIO lines
> GPIO chip: 8000e180.gpio, 32 GPIO lines
> GPIO chip: 8000e100.gpio, 32 GPIO lines
> GPIO chip: 8000e080.gpio, 32 GPIO lines
> GPIO chip: 8000e000.gpio, 32 GPIO lines
> GPIO chip: 8012e080.gpio, 32 GPIO lines
> GPIO chip: 8012e000.gpio, 32 GPIO lines
> GPIO chip: abx500-gpio, 42 GPIO lines
> GPIO chip: tc3589x, 20 GPIO lines

I see where we are going with the general idea and it would be nice to
finally get things right. Actually despite my initial reserves I am
starting to grow fond of this idea now that I see the code (tested
with success on Tegra K1 btw).

Here are a few general questions:

* This series creates one device per GPIO chip. I suppose that a
future ioctl will allow the user to change the state of a set of GPIOs
in one single syscall (mirroring gpiod_set_array_value()). In the
world of cute embedded nonsense, it is unfortunately not rare to have
related GPIOs (that we will want to change relatively at the same
time) on different chips. Such scenarios would require several ioctls
to update the set of GPIOs. Are we cool with this, or would we prefer
one global GPIO device that manages all chips and returns user-space
GPIO descriptors that mirror the kernel API more closely?

* For all the justified hate that sysfs got, it had the advantage of
being directly accessible using only the shell. If we replace it with
a character device interface, I think we will need a "libgpio" (that
provides easy access to C programs) and "gpio-tools" (simple
command-line tools that provide functionality similar to the sysfs
interface). Are we ready to start and maintain these? Granted, it
should not be too much work, but it's still an extra.

How these will be shaped will of course depend on how individual GPIOs
are represented in user-space. Security will be a concern, so let's
make sure we don't return global integer descriptors for these. ;)
