From: Olliver Schinagl <oliver@schinagl.nl>
Subject: Re: [PATCH] gpio: fix constconst in devres
Date: Thu, 12 Mar 2015 10:00:23 +0100
Message-ID: <550155A7.8080406@schinagl.nl>
References: <1426073078-25029-1-git-send-email-linus.walleij@linaro.org> <5364467.g0vMANFLvB@pcimr> <55003990.7010700@schinagl.nl> <6123809.y1TdJ8k4td@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from 7of9.schinagl.nl ([88.159.158.68]:38975 "EHLO 7of9.schinagl.nl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750726AbbCLJA3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 12 Mar 2015 05:00:29 -0400
In-Reply-To: <6123809.y1TdJ8k4td@pcimr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rojhalat Ibrahim <imr@rtschenk.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>

Hey all,

On 11-03-15 15:23, Rojhalat Ibrahim wrote:
> On Wednesday 11 March 2015 13:48:16 Olliver Schinagl wrote:
>> Hey all,
>>
>> On 11-03-15 13:22, Rojhalat Ibrahim wrote:
>>> On Wednesday 11 March 2015 12:24:38 Linus Walleij wrote:
>>>> Commit 1feb57a245a4910b03202a814ffc51a900bd4aca
>>>> "gpio: add parameter to allow the use named gpios"
>>>> includes a double-conted array. Fix this.
>>>>
>>>> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>>>> Cc: Olliver Schinagl <oliver@schinagl.nl>
>>>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>>>> ---
>>>>    drivers/gpio/devres.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpio/devres.c b/drivers/gpio/devres.c
>>>> index ec24da2418b3..0bd060bf7151 100644
>>>> --- a/drivers/gpio/devres.c
>>>> +++ b/drivers/gpio/devres.c
>>>> @@ -135,7 +135,7 @@ struct gpio_desc *devm_get_gpiod_from_child(struct device *dev,
>>>>    					    const char *con_id,
>>>>    					    struct fwnode_handle *child)
>>>>    {
>>>> -	static const char const *suffixes[] = { "gpios", "gpio" };
>>>> +	static const char *suffixes[] = { "gpios", "gpio" };
>>>>    	char prop_name[32]; /* 32 is max size of property name */
>>>>    	struct gpio_desc **dr;
>>>>    	struct gpio_desc *desc;
>>>>
>>> Shouldn't it be const char * const suffixes[], as in a const pointer to const data?
>> I sent a patch to fix this weeks ago I belive.
>>> Wouldn't it be better to add an #include "gpiolib.h" to devres.c and use
>>> the gpio_suffixes array defined in gliolib.h?
>> I did not know we had that, that sounds logical. I can cook up a patch
>> for that to work on both invocations!
>>
> The gpio_suffixes array in gpiolib.h was added only very recently (after your
> patch that added the declaration here). So you couldn't have known.
Ah, fair enough. I'll rebase and make a patch then for it :)
>

