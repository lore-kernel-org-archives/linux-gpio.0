From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [RFC PATCH] pinctrl: Add SX150X GPIO Extender Pinctrl Driver
Date: Tue, 6 Sep 2016 10:20:11 +0200
Message-ID: <44e8d692-832f-fbbf-2930-0cd7c140a754@baylibre.com>
References: <1472130692-14404-1-git-send-email-narmstrong@baylibre.com>
 <CACRpkdZJy6N2uCnPLrM0V=67=xJzge94bYesHjL3r4itgE-9GA@mail.gmail.com>
 <85f4ae6f-2563-967c-1e75-28a864405f53@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:36796 "EHLO
        mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932904AbcIFIUE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Sep 2016 04:20:04 -0400
Received: by mail-wm0-f51.google.com with SMTP id b187so50793031wme.1
        for <linux-gpio@vger.kernel.org>; Tue, 06 Sep 2016 01:20:02 -0700 (PDT)
In-Reply-To: <85f4ae6f-2563-967c-1e75-28a864405f53@axentia.se>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Peter Rosin <peda@axentia.se>, Linus Walleij <linus.walleij@linaro.org>, Wei Chen <Wei.Chen@csr.com>, Roland Stigge <stigge@antcom.de>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus, Peter,

On 09/06/2016 08:44 AM, Peter Rosin wrote:
> On 2016-09-06 00:47, Linus Walleij wrote:
>> On Thu, Aug 25, 2016 at 3:11 PM, Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>>> Since the I2C sx150x GPIO expander driver uses platform_data to managed
>>> the pins configurations, rewrite the driver as a pinctrl driver using
>>> pinconf to get pin configurations from DT.
>>>
>>> The pinctrl driver is functionnally as the gpio-only driver equivalent
>>> and can use DT for pinconf.
>>>
>>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>>
>> Overall I'd say this is a nice rewrite. I'd like the following:
>>
>> - Include Peter Rosin, Wei Chen, Roland Stigge and Vladimir
>>   Zapolskiy on subsequent posts
>>   (Added on To:) ideally I want Tested-by: tags from them
>>   to verify that it doesn't break their current set-ups
>>   (does it? Especially LPC32xx)

Sure, I will need certainly need one of their tested-by tag.

> 
> I intend to test this, but it might be a couple of days. I need
> to bring the damn thing out of the closet and find the right
> cables etc etc. And I of course have other stuff to do as well...

Is it a DT only platform you intent to test with ? In this case the current version is OK.

> 
>> - We need a migration plan: everything that was selecting
>>   GPIO_SX150X before should now select this instead.
>>   Just let the Kconfig entry in the drivers/gpio/Kconfig select
>>   this new driver?
>>
>> - Make sure it is a slot-in replacement. Else make sure it
>>   is.

It was my main interrogation, should I drop the gpio version, but ...

To make a slot-in replacement, it misses the sx150x_platform_data management
like the gpio version, I only made a pure DT version. It should be easy to add back.

But I see it nowhere... is it really necessary ?
I works as a simple i2c device, even while injecting it at runtime via sysfs new_device.

One other question : the gpio version was intended to be built without OF at all,
I hope this will not collide with the pinctrl version (even if I can omit the pinctrl stuff if !OF)

>>
>> - Delete the old sx150x driver from drivers/gpio in the same
>>   patch. I'd hate to maintain them side by side. If I apply this,
>>   the old one must go out at the same time. Conversely I can
>>   revert the patch and get the old driver back.

Seems legit. I will select the PINCTRL config.

>>
>> - Strangely I don't see refernces to this driver in any
>>   device tree. Are people not upstreaming their boards?
> 
> No, we have not, because we depend on yet to be upstreamed drivers
> for all of our boards, sometimes written by us, sometimes from
> the CPU vendor. For this driver, we were using a rejected patch
> to configure the pins from DT in the gpio driver written by
> Wei Chen [1] 

Actually it seems the patch was accepted, but it is not enough to handle
DT completely since the gpio base is incorrect, this was the subject
of my previous patch [2], make is DT compliant even for IRQ management.
But having a pinctrl version seens far more reasonable.

> that I adapted to also handle sx1502. I in fact had
> vague plans to move sx150x over to pinctrl myself so this is most
> welcome. It also means that *we* do not really need it to be a
> slot-in replacement, as there will be DT changes for our board
> because of this anyway given that we will have to back out that
> old gpio-dt patch. But that is not a problem *for* *us*, and I'll
> be pleased to take the churn, assuming it works in the end :-)
> 
> One thing I noted at the very end of the patch was that I on
> first glance did not see any i2c_del_driver call, maybe use the
> module_i2c_driver macro?

Well, it's not present in the gpio version and since it manages IRQs, I assume it was
decided to not use is as a module since it's needed to attach very early.

> 
> Cheers,
> Peter
> 
> [1] http://lists.infradead.org/pipermail/linux-arm-kernel/2015-January/316615.html
> 

[2] http://lkml.kernel.org/r/1466416604-19129-1-git-send-email-narmstrong@baylibre.com

Neil

