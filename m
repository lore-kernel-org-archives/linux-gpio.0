From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH 3/8] gpio: zynq: Shift zynq_gpio_init() to subsys_initcall
 level
Date: Mon, 14 Aug 2017 16:15:01 +0200
Message-ID: <68cd52a7-ce87-a507-f02d-ccb99634b465@xilinx.com>
References: <cover.1502103715.git.michal.simek@xilinx.com>
 <a05cc4f104097bef71ed381229aa8c746717ebce.1502103715.git.michal.simek@xilinx.com>
 <CACRpkdbUBe6z2C9U9THaaLq0JLuu=EsGAVQfaSY55tMUotKvvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-cys01nam02on0079.outbound.protection.outlook.com ([104.47.37.79]:26079
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750876AbdHNOPQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 14 Aug 2017 10:15:16 -0400
In-Reply-To: <CACRpkdbUBe6z2C9U9THaaLq0JLuu=EsGAVQfaSY55tMUotKvvg@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Michal Simek <michal.simek@xilinx.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "monstr@monstr.eu" <monstr@monstr.eu>, Nava kishore Manne <nava.manne@xilinx.com>, =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robherring2@gmail.com>, Josh Cartwright <josh.cartwright@ni.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 14.8.2017 15:55, Linus Walleij wrote:
> On Mon, Aug 7, 2017 at 1:01 PM, Michal Simek <michal.simek@xilinx.com> wrote:
> 
>> From: Nava kishore Manne <nava.manne@xilinx.com>
>>
>> In general situation on-SoC GPIO controller drivers should be probed
>> after pinctrl/pinmux controller driver, because on-SoC GPIOs utilize a
>> pin/pad as a resource provided and controlled by pinctrl subsystem.
>>
>>   GPIO must come after pinctrl as gpios may need to mux pins....etc
>>
>> Looking at Xilinx SoC series pinctrl drivers, zynq*_pinctrl_init()
>> functions are called at arch_initcall init levels,
>> so the change of initcall level for gpio-zynq driver from
>> postcore_initcall to subsys_initcall level is sufficient. Also note
>> that the most of GPIO controller drivers settled at subsys_initcall
>> level.
>>
>> If pinctrl subsystem manages pads with GPIO functions, the change is
>> needed to avoid unwanted driver probe deferrals during kernel boot.
>>
>> Signed-off-by: Nava kishore Manne <navam@xilinx.com>
>> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> 
> Can't you just move it all the way to device_initcall and
> simply use the standard module init macros?
> builtin_platform_driver(), module_platform_driver()?

When I grep the kernel I see this

[linux](master)$ git grep "^core_initcall" drivers/gpio/ | wc -l
1
[linux](master)$ git grep "^postcore_initcall" drivers/gpio/ | wc -l
12
[linux](master)$ git grep "^arch_initcall" drivers/gpio/ | wc -l
2
[linux](master)$ git grep "^subsys_initcall" drivers/gpio/ | wc -l
33
[linux](master)$ git grep "^device_initcall" drivers/gpio/ | wc -l
4


[linux](master)$ git grep "^core_initcall" drivers/pinctrl/ | wc -l
6
[linux](master)$ git grep "^postcore_initcall" drivers/pinctrl/ | wc -l
7
[linux](master)$ git grep "^arch_initcall" drivers/pinctrl/ | wc -l
62
[linux](master)$ git grep "^subsys_initcall" drivers/pinctrl/ | wc -l
12
[linux](master)$ git grep "^device_initcall" drivers/pinctrl/ | wc -l
0

Majority of gpio drivers are in subsys_initcall and pinctrl in
arch_initcall. It doesn't mean that I have strong opinion about doing
this change. I have also read internal tracking system and it is not
fully clear if this is fixing any issue rather than removing on
deferring probe message.

Nava: Do you have any comment?

Thanks,
Michal

