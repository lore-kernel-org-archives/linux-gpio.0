From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] pinctrl-st: fix of_irq_to_resource() result check
Date: Mon, 31 Jul 2017 14:56:46 +0300
Message-ID: <0f8ee18f-66e8-e828-db55-aeb05466cdf5@cogentembedded.com>
References: <20170729180744.873303067@cogentembedded.com>
 <20170731112719.GM26667@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:37156 "EHLO
        mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752111AbdGaL4u (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Jul 2017 07:56:50 -0400
Received: by mail-lf0-f42.google.com with SMTP id m86so105611880lfi.4
        for <linux-gpio@vger.kernel.org>; Mon, 31 Jul 2017 04:56:49 -0700 (PDT)
In-Reply-To: <20170731112719.GM26667@ulmo>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Patrice Chotard <patrice.chotard@st.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hello!

On 07/31/2017 02:27 PM, Thierry Reding wrote:

>> of_irq_to_resource() has recently been fixed to return negative error #'s
>> along with 0 in case of failure, however the ST driver still only regards
>> 0 as failure indication -- fix it up.
>>
>> Fixes: 7a4228bbff76 ("of: irq: use of_irq_get() in of_irq_to_resource()")
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> ---
>>  drivers/pinctrl/pinctrl-st.c |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> Index: linux-pinctrl/drivers/pinctrl/pinctrl-st.c
>> ===================================================================
>> --- linux-pinctrl.orig/drivers/pinctrl/pinctrl-st.c
>> +++ linux-pinctrl/drivers/pinctrl/pinctrl-st.c
>> @@ -1521,7 +1521,7 @@ static int st_gpiolib_register_bank(stru
>>  	 *	[irqN]----> [gpio-bank (n)]
>>  	 */
>>
>> -	if (of_irq_to_resource(np, 0, &irq_res)) {
>> +	if (of_irq_to_resource(np, 0, &irq_res) > 0) {
>>  		gpio_irq = irq_res.start;
>>  		gpiochip_set_chained_irqchip(&bank->gpio_chip, &st_gpio_irqchip,
>>  					     gpio_irq, st_gpio_irq_handler);
>
> While at it, maybe turn this into of_irq_get() since you only need the
> interrupt number in the first place?

    Yeah, noticed that too. Will look into this (if I won't forget).

> Thierry

MBR, Sergei

