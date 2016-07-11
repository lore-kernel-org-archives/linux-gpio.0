From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/1] gpio: merrifield: Introduce GPIO driver to support Merrifield
Date: Mon, 11 Jul 2016 11:06:33 +0200
Message-ID: <CACRpkdZVvdTy6VRLEUQ_p_G3Eio-afY8czVaRAhPJn0_cCYw4A@mail.gmail.com>
References: <1467976103-133151-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:35156 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751847AbcGKJGe (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Jul 2016 05:06:34 -0400
Received: by mail-oi0-f54.google.com with SMTP id r2so138820313oih.2
        for <linux-gpio@vger.kernel.org>; Mon, 11 Jul 2016 02:06:34 -0700 (PDT)
In-Reply-To: <1467976103-133151-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, David Cohen <david.a.cohen@linux.intel.com>, "Wood, Brian J" <brian.j.wood@intel.com>

On Fri, Jul 8, 2016 at 1:08 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Intel Merrifield platform has a special GPIO controller to drive pads when they
> are muxed in corresponding mode.
>
> Intel Merrifield GPIO IP is slightly different here and there in comparison to
> the older Intel MID platforms. These differences include in particular the
> shaked register offsets, specific support of level triggered interrupts and
> wake capable sources, as well as a pinctrl which is a separate IP.
>
> Instead of uglifying existing driver I decide to provide a new one slightly
> based on gpio-intel-mid.c. So, anyone can easily compare what changes are
> happened to be here.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

That is a nice driver.

I'm especially fond of the way you carefully handle the edge vs
level IRQs, good job.

> +static const struct mrfld_gpio_pinrange mrfld_gpio_ranges[] = {
> +       GPIO_PINRANGE(0, 11, 146),
> +       GPIO_PINRANGE(12, 13, 144),
> +       GPIO_PINRANGE(14, 15, 35),
> +       GPIO_PINRANGE(16, 16, 164),
> +       GPIO_PINRANGE(17, 18, 105),
> +       GPIO_PINRANGE(19, 22, 101),
> +       GPIO_PINRANGE(23, 30, 107),
> +       GPIO_PINRANGE(32, 43, 67),
> +       GPIO_PINRANGE(44, 63, 195),
> +       GPIO_PINRANGE(64, 67, 140),
> +       GPIO_PINRANGE(68, 69, 165),
> +       GPIO_PINRANGE(70, 71, 65),
> +       GPIO_PINRANGE(72, 76, 228),
> +       GPIO_PINRANGE(77, 86, 37),
> +       GPIO_PINRANGE(87, 87, 48),
> +       GPIO_PINRANGE(88, 88, 47),
> +       GPIO_PINRANGE(89, 96, 49),
> +       GPIO_PINRANGE(97, 97, 34),
> +       GPIO_PINRANGE(102, 119, 83),
> +       GPIO_PINRANGE(120, 123, 79),
> +       GPIO_PINRANGE(124, 135, 115),
> +       GPIO_PINRANGE(137, 142, 158),
> +       GPIO_PINRANGE(154, 163, 24),
> +       GPIO_PINRANGE(164, 176, 215),
> +       GPIO_PINRANGE(177, 189, 127),
> +       GPIO_PINRANGE(190, 191, 178),
> +};

In device tree we put this into the hardware description (the device tree),
and I'm expecting ACPI to come up with something similar, but I guess that
for a pure PCI device you have no choice but to do it this way.

And you also do it the elegant way by associating with the gpiochip
rather than the other way around from the pin controller side.

Patch applied with Mika's review tag.

Yours,
Linus Walleij
