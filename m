From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] RFC: gpio: add API to be strict about GPIO IRQ usage
Date: Mon, 14 Oct 2013 12:00:57 -0600
Message-ID: <525C3159.8020300@wwwdotorg.org>
References: <1380022390-21262-1-git-send-email-linus.walleij@linaro.org> <5241D12E.4050405@wwwdotorg.org> <CACRpkdZh_2v=_cudk2Kdq64DRtH1VPTECW0s15iaZAw4+ZW2Dg@mail.gmail.com> <52584D3E.7030809@wwwdotorg.org> <20131012060637.GJ24616@ns203013.ovh.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:48413 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756949Ab3JNSBC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Oct 2013 14:01:02 -0400
In-Reply-To: <20131012060637.GJ24616@ns203013.ovh.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Enric Balletbo i Serra <eballetbo@gmail.com>, Grant Likely <grant.likely@linaro.org>, Santosh Shilimkar <santosh.shilimkar@ti.com>

On 10/12/2013 12:06 AM, Jean-Christophe PLAGNIOL-VILLARD wrote:
> On 13:10 Fri 11 Oct     , Stephen Warren wrote:
>> On 10/11/2013 02:39 AM, Linus Walleij wrote:
>>> On Tue, Sep 24, 2013 at 7:51 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:
>>>> On 09/24/2013 05:33 AM, Linus Walleij wrote:
>>
>>>>> diff --git a/drivers/pinctrl/pinctrl-nomadik.c b/drivers/pinctrl/pinctrl-nomadik.c
>>>>> @@ -795,6 +795,14 @@ static int nmk_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
>>>>>  {
>>>>>       struct nmk_gpio_chip *nmk_chip =
>>>>>               container_of(chip, struct nmk_gpio_chip, chip);
>>>>> +     int ret;
>>>>> +
>>>>> +     ret = gpio_lock_as_irq(chip, offset);
>>>>
>>>> I don't think that gpio_to_irq() is the correct place to call the new
>>>> function, for two reasons:
>>>>
>>>> 1)
>>>>
>>>> Not all paths that use interrupts call gpio_to_irq(). It's perfectly
>>>> valid for a driver to receive an IRQ number, request it, and be done.
>>>> The is commmon when a driver only cares about IRQ functionality and not
>>>> GPIO functionality, and hence did not receive a GPIO and convert it to
>>>> the IRQ.
>>>>
>>>> To solve this, I think irq_chip drivers should call the new gpiolib
>>>> functions when the IRQ is actually requested or set up.
>>>>
>>>> Related, where does gpio_unlock_as_irq() get called in the Nomadik
>>>> driver? It should happen when free_irq() is called.
>>>
>>> Yeah if we formalize the criterion that interrupts out of any GPIO
>>> chips should be possible to request without first getting it from the
>>> <linux/gpio.h> interface, then this holds.
>>>
>>> However that is not the whole story, is it? We have a gazillion
>>> drivers calling irq_create_mapping() in this function, so I would
>>> say that things are already a mess here.
>>
>> I expect things are a mess indeed:-)
>>
>> I believe that if a driver is only calling irq_create_mapping() inside
>> gpio_to_irq(), it's a bug. I think things can operate correctly in one
>> of two cases, at least with DT:
>>
>> 1) irq_create_mapping() is called from both gpio_to_irq() and the
>> of_xlate callback for IRQs.
>>
>> (I don't think this method would work in a board-file-based system where
>> of_xlate isn't called for IRQs...)
> 
> this is what do the at91 driver today
>
>> or:
>>
>> 2) irq_create_mapping() is called for all IRQs when registering the IRQ
>> controller/domain.
>>
>> To me, (2) is much simpler, and avoids the issue (1) probably has with
>> only supporting direct IRQ usage (without something calling gpio_to_irq()).
> 
> no as you can not track which gpio is an activer IRQ
> as if an gpio is an active IRQ you need to forbiden gpio_directio & co

I think you're confusing two issues. The existance of an IRQ mapping is
not related to whether a GPIO is used as an IRQ. In that patch that
Linus sent for the nomadik GPIO driver, whether a GPIO is used as an IRQ
is configured in the irq_chip startup/shutdown functions, and has no
impact on, nor is impacted by, the presence/absence of IRQ mappings.
