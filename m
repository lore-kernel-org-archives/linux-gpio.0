From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] pinctrl: zynq: change error code for pinctrl_register failure
Date: Tue, 26 May 2015 17:20:24 +0900
Message-ID: <CAK7LNAQ3GbG0BCiESOnO1=qViXOer0StEEbjxUYumbGa73VgZw@mail.gmail.com>
References: <1432613909-13457-1-git-send-email-yamada.masahiro@socionext.com>
	<4437293.G26yCXqFQH@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from [202.248.44.40] ([202.248.44.40]:33503 "EHLO
	conssluserg002-v.nifty.com" rhost-flags-FAIL-FAIL-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751126AbbEZIVW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Tue, 26 May 2015 04:21:22 -0400
In-Reply-To: <4437293.G26yCXqFQH@wuerfel>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Michal Simek <michal.simek@xilinx.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>

Hi Arnd,


2015-05-26 17:12 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
> On Tuesday 26 May 2015 13:18:29 Masahiro Yamada wrote:
>> diff --git a/drivers/pinctrl/pinctrl-zynq.c b/drivers/pinctrl/pinctrl-zynq.c
>> index 04748a4..0ff653c 100644
>> --- a/drivers/pinctrl/pinctrl-zynq.c
>> +++ b/drivers/pinctrl/pinctrl-zynq.c
>> @@ -1141,7 +1141,7 @@ static int zynq_pinctrl_probe(struct platform_device *pdev)
>>
>>         pctrl->pctrl = pinctrl_register(&zynq_desc, &pdev->dev, pctrl);
>>         if (!pctrl->pctrl)
>> -               return -ENOMEM;
>> +               return -EINVAL;
>>
>>         platform_set_drvdata(pdev, pctrl);
>>
>>
>
> One choice seems as bad as the other to me ;-)
>
> Could we add a pinctrl_register_reason() variant that returns a meaningful
> error code as ERR_PTR?


I also thought of it.
I was wondering why pinctrl_register() did not return ERR_PTR.

Can we migrate to ERR_PTR in the long run?

 [1] Add pinctrl_register_reason()
 [2] Replace pinctrl_register() in each driver with
pinctrl_register_reason() one by one
 [3] Eventually, pinctrl_register will disappear
 [4] Rename pinctrl_register_reason() into pinctrl_register()


-- 
Best Regards
Masahiro Yamada
