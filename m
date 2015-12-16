From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: Re: BGPIOF_READ_OUTPUT_REG_SET problem
Date: Wed, 16 Dec 2015 21:18:14 +0200
Message-ID: <5671B8F6.3020000@mentor.com>
References: <20151216140456.GA20121@panicking> <56717A1F.7020105@mentor.com>
 <20151216152511.GB20121@panicking> <20151216181752.GD20121@panicking>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:45693 "EHLO
	relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932808AbbLPTTX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Dec 2015 14:19:23 -0500
In-Reply-To: <20151216181752.GD20121@panicking>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michael Trimarchi <michael@amarulasolutions.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

Hi Michael,

On 16.12.2015 20:17, Michael Trimarchi wrote:
> Hi
> 
> On Wed, Dec 16, 2015 at 04:25:11PM +0100, Michael Trimarchi wrote:
>> Hi
>>
>> On Wed, Dec 16, 2015 at 04:50:07PM +0200, Vladimir Zapolskiy wrote:
>>> Hi Michael,
>>>
>>> On 16.12.2015 16:05, Michael Trimarchi wrote:
>>>> Hi
>>>>
>>>> I have get a problem using gpio and imx6q freescale architecture. 
>>>
>>> what is the problem you experience? What is the version of the kernel
>>> (commit hash id) you run?
>>>
>>
>> I don't want the mask back when I read the gpio. I want to know if it's
>> 1 or 0

now I got what you want, but actually I didn't get completely what is your
problem. Please be more descriptive.

> 
> This is my starting commit on my local tree:
> 
> dd5ae6818ccd4ab0aa6f7d84e88f60a48af0fb52

Good, so it is on Torvalds' branch and you have a potentially problematic
commit e20538b82 applied.

By the way you may try to git-bisect the problem, I may be wrong in my
assumptions regarding that commit.

With best wishes,
Vladimir

>>>> I don't really understand how should work your change and I have done a quick
>>>> fix for me. Can you explain what was the idea?
>>>
>>> I believe here you are talking about changes b19e7f51a5 and
>>> 442b2494b17d1 , please explain the problem.
>>>
>>> With best wishes,
>>> Vladimir
>>>
>>>> Michael
>>>>
>>>> diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
>>>> index a3f0753..f9c6ff7 100644
>>>> --- a/drivers/gpio/gpio-generic.c
>>>> +++ b/drivers/gpio/gpio-generic.c
>>>> @@ -139,11 +139,14 @@ static int bgpio_get_set(struct gpio_chip *gc, unsigned int gpio)
>>>>  {
>>>>  	struct bgpio_chip *bgc = to_bgpio_chip(gc);
>>>>  	unsigned long pinmask = bgc->pin2mask(bgc, gpio);
>>>> +	unsigned long reg;
>>>>  
>>>>  	if (bgc->dir & pinmask)
>>>> -		return bgc->read_reg(bgc->reg_set) & pinmask;
>>>> +		reg = bgc->read_reg(bgc->reg_set) & pinmask;
>>>>  	else
>>>> -		return bgc->read_reg(bgc->reg_dat) & pinmask;
>>>> +		reg = bgc->read_reg(bgc->reg_dat) & pinmask;
>>>> +
>>>> +	return !!(reg &  bgc->pin2mask(bgc, gpio));
>>>>  }
>>>>  
>>>>  static int bgpio_get(struct gpio_chip *gc, unsigned int gpio)
>>>>
>>
>> -- 
>> | Michael Nazzareno Trimarchi                     Amarula Solutions BV |
>> | COO  -  Founder                                      Cruquiuskade 47 |
>> | +31(0)851119172                                 Amsterdam 1018 AM NL |
>> |                  [`as] http://www.amarulasolutions.com               |
> 

