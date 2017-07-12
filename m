From: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Subject: Re: [PATCH] pinctrl: st: constify gpio_chip structure
Date: Wed, 12 Jul 2017 11:51:44 -0500
Message-ID: <20170712115144.Horde.FbWJCF3tLLNmzrIfChEYUVc@gator4166.hostgator.com>
References: <20170711181519.GA20001@embeddedgus>
 <c0a35f14-7c22-63f9-8bfa-2d88b5800fbd@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from gateway31.websitewelcome.com ([192.185.144.28]:24084 "EHLO
        gateway31.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753543AbdGLQvx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 12 Jul 2017 12:51:53 -0400
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
        by gateway31.websitewelcome.com (Postfix) with ESMTP id BC6BCEB10
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jul 2017 11:51:44 -0500 (CDT)
In-Reply-To: <c0a35f14-7c22-63f9-8bfa-2d88b5800fbd@st.com>
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Patrice CHOTARD <patrice.chotard@st.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Patrice,

Quoting Patrice CHOTARD <patrice.chotard@st.com>:

> Hi Gustavo
>
> On 07/11/2017 08:15 PM, Gustavo A. R. Silva wrote:
>> This structure is only used to copy into other structure, so declare
>> it as const.
>>
>> This issue was detected using Coccinelle and the following semantic patch:
>>
>> @r disable optional_qualifier@
>> identifier i;
>> position p;
>> @@
>> static struct gpio_chip i@p = { ... };
>>
>> @ok@
>> identifier r.i;
>> expression e;
>> position p;
>> @@
>> e = i@p;
>>
>> @bad@
>> position p != {r.p,ok.p};
>> identifier r.i;
>> struct gpio_chip e;
>> @@
>> e@i@p
>>
>> @depends on !bad disable optional_qualifier@
>> identifier r.i;
>> @@
>> static
>> +const
>>   struct gpio_chip i = { ... };
>>
>> In the following log you can see a significant difference in the code size
>> and data segment, hence in the dec segment. This log is the output
>> of the size command, before and after the code change:
>>
>> before:
>>     text    data     bss     dec     hex filename
>>    21671    3632     128   25431    6357 drivers/pinctrl/pinctrl-st.o
>>
>> after:
>>     text    data     bss     dec     hex filename
>>    21366    3576     128   25070    61ee drivers/pinctrl/pinctrl-st.o
>>
>> Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>
>> ---
>>   drivers/pinctrl/pinctrl-st.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
>> index 3ae8066..5d4789d 100644
>> --- a/drivers/pinctrl/pinctrl-st.c
>> +++ b/drivers/pinctrl/pinctrl-st.c
>> @@ -1442,7 +1442,7 @@ static void st_gpio_irqmux_handler(struct  
>> irq_desc *desc)
>>   	chained_irq_exit(chip, desc);
>>   }
>>
>> -static struct gpio_chip st_gpio_template = {
>> +static const struct gpio_chip st_gpio_template = {
>>   	.request		= gpiochip_generic_request,
>>   	.free			= gpiochip_generic_free,
>>   	.get			= st_gpio_get,
>>
>
> Acked-by: Patrice Chotard <patrice.chotard@st.com>
>
> Thanks

Glad to help. :)

Thanks
--
Gustavo A. R. Silva





