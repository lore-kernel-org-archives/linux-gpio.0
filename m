From: Ray Jui <rjui@broadcom.com>
Subject: Re: [PATCH RFC/RFT 0/2] gpio: allow auto population of request/free
Date: Tue, 13 Oct 2015 13:31:12 -0700
Message-ID: <561D6A10.1070801@broadcom.com>
References: <1444578499-17980-1-git-send-email-jogo@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw2-out.broadcom.com ([216.31.210.63]:43415 "EHLO
	mail-gw2-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753025AbbJMUbg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Oct 2015 16:31:36 -0400
In-Reply-To: <1444578499-17980-1-git-send-email-jogo@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jonas Gorski <jogo@openwrt.org>, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, Pramod KUMAR <pramodku@broadcom.com>, =?UTF-8?Q?Kader_Y=c4=b1lmaz?= <kaderyilmaz.92@hotmail.com>, Vikram Prakash <vikramp@broadcom.com>, Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>

Adding Broadcom engineers who are currently working on expanding this
Cygnus GPIO driver to support more SoCs.

On 10/11/2015 8:48 AM, Jonas Gorski wrote:
> Many pinctrl/gpio combinations are fine with the generic gpio
> request/free implementations, and some only have a subset of the
> gpios actually support muxed.
> 
> The common occurrence is
> 
> a) populate request/free of gpiochip
> b) if only some gcs have pinmux, store for the chip if it does
>    and call pinctrl_request/free conditionally
> c) register gpiochip
> d) add ranges to chip
> 
> To reduce the amount of work for the drivers, introduce a
> gpiochip_add_with_ranges(), that allows doing c and d at the same time.
> 
> Since gpiochip_add_with_ranges then has the information at hand whether
> the chip ties into the pinctrl subsystem, we can then also automatically
> populate the gpiochip's request/free in case ranges were passed or a
> gpio range property is present on the of node of the chip. This handles
> a) and b) for most known drivers.
> 
> This patchset is a proof-of-concept, with the pinctrl-cygnus-gpio driver
> as the example conversion to it. It registers a total of 51 gpio ranges,
> which I thought as an ideal maximum reduction example.

There's a bit complication here. Internally within Broadcom, the current
Cygnus GPIO driver is undergoing a lot of changes to make it more
generic, to support all other Broadcom iProc based SoCs that use the
same GPIO controller.

One of the changes we made is to make use of the DT based gpio-ranges
properly, i.e., we are setting GPIO->pinmux mapping in device tree
instead of hardcoded in the driver. This feature is already supported by
of_gpiochip_add_pin_range, called by of_gpiochip_add, called by
gpiochip_add.

Due to this, I'm not sure if the Cygnus GPIO driver is suitable as an
example for this change.

The internal work of the changes on this Cygnus GPIO driver is close to
be done and can be upstreamed very soon (e.g., sometime this week or
early next week).

Linus, please advise how we should proceed with this.

> 
> This patchset depends on "gpiochip: add and use generic request/free".
> 
> As last time only build tested, not run tested due to lacking hardware.
> 
> A few points of disscussion:
> 
> So far I have just reused the struct pinctrl_gpio_range, but ignore most
> fields, which might bloat the kernel a bit. OTOH 0's should compress
> fine.
> 
> Also currently the code assumes all ranges are handled by the same
> pinctrl device. Currently this could be trivially fixed as
> pinctrl_gpio_range has a field for the pinctrl device name.
> 
> So far I have assumed there are no actual platorms with such a setup.
> 
> 
> Jonas Gorski (2):
>   gpio: allow atomic registration of gpio chip with pin ranges
>   pinctrl-cygnus-gpio: convert to use gpiochip_add_with_ranges
> 
>  drivers/gpio/gpiolib-of.c                 |   5 ++
>  drivers/gpio/gpiolib.c                    |  43 ++++++++--
>  drivers/gpio/gpiolib.h                    |   9 +++
>  drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c | 126 +++++++-----------------------
>  include/linux/gpio/driver.h               |  10 ++-
>  5 files changed, 85 insertions(+), 108 deletions(-)
> 
