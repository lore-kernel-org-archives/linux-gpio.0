From: Y Vo <yvo@apm.com>
Subject: Re: [PATCH v0] gpio: xgene: add ACPI support for APM X-Gene GPIO
 standby driver
Date: Fri, 29 May 2015 16:42:00 +0700
Message-ID: <CAL4ahLdjea-K10BUJYQjVJmy+AiiJQH6VJKdYKayr=7hHDTbcQ@mail.gmail.com>
References: <1432795588-17476-1-git-send-email-yvo@apm.com>
	<20150529092501.GI1747@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from exprod5og116.obsmtp.com ([64.18.0.147]:34124 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1754319AbbE2JmC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 29 May 2015 05:42:02 -0400
Received: by padbw4 with SMTP id bw4so52011348pad.0
        for <linux-gpio@vger.kernel.org>; Fri, 29 May 2015 02:42:01 -0700 (PDT)
In-Reply-To: <20150529092501.GI1747@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-acpi@vger.kernel.org, Phong Vo <pvo@apm.com>, Toan Le <toanle@apm.com>, Loc Ho <lho@apm.com>, patches <patches@apm.com>

On Fri, May 29, 2015 at 4:25 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Thu, May 28, 2015 at 01:46:28PM +0700, Y Vo wrote:
>> +#ifdef CONFIG_ACPI
>> +     if (priv->nirq > 0) {
>> +             /* Register interrupt handlers for gpio signaled acpi events */
>> +             acpi_gpiochip_request_interrupts(&priv->bgc.gc);
>> +     }
>> +#endif
>
> You don't need to check CONFIG_ACPI as acpi_gpiochip_request_interrupts()
> will be stubbed out if !CONFIG_ACPI.
I will remove this check.
>
> Should you call acpi_gpiochip_free_interrupts() somewhere to unregister
> the interrupts as well?
I will add this to xgene_gpio_sb_remove function.

>
> Even better if you can switch your driver to use GPIOLIB_IRQCHIP all
> this is done automatically for you.
