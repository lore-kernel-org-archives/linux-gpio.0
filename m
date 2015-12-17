From: Michael Trimarchi <michael@amarulasolutions.com>
Subject: Re: BGPIOF_READ_OUTPUT_REG_SET problem
Date: Thu, 17 Dec 2015 08:31:47 +0100
Message-ID: <CAOf5uwnL7syWiYWoHK5Y2tNqr05ko+LUMWXh=Nhut4255v8gow@mail.gmail.com>
References: <20151216140456.GA20121@panicking>
	<56717A1F.7020105@mentor.com>
	<20151216152511.GB20121@panicking>
	<20151216181752.GD20121@panicking>
	<5671B8F6.3020000@mentor.com>
	<CAOf5uwmM2T6VVVfBLUED5=a4ZMpY10oJg_r3FCzAW+XkRLxbww@mail.gmail.com>
	<5671C333.5040407@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f173.google.com ([209.85.213.173]:32994 "EHLO
	mail-ig0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933957AbbLQHbs (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Dec 2015 02:31:48 -0500
Received: by mail-ig0-f173.google.com with SMTP id mv3so7810740igc.0
        for <linux-gpio@vger.kernel.org>; Wed, 16 Dec 2015 23:31:48 -0800 (PST)
In-Reply-To: <5671C333.5040407@mentor.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

Hi Vladimir

On Wed, Dec 16, 2015 at 9:01 PM, Vladimir Zapolskiy
<vladimir_zapolskiy@mentor.com> wrote:
> Hi Michael,
>
> On 16.12.2015 21:38, Michael Trimarchi wrote:
>> Hi
>>
>> On Dec 16, 2015 8:18 PM, "Vladimir Zapolskiy" <vladimir_zapolskiy@mentor.com
>> <mailto:vladimir_zapolskiy@mentor.com>> wrote:
>>>
>>> Hi Michael,
>>>
>>> On 16.12.2015 20:17, Michael Trimarchi wrote:
>>> > Hi
>>> >
>>> > On Wed, Dec 16, 2015 at 04:25:11PM +0100, Michael Trimarchi wrote:
>>> >> Hi
>>> >>
>>> >> On Wed, Dec 16, 2015 at 04:50:07PM +0200, Vladimir Zapolskiy wrote:
>>> >>> Hi Michael,
>>> >>>
>>> >>> On 16.12.2015 16:05, Michael Trimarchi wrote:
>>> >>>> Hi
>>> >>>>
>>> >>>> I have get a problem using gpio and imx6q freescale architecture.
>>> >>>
>>> >>> what is the problem you experience? What is the version of the kernel
>>> >>> (commit hash id) you run?
>>> >>>
>>> >>
>>> >> I don't want the mask back when I read the gpio. I want to know if it's
>>> >> 1 or 0
>>>
>>> now I got what you want, but actually I didn't get completely what is your
>>> problem. Please be more descriptive.
>>>
>>> >
>>> > This is my starting commit on my local tree:
>>> >
>>> > dd5ae6818ccd4ab0aa6f7d84e88f60a48af0fb52
>>>
>>> Good, so it is on Torvalds' branch and you have a potentially problematic
>>> commit e20538b82 applied.
>>>
>>> By the way you may try to git-bisect the problem, I may be wrong in my
>>> assumptions regarding that commit.
>>>
>>
>> gc.get pointer should be assigned to function with same semantic. So on my
>> tree semantic of function is different.
>
> Putting aside returned negative values, the problem is gone, if you change
> the semantics in your tree and assume that gc.get() returns values: low - 0
> and high - !0 (not necessary 1)? Because if you apply this logic, you get
> +18 correctly working gpiochip drivers in your tree.
>
>> I understand your point but we have two problems in mainline. One
>> 0x10000000 and other get function.
>
> Yes, the problem with the Bjorn's commit still exists. As well as another
> kind of problem, if the commit is not applied.
>

It can be fine if >get() return 0 or 1 to the corresponding gpio and error
in case of failure (like in gpio expander for example). My patch make
the implementation
of bgpio_get_set equal to bgpio_get. I don't find any sense to let the
bgpio_get_set to return
the mask because ofcourse 31 gpio can not work. Revert does not solve
the problem because
we need to have int return value in general and not boolean

Michael

> With best wishes,
> Vladimir
>
>>> >>>> I don't really understand how should work your change and I have done
>> a quick
>>> >>>> fix for me. Can you explain what was the idea?
>>> >>>
>>> >>> I believe here you are talking about changes b19e7f51a5 and
>>> >>> 442b2494b17d1 , please explain the problem.
>>> >>>
>>> >>> With best wishes,
>>> >>> Vladimir
>>> >>>
>>> >>>> Michael
>>> >>>>
>>> >>>> diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
>>> >>>> index a3f0753..f9c6ff7 100644
>>> >>>> --- a/drivers/gpio/gpio-generic.c
>>> >>>> +++ b/drivers/gpio/gpio-generic.c
>>> >>>> @@ -139,11 +139,14 @@ static int bgpio_get_set(struct gpio_chip *gc,
>> unsigned int gpio)
>>> >>>>  {
>>> >>>>    struct bgpio_chip *bgc = to_bgpio_chip(gc);
>>> >>>>    unsigned long pinmask = bgc->pin2mask(bgc, gpio);
>>> >>>> +  unsigned long reg;
>>> >>>>
>>> >>>>    if (bgc->dir & pinmask)
>>> >>>> -          return bgc->read_reg(bgc->reg_set) & pinmask;
>>> >>>> +          reg = bgc->read_reg(bgc->reg_set) & pinmask;
>>> >>>>    else
>>> >>>> -          return bgc->read_reg(bgc->reg_dat) & pinmask;
>>> >>>> +          reg = bgc->read_reg(bgc->reg_dat) & pinmask;
>>> >>>> +
>>> >>>> +  return !!(reg &  bgc->pin2mask(bgc, gpio));
>>> >>>>  }
>>> >>>>
>>> >>>>  static int bgpio_get(struct gpio_chip *gc, unsigned int gpio)
>>> >>>>
>>> >>
>>> >> --
>>> >> | Michael Nazzareno Trimarchi                     Amarula Solutions BV |
>>> >> | COO  -  Founder                                      Cruquiuskade 47 |
>>> >> | +31(0)851119172                                 Amsterdam 1018 AM NL |
>>> >> |                  [`as] http://www.amarulasolutions.com               |
>>> >
>>>
>>
>



-- 
| Michael Nazzareno Trimarchi                     Amarula Solutions BV |
| COO  -  Founder                                      Cruquiuskade 47 |
| +31(0)851119172                                 Amsterdam 1018 AM NL |
|                  [`as] http://www.amarulasolutions.com               |
