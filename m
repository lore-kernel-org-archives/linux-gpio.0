From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH v2] gpio / ACPI: Add label to the gpio request
Date: Mon, 15 Jun 2015 11:29:04 +0900
Message-ID: <CAAVeFu+dfc3vH73_uhwDftrd0OEYrX0ZiqK1MSAqsCcpKpzRTw@mail.gmail.com>
References: <20150614220057.GC29802@yumi.tdiedrich.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:35532 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752500AbbFOC3Z (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 14 Jun 2015 22:29:25 -0400
In-Reply-To: <20150614220057.GC29802@yumi.tdiedrich.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tobias Diedrich <ranma+kernel@tdiedrich.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Jun 15, 2015 at 7:00 AM, Tobias Diedrich
<ranma+kernel@tdiedrich.de> wrote:
> In leds-gpio.c create_gpio_led only the legacy path propagates the label
> by passing it into devm_gpio_request_one. Similarily gpio_keys_polled.c
> also neglects to propagate the name to the gpio subsystem.
>
> On the newer devicetree/acpi path the label is lost as far as the GPIO
> subsystem goes (it is only retained as name in struct gpio_led.
>
> Amend devm_get_gpiod_from_child to take an additonal (optional) label
> argument and propagate it so it will show up in /sys/kernel/debug/gpio.
>
> So instead of:
>
> GPIOs 288-511, platform/PRP0001:00, AMD SBX00:
>  gpio-475 (?                   ) in  hi
>  gpio-477 (?                   ) out hi
>  gpio-478 (?                   ) out lo
>  gpio-479 (?                   ) out hi
>
> we get the much nicer output:
>
> GPIOs 288-511, platform/PRP0001:00, AMD SBX00:
>  gpio-475 (switch1             ) in  hi
>  gpio-477 (led1                ) out hi
>  gpio-478 (led2                ) out lo
>  gpio-479 (led3                ) out hi

We want to reuse higher-level information (like the con_id) as much as
possible to generate labels, but in the case of
devm_get_gpiod_from_child() there is no such information available
anyway, so why not.

Acked-by: Alexandre Courbot <acourbot@nvidia.com>

Generally speaking this label thing is almost useless, we should now
be able to trace which device requested a GPIO and for what purpose
and provide that complete information in debugfs.
