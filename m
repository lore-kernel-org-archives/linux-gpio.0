From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/8] gpio: zynq: Shift zynq_gpio_init() to subsys_initcall level
Date: Tue, 22 Aug 2017 15:02:29 +0200
Message-ID: <CACRpkdbgPYrSo3KcHuf6sCWT-s2R7UVMRhFagLT2-vB8S_MF0Q@mail.gmail.com>
References: <cover.1502103715.git.michal.simek@xilinx.com> <a05cc4f104097bef71ed381229aa8c746717ebce.1502103715.git.michal.simek@xilinx.com>
 <CACRpkdbUBe6z2C9U9THaaLq0JLuu=EsGAVQfaSY55tMUotKvvg@mail.gmail.com> <68cd52a7-ce87-a507-f02d-ccb99634b465@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:33698 "EHLO
        mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932638AbdHVNCa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Aug 2017 09:02:30 -0400
Received: by mail-oi0-f50.google.com with SMTP id f11so184587871oic.0
        for <linux-gpio@vger.kernel.org>; Tue, 22 Aug 2017 06:02:30 -0700 (PDT)
In-Reply-To: <68cd52a7-ce87-a507-f02d-ccb99634b465@xilinx.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "monstr@monstr.eu" <monstr@monstr.eu>, Nava kishore Manne <nava.manne@xilinx.com>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robherring2@gmail.com>, Josh Cartwright <josh.cartwright@ni.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Mon, Aug 14, 2017 at 4:15 PM, Michal Simek <michal.simek@xilinx.com> wrote:

>> Can't you just move it all the way to device_initcall and
>> simply use the standard module init macros?
>> builtin_platform_driver(), module_platform_driver()?
>
> When I grep the kernel I see this
>
> [linux](master)$ git grep "^core_initcall" drivers/gpio/ | wc -l
> 1
> [linux](master)$ git grep "^postcore_initcall" drivers/gpio/ | wc -l
> 12
> [linux](master)$ git grep "^arch_initcall" drivers/gpio/ | wc -l
> 2
> [linux](master)$ git grep "^subsys_initcall" drivers/gpio/ | wc -l
> 33
> [linux](master)$ git grep "^device_initcall" drivers/gpio/ | wc -l
> 4
>
>
> [linux](master)$ git grep "^core_initcall" drivers/pinctrl/ | wc -l
> 6
> [linux](master)$ git grep "^postcore_initcall" drivers/pinctrl/ | wc -l
> 7
> [linux](master)$ git grep "^arch_initcall" drivers/pinctrl/ | wc -l
> 62
> [linux](master)$ git grep "^subsys_initcall" drivers/pinctrl/ | wc -l
> 12
> [linux](master)$ git grep "^device_initcall" drivers/pinctrl/ | wc -l
> 0
>
> Majority of gpio drivers are in subsys_initcall and pinctrl in
> arch_initcall.

The majority is likely wrong, we don't vote about what is the
best code quality luckily :D

You do not see a lot of device_initicall because in the majority
of cases these come implicitly from module_platform_driver(),
builtin_platform_driver_probe() or builtin_platform_driver()
see include/linux/platform_device.h

> It doesn't mean that I have strong opinion about doing
> this change. I have also read internal tracking system and it is not
> fully clear if this is fixing any issue rather than removing on
> deferring probe message.

I think you can make it into module_platform_driver() please
try that approach.

Yours,
Linus Walleij
