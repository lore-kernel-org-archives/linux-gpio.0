From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [RFC] gpio: about the need to manage irq mapping dynamically.
Date: Thu, 29 Jun 2017 17:53:09 +0100
Message-ID: <e0e11852-2ede-abff-7dc3-badbffecf776@arm.com>
References: <1497543642.3086.35.camel@baylibre.com>
 <CACRpkdZWw_-joPT4CJ-RAJ31s4BxuE6vusjg5YnZWaHtkRg5+w@mail.gmail.com>
 <1497954416.7387.1.camel@baylibre.com>
 <CACRpkdZu74aAsu8hggxsfffQPMk0nqihCSfuMaMbf+-4EFSYYA@mail.gmail.com>
 <1497979438.7387.10.camel@baylibre.com>
 <CACRpkdZ2cqUgMwOFG+9JVyAOxYTfHYa3+yrUzUozLpYD87KdOQ@mail.gmail.com>
 <1498141515.7387.16.camel@baylibre.com>
 <0e12f9bd-4e0b-c602-5627-5dbda5371dee@ti.com>
 <1498587929.25567.12.camel@baylibre.com>
 <CACRpkdZfvGm+sy+B2wsuw5TfD57h9cTJc7ii=1Q1DEuMxNk_8A@mail.gmail.com>
 <1498748238.27840.5.camel@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:58662 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751804AbdF2QxM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 29 Jun 2017 12:53:12 -0400
In-Reply-To: <1498748238.27840.5.camel@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Kevin Hilman <khilman@baylibre.com>, Linux Kernel <linux-kernel@vger.kernel.org>

On 29/06/17 15:57, Jerome Brunet wrote:
> On Thu, 2017-06-29 at 16:14 +0200, Linus Walleij wrote:
>> On Tue, Jun 27, 2017 at 8:25 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:
>>
>>> At the time Linus strongly rejected the idea of calling  irq_create_mapping
>>> (or
>>> any sleeping functions) in gpio_to_irq: please see the reply from Oct 26,
>>> 2016
>>> (sorry for quoting such an old discussion but this is really the starting
>>> point)
>>>
>>> * Me: There is really a *lot* of gpio drivers which use irq_create_mapping
>>> in
>>> the to_irq callback, are these all wrong ?
>>> * Linus: Yes they are all wrong. They should all be using
>>> irq_find_mapping().
>>>
>>> * Me: If this should not be used, what should we all do instead ?
>>> * Linus: Call irq_create_mapping() in some other place.
>>>
>>> gpio_prepare_irq is a proposition for this 'other place'.
>>
>> There is a misunderstanding here.
>>
>> I wrote (at the time):
>>
>>> Yes, but you want to call irq_create_mapping() in slowpath (irq setup)
>>> and irq_find_mapping() in fastpath (irq handler). Else the first IRQ
>>> may result in unwelcomed surprises.
>>
>> This does not mean that irq_create_mapping() cannot be called
>> in irq context because I think it can.
>>
>> What it means is that I think that is suboptimal from a performance
>> point of view if called from gpio_to_irq(), because nominally, at this
>> point, the mapping should already exist, since the GPIO and IRQ
>> frameworks are orthogonal.
> 
> Agreed. It should. In such case, irq_create_mapping is just a call to
> irq_find_mapping which is fine. If, for whatever reason this is not the case,
> this is going to call sleeping function in irq context. It should not happen but
> it is not entirely impossible ...
> 
>>
>> But that may not apply to the case with many-to-few interrupt
>> mappings... so I think I was in some 1-to-1-mapping context
>> when I wrote this. Sorry :(
>>
>> So I changed my mind, it is fine for this type of driver to call
>> irq_create_mapping() in gpio_to_irq(). Preferably with some comment
>> around the call.
> 
> What about disposing of the mapping ? there still is no counter part function to
> gpio_to_irq. It seems weird to leave them lying around, don't you think ?
> 
> Here is a real use we will be having a meson:
> * MMC driver load and call gpio_to_irq on its cd pin
>   This is going to create a mapping 
> * MMC driver request an irq with IRQ_EDGE_BOTH trigger (which we don't/can't
>   support at the moment). request_irq fails.
> * MMC defaults to polling the GPIO
> 
> Remember that we have only 8 possibles mappings. Now there is one (useless)
> mapping lying around which can't get rid of.

Which should be dropped by a dispose_mapping() call in the MMC driver
(or ideally some gpio-specific wrapper around this function).

> If there is more drivers doing this sort of tricks, we are going to exhaust the
> ressource pretty quickly.

We can fix those drivers as we go. It's not like there's a huge variety
of potential HW on this particular platform of yours.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
