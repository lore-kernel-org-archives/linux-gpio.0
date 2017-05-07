From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] pinctrl: imx: Check for memory allocation failure
Date: Sun, 7 May 2017 09:52:57 +0200
Message-ID: <oemjok$e3c$1@blaine.gmane.org>
References: <20170506082359.6736-1-christophe.jaillet@wanadoo.fr>
 <20170506194038.GI17317@lianli.shorne-pla.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from [195.159.176.226] ([195.159.176.226]:33529 "EHLO
        blaine.gmane.org" rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org
        with ESMTP id S1750815AbdEGXEi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 7 May 2017 19:04:38 -0400
Received: from list by blaine.gmane.org with local (Exim 4.84_2)
        (envelope-from <glg-linux-gpio@m.gmane.org>)
        id 1d7Gzz-0003sH-Bd
        for linux-gpio@vger.kernel.org; Sun, 07 May 2017 09:52:59 +0200
In-Reply-To: <20170506194038.GI17317@lianli.shorne-pla.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le 06/05/2017 à 21:40, Stafford Horne a écrit :
> Hi Christophe,
>
> On Sat, May 06, 2017 at 10:23:59AM +0200, Christophe JAILLET wrote:
>> If 'devm_kzalloc' fails, a NULL pointer will be dereferenced.
>> Return -ENOMEM instead, as done for the other memory allocation just a
>> few lines below.
> This looks fine.
>
>> BTW, change the 'devm_kzalloc' into a 'devm_kcalloc'.
> Any reason for the devm_kcalloc change?  It looks like the next for loop
> does set all of the group_name values.
>
> -Stafford
The semantic of kcalloc is better than kzalloc here because we allocate 
an array.
It also checks if "func->num_group_names * sizeof(char *)" is not too big.

I agree that zerroing memory could probably be avoided here.

I can send a V2 without the (not that useful) change for kcalloc, or 
with a 'devm_kmalloc_array' if you prefer.

CJ

>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>>   drivers/pinctrl/freescale/pinctrl-imx.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
>> index 74bd90dfd7b1..90a946c028ff 100644
>> --- a/drivers/pinctrl/freescale/pinctrl-imx.c
>> +++ b/drivers/pinctrl/freescale/pinctrl-imx.c
>> @@ -581,9 +581,10 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
>>   		dev_err(info->dev, "no groups defined in %s\n", np->full_name);
>>   		return -EINVAL;
>>   	}
>> -	func->group_names = devm_kzalloc(info->dev,
>> -					 func->num_group_names *
>> +	func->group_names = devm_kcalloc(info->dev, func->num_group_names,
>>   					 sizeof(char *), GFP_KERNEL);
>> +	if (!func->group_names)
>> +		return -ENOMEM;
>>   
>>   	for_each_child_of_node(np, child) {
>>   		func->group_names[i] = child->name;
>> -- 
>> 2.11.0
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


