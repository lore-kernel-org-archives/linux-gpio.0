From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/6] GPIO character device skeleton
Date: Fri, 30 Oct 2015 20:47:14 +0100
Message-ID: <CACRpkdaKO=L7+73OqnTYjs71F0-UEGTLy4=wszaXEro4dbKfcw@mail.gmail.com>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
	<CAAVeFu+FfgM7tUa0_mWaqQfDiKp2o5TT+ggyAK+yRW4cgHemsw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:36786 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755102AbbJ3TrP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Oct 2015 15:47:15 -0400
Received: by obcqt19 with SMTP id qt19so52651424obc.3
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2015 12:47:15 -0700 (PDT)
In-Reply-To: <CAAVeFu+FfgM7tUa0_mWaqQfDiKp2o5TT+ggyAK+yRW4cgHemsw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>

On Fri, Oct 30, 2015 at 2:55 AM, Alexandre Courbot <gnurou@gmail.com> wrote:

> I see where we are going with the general idea and it would be nice to
> finally get things right. Actually despite my initial reserves I am
> starting to grow fond of this idea now that I see the code (tested
> with success on Tegra K1 btw).

Thanks, give me your lsgpio :)

> * This series creates one device per GPIO chip. I suppose that a
> future ioctl will allow the user to change the state of a set of GPIOs
> in one single syscall (mirroring gpiod_set_array_value()).

Yeah that is mentioned somewhere even, I think.

> In the
> world of cute embedded nonsense, it is unfortunately not rare to have
> related GPIOs (that we will want to change relatively at the same
> time) on different chips. Such scenarios would require several ioctls
> to update the set of GPIOs. Are we cool with this, or would we prefer
> one global GPIO device that manages all chips and returns user-space
> GPIO descriptors that mirror the kernel API more closely?

Since GPIO chips need to be hot-pluggable (example: USB
expanders) I don't see this happening.

These systems should have not divided their stuff into different
devices/gpiochips in that case, and instead insisted to have one
device with many "banks".

Overall the assumptions to the kernel-intenal multiple-line API
assume any lines switched at the same time need to be in the
same "unsigned long" anyway. Typically a u32.

> * For all the justified hate that sysfs got, it had the advantage of
> being directly accessible using only the shell. If we replace it with
> a character device interface, I think we will need a "libgpio" (that
> provides easy access to C programs) and "gpio-tools" (simple
> command-line tools that provide functionality similar to the sysfs
> interface). Are we ready to start and maintain these? Granted, it
> should not be too much work, but it's still an extra.

I think the raw ioctl()s will be simple enough and intend to use
the tools/gpio/* as proper examples. If we need
tools/gpio/swiss-army-knife.c we will add it too.

ALSA and fbdev and MESA and libusb spawned huge userspace
libs, but I hope this ioctl() ABI will be simple enough that apps
can use it directly without a lib. But what do I know.

> How these will be shaped will of course depend on how individual GPIOs
> are represented in user-space. Security will be a concern, so let's
> make sure we don't return global integer descriptors for these. ;)

First-come-first-gets-to-use-it seems to be how chardevs etc
are handled. I imagine there will be ONE program using the gpiochip,
else userspace have to come up with an arbitration daemon too.

Yours,
Linus Walleij
