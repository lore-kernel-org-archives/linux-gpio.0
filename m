From: Michael Welling <mwelling@ieee.org>
Subject: Re: [PATCH 0/6] GPIO character device skeleton
Date: Thu, 22 Oct 2015 13:57:37 -0500
Message-ID: <20151022185737.GA8584@deathstar>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f180.google.com ([209.85.223.180]:36851 "EHLO
	mail-io0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965282AbbJVS5r (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Oct 2015 14:57:47 -0400
Received: by ioll68 with SMTP id l68so102144172iol.3
        for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2015 11:57:47 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Markus Pargmann <mpa@pengutronix.de>, Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>

On Thu, Oct 22, 2015 at 10:32:24AM +0200, Linus Walleij wrote:
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
>

Linus,

I have compiled and tested this patch series on an iMX6 based target.

root@som-imx6q:~# lsgpio
GPIO chip: 209c000.gpio, 32 GPIO lines
GPIO chip: 20a0000.gpio, 32 GPIO lines
GPIO chip: 20a4000.gpio, 32 GPIO lines
GPIO chip: 20a8000.gpio, 32 GPIO lines
GPIO chip: 20ac000.gpio, 32 GPIO lines
GPIO chip: 20b0000.gpio, 32 GPIO lines
GPIO chip: 20b4000.gpio, 32 GPIO lines
root@som-imx6q:~# uname -a
Linux som-imx6q 4.3.0-rc6-next-20151022-dirty #1 SMP Thu Oct 22 09:55:12 CDT 2015 armv7l GNU/Linux

Regards,
Michael
 
> Johan: I don't have a hot-pluggable GPIO controller :( can you
> do me the favour of testing this and fixing my stupid refcounts
> and race conditions? I only used my brain to try to get things
> right with pluggable GPIO controllers in this patch set, and it
> is bound to fail.
> 
> How to identify and manipulate individual GPIO lines from this
> ABI is a *LATER* *QUESTION*, this is the bare essentials for
> getting there: basic operations on the gpiochip device level.
> 
> Linus Walleij (6):
>   gpio: make the gpiochip a real device
>   gpio: refer to gpio device in prints and debugfs
>   gpio: add a userspace chardev ABI for GPIOs
>   tools/gpio: create GPIO tools
>   gpio: add a userspace character device ABI
>   gpio: ABI: mark the sysfs ABI as obsolete
> 
>  Documentation/ABI/obsolete/sysfs-gpio |  30 ++++++
>  Documentation/ABI/testing/gpio-cdev   |  26 +++++
>  Documentation/ABI/testing/sysfs-gpio  |  28 -----
>  MAINTAINERS                           |   4 +
>  drivers/gpio/gpiolib-sysfs.c          |   2 +-
>  drivers/gpio/gpiolib.c                | 193 +++++++++++++++++++++++++++++++---
>  drivers/gpio/gpiolib.h                |  12 +--
>  include/linux/gpio/driver.h           |  11 +-
>  include/uapi/linux/Kbuild             |   1 +
>  include/uapi/linux/gpio.h             |  28 +++++
>  tools/Makefile                        |   7 +-
>  tools/gpio/Makefile                   |  12 +++
>  tools/gpio/gpio-utils.c               |  11 ++
>  tools/gpio/gpio-utils.h               |  25 +++++
>  tools/gpio/lsgpio.c                   | 128 ++++++++++++++++++++++
>  15 files changed, 462 insertions(+), 56 deletions(-)
>  create mode 100644 Documentation/ABI/obsolete/sysfs-gpio
>  create mode 100644 Documentation/ABI/testing/gpio-cdev
>  delete mode 100644 Documentation/ABI/testing/sysfs-gpio
>  create mode 100644 include/uapi/linux/gpio.h
>  create mode 100644 tools/gpio/Makefile
>  create mode 100644 tools/gpio/gpio-utils.c
>  create mode 100644 tools/gpio/gpio-utils.h
>  create mode 100644 tools/gpio/lsgpio.c
> 
> -- 
> 2.4.3
> 
