From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: amd: Add support for additional GPIO
Date: Fri, 2 Dec 2016 13:46:42 +0100
Message-ID: <CACRpkdZPk=gRcHLUbbUwtpriZKT-LGC+UfyEOyo1OGm+dNwZ0w@mail.gmail.com>
References: <MWHPR12MB1357C965EBE3F1161823C223A0B90@MWHPR12MB1357.namprd12.prod.outlook.com>
 <CACRpkdbab3iEwLOucpAz38AJZaEgpO6mrZrLev+YSYuO7Ox_JA@mail.gmail.com>
 <469f529e-818b-392f-9ddb-b02e87e50ca9@amd.com> <CACRpkdbY-2iB9oxHfFOJBmJQq-zmOR1YEg0dy5zdx++tg-acGw@mail.gmail.com>
 <2c12372c-fd6a-8320-2607-5e58ed54d069@amd.com> <CACRpkdZrP3BUXZJXunCbWdPuo5qamejFWoz3eA0cEm_kXFPnwg@mail.gmail.com>
 <4e82b02a-6f9c-1130-1020-32a6f86a5f01@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f169.google.com ([209.85.216.169]:36097 "EHLO
        mail-qt0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759560AbcLBMqp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Dec 2016 07:46:45 -0500
Received: by mail-qt0-f169.google.com with SMTP id w33so250033560qtc.3
        for <linux-gpio@vger.kernel.org>; Fri, 02 Dec 2016 04:46:43 -0800 (PST)
In-Reply-To: <4e82b02a-6f9c-1130-1020-32a6f86a5f01@amd.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Shah, Nehal-bakulchandra" <Nehal-Bakulchandra.shah@amd.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "gnurou@gmail.com" <gnurou@gmail.com>, "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>

On Thu, Dec 1, 2016 at 9:13 AM, Shah, Nehal-bakulchandra
<Nehal-Bakulchandra.shah@amd.com> wrote:

> This patch adds support for new Bank and add IRQCHIP_SKIP_SET_WAKE flag.
>
> Reviewed-by: S-k, Shyam-sundar <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Nehal Shah <Nehal-bakulchandra.Shah@amd.com>

(...)
>  static int amd_gpio_probe(struct platform_device *pdev)
>  {
> +       int hwnum;
>         int ret = 0;
>         int irq_base;
>         struct resource *res;
>         struct amd_gpio *gpio_dev;
> +       struct acpi_device *adev = ACPI_COMPANION(&pdev->dev);
> +
> +       ret = kstrtoint(acpi_device_uid(adev), 2, &hwnum);
>
>         gpio_dev = devm_kzalloc(&pdev->dev,
>                                 sizeof(struct amd_gpio), GFP_KERNEL);
> @@ -763,16 +771,17 @@ static int amd_gpio_probe(struct platform_device *pdev)
>         gpio_dev->gc.set                        = amd_gpio_set_value;
>         gpio_dev->gc.set_debounce       = amd_gpio_set_debounce;
>         gpio_dev->gc.dbg_show           = amd_gpio_dbg_show;
> +       gpio_dev->gc.base               = -1;

Good!

But now hwnum is an unused variable.

Yours,
Linus Walleij
