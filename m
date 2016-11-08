From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: amd: Add support for additional GPIO
Date: Tue, 8 Nov 2016 14:13:51 +0100
Message-ID: <CACRpkdY43TeA0HQu3_ZFxRmzSmt8rrq9s_e4awLThU4uurPO9g@mail.gmail.com>
References: <MWHPR12MB1357A3E7488C15C8E6E6BE45A0A20@MWHPR12MB1357.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f179.google.com ([209.85.220.179]:35884 "EHLO
        mail-qk0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750745AbcKHNNx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2016 08:13:53 -0500
Received: by mail-qk0-f179.google.com with SMTP id n21so104707554qka.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Nov 2016 05:13:52 -0800 (PST)
In-Reply-To: <MWHPR12MB1357A3E7488C15C8E6E6BE45A0A20@MWHPR12MB1357.namprd12.prod.outlook.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>
Cc: "gnurou@gmail.com" <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>

On Fri, Nov 4, 2016 at 4:46 AM, Shah, Nehal-bakulchandra
<Nehal-bakulchandra.Shah@amd.com> wrote:

> This patch provides support for additional GPIO devices and also provides IRQ sharing for AMD's GPIO devices and set
> IRQCHIP_SKIP_SET_WAKE flag.
>
> Reviewed-by: S-k, Shyam-sundar <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Nehal Shah <Nehal-bakulchandra.Shah@amd.com>

So the build servers are protesting against this patch because:

> +       ret = devm_request_irq(&pdev->dev, irq_base, amd_gpio_irq_handler,
> +                              IRQF_SHARED, dev_name(&pdev->dev), gpio_dev);

This is assigning amd_gpio_irq_handler() as IRQ handler, but that
one returns void and a proper irq handler needs to return
irqreturn_t.

Please look at this, I have backed out the patch.

Yours,
Linus Walleij
