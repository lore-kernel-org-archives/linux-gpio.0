From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: amd: Add support for additional GPIO
Date: Wed, 30 Nov 2016 14:10:28 +0100
Message-ID: <CACRpkdZrP3BUXZJXunCbWdPuo5qamejFWoz3eA0cEm_kXFPnwg@mail.gmail.com>
References: <MWHPR12MB1357C965EBE3F1161823C223A0B90@MWHPR12MB1357.namprd12.prod.outlook.com>
 <CACRpkdbab3iEwLOucpAz38AJZaEgpO6mrZrLev+YSYuO7Ox_JA@mail.gmail.com>
 <469f529e-818b-392f-9ddb-b02e87e50ca9@amd.com> <CACRpkdbY-2iB9oxHfFOJBmJQq-zmOR1YEg0dy5zdx++tg-acGw@mail.gmail.com>
 <2c12372c-fd6a-8320-2607-5e58ed54d069@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f169.google.com ([209.85.220.169]:35658 "EHLO
        mail-qk0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752557AbcK3NKa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2016 08:10:30 -0500
Received: by mail-qk0-f169.google.com with SMTP id n204so208466126qke.2
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2016 05:10:30 -0800 (PST)
In-Reply-To: <2c12372c-fd6a-8320-2607-5e58ed54d069@amd.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Shah, Nehal-bakulchandra" <Nehal-Bakulchandra.shah@amd.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "gnurou@gmail.com" <gnurou@gmail.com>, "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>

On Tue, Nov 29, 2016 at 7:32 AM, Shah, Nehal-bakulchandra
<Nehal-Bakulchandra.shah@amd.com> wrote:

> This patch provides support for additional GPIO devices and also provides IRQ sharing for AMD's GPIO devices and set
> IRQCHIP_SKIP_SET_WAKE flag.
>
> Reviewed-by: S-k, Shyam-sundar <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Nehal Shah <Nehal-bakulchandra.Shah@amd.com>

(...)
>         struct amd_gpio *gpio_dev;
> +       struct acpi_device *adev = ACPI_COMPANION(&pdev->dev);
> +
> +       ret = kstrtoint(acpi_device_uid(adev), 2, &hwnum);

I guess this is the unique hardware instance number?

>         gpio_dev = devm_kzalloc(&pdev->dev,
>                                 sizeof(struct amd_gpio), GFP_KERNEL);
> @@ -763,16 +771,17 @@ static int amd_gpio_probe(struct platform_device *pdev)
>         gpio_dev->gc.set                        = amd_gpio_set_value;
>         gpio_dev->gc.set_debounce       = amd_gpio_set_debounce;
>         gpio_dev->gc.dbg_show           = amd_gpio_dbg_show;
> +       gpio_dev->gc.base               = gpio_dev->gc.ngpio * hwnum;
>
> -       gpio_dev->gc.base                       = 0;

Please don't do this. Instead set .base to -1 so you get dynamic assignment
of GPIO numbers.

Suggestion: maybe you could augment gc.label to reflect instance number
instead?

That way the stuff from "lsgpio" (tools/gpio/lsgpio.c) will look nice and
identifiable.

Apart from that it looks good.

Yours,
Linus Walleij
