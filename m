From: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH 3/3] pinctrl: sx150x: add a static gpio/pinctrl pin range
 mapping
Date: Wed, 17 Jan 2018 16:27:11 +0100
Message-ID: <5bd06c52-8cb1-eca6-02d8-f85e273f4706@axentia.se>
References: <CACRpkdZ8JYoY4nJe8n8zDaY2Lcu3BRPRpzxkv=v4FC7T2zYdiA@mail.gmail.com>
 <20180117133423.4482-1-peda@axentia.se>
 <20180117133423.4482-4-peda@axentia.se> <1516201554.5522.15.camel@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ve1eur01on0106.outbound.protection.outlook.com ([104.47.1.106]:36759
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753691AbeAQP1S (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 17 Jan 2018 10:27:18 -0500
In-Reply-To: <1516201554.5522.15.camel@aj.id.au>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>, linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, linux-gpio@vger.kernel.org

On 2018-01-17 16:05, Andrew Jeffery wrote:
> On Wed, 2018-01-17 at 14:34 +0100, Peter Rosin wrote:
>> Without such a range, gpiolib fails with -EPROBE_DEFER, pending the
>> addition of the range. So, without a range, gpiolib will keep
>> deferring indefinitely.
>>
>> Fixes: e10f72bf4b3e ("gpio: gpiolib: Generalise state persistence beyond sleep")
> 
> This is a bit of a nit-pick, but I'd argue the hazard always existed in
> the pinctrl-sx150x's probe however hadn't been triggered until now. My
> instinct is Fixes should instead point to 9e80f9064e73 ("pinctrl: Add
> SX150X GPIO Extender Pinctrl Driver"). Having said that I still think
> it's worth pointing out in the commit message that e10f72bf4b3e ("gpio:
> gpiolib: Generalise state persistence beyond sleep") is the motivation
> for your patch (i.e. mention both commits).

Linus, if you agree, just change the commit message as you see fit. Can't
say I'm proud of any of it...

Cheers,
Peter

> Regardless, thanks to you both for getting to the bottom of this.
> 
> Andrew
> 
>> Suggested-by: Linus Walleij <linus.walleij@linaro.org>
>> Signed-off-by: Peter Rosin <peda@axentia.se>
>> ---
>>  drivers/pinctrl/pinctrl-sx150x.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
>> index 049dd15e04ef..cbf58a10113d 100644
>> --- a/drivers/pinctrl/pinctrl-sx150x.c
>> +++ b/drivers/pinctrl/pinctrl-sx150x.c
>> @@ -1193,6 +1193,11 @@ static int sx150x_probe(struct i2c_client *client,
>>  	if (ret)
>>  		return ret;
>>  
>> +	ret = gpiochip_add_pin_range(&pctl->gpio, dev_name(dev),
>> +				     0, 0, pctl->data->npins);
>> +	if (ret)
>> +		return ret;
>> +
>>  	/* Add Interrupt support if an irq is specified */
>>  	if (client->irq > 0) {
>>  		pctl->irq_chip.name = devm_kstrdup(dev, client->name,

