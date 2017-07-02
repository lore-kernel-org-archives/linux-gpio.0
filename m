From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC] gpio: about the need to manage irq mapping dynamically.
Date: Sun, 2 Jul 2017 17:01:11 +0200
Message-ID: <CACRpkdbcKGu7n3qRZegHvkXLXpRo4XTO3rUs7K61+cmyKrwa9w@mail.gmail.com>
References: <1497543642.3086.35.camel@baylibre.com> <CACRpkdZWw_-joPT4CJ-RAJ31s4BxuE6vusjg5YnZWaHtkRg5+w@mail.gmail.com>
 <1497954416.7387.1.camel@baylibre.com> <CACRpkdZu74aAsu8hggxsfffQPMk0nqihCSfuMaMbf+-4EFSYYA@mail.gmail.com>
 <1497979438.7387.10.camel@baylibre.com> <CACRpkdZ2cqUgMwOFG+9JVyAOxYTfHYa3+yrUzUozLpYD87KdOQ@mail.gmail.com>
 <1498141515.7387.16.camel@baylibre.com> <0e12f9bd-4e0b-c602-5627-5dbda5371dee@ti.com>
 <1498587929.25567.12.camel@baylibre.com> <657221fa-c6b3-e914-1a81-9a48972ee6d5@ti.com>
 <CACRpkdar9YwnMgLb1y1sP1Vbg-1MgPAOcRPcfNCtmpKuf+g+kQ@mail.gmail.com> <f8495533-b53f-8999-9320-38f18ca7691b@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f173.google.com ([209.85.223.173]:33862 "EHLO
        mail-io0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751635AbdGBPBO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 2 Jul 2017 11:01:14 -0400
Received: by mail-io0-f173.google.com with SMTP id r36so43939478ioi.1
        for <linux-gpio@vger.kernel.org>; Sun, 02 Jul 2017 08:01:13 -0700 (PDT)
In-Reply-To: <f8495533-b53f-8999-9320-38f18ca7691b@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Kevin Hilman <khilman@baylibre.com>, Linux Kernel <linux-kernel@vger.kernel.org>

On Fri, Jun 30, 2017 at 9:54 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:
> On 06/29/2017 09:16 AM, Linus Walleij wrote:
>> On Tue, Jun 27, 2017 at 10:43 PM, Grygorii Strashko
>> <grygorii.strashko@ti.com> wrote:
>>
>>> And my opinion is still the same here - It should be perfectly valid to create
>>> mappings from gpio_to_irq() to handle properly orthogonality of gpiochip and
>>> gpio-irqchip functionality and satisfy SPARSE_IRQ goal (allocate Linux virq and
>>> irq descriptors on demand).
>>
>> You are right.
>>
>> I would rather say: GPIO drivers that have a 1-to-1 mapping between GPIO
>> lines and IRQs should not do it, they should map up them all at probe().
>>
>
> Sry, can't completely agree here :( There could be 300 (or even thousands)
> of gpios and only dozen of them will be used as GPIO IRQ, so statical mapping will
> just waste system resources. So, better not define such kind of restrictions -
> it seems platform/system specific.

If there could, yeah.

But the majority of the worlds systems use a hardcoded value of 512 GPIOs.

See include/asm-generic/gpio.h:

#ifndef ARCH_NR_GPIOS
#if defined(CONFIG_ARCH_NR_GPIO) && CONFIG_ARCH_NR_GPIO > 0
#define ARCH_NR_GPIOS CONFIG_ARCH_NR_GPIO
#else
#define ARCH_NR_GPIOS           512
#endif
#endif

The only arch that overrides this is ARM, which has CONFIG_ARCH_NR_GPIO:

# The GPIO number here must be sorted by descending number. In case of
# a multiplatform kernel, we just want the highest value required by the
# selected platforms.
config ARCH_NR_GPIO
        int
        default 1024 if ARCH_BRCMSTB || ARCH_SHMOBILE || ARCH_TEGRA || \
                ARCH_ZYNQ
        default 512 if ARCH_EXYNOS || ARCH_KEYSTONE || SOC_OMAP5 || \
                SOC_DRA7XX || ARCH_S3C24XX || ARCH_S3C64XX || ARCH_S5PV210
        default 416 if ARCH_SUNXI
        default 392 if ARCH_U8500
        default 352 if ARCH_VT8500
        default 288 if ARCH_ROCKCHIP
        default 264 if MACH_H4700
        default 0
        help
          Maximum number of GPIOs in the system.

          If unsure, leave the default value.

So actually, noone use more than 1024 GPIOs.

For each GPIO a descriptor of 16 bytes is allocated. So in worst case 16KiB.

Also this is an upper cap: it just means the nax we have on any platform is 1024
statically allocated GPIO descriptors, not that they all get mapped to IRQs.
That happens on a per-gpiochip basis.

But every irq descriptor is pretty big (somewhere around 64+ bytes), so you have
a point.

If every GPIO allocates an IRQ descriptor, it may add up to as much as 64KiB
on a machine with 1024 GPIOs.

Yours,
Linus Walleij
