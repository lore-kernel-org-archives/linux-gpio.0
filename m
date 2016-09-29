From: Shawn Lin <shawn.lin@rock-chips.com>
Subject: Re: [PATCH] pinctrl: rockchip: don't disable clk when irq mask is
 already set
Date: Thu, 29 Sep 2016 15:29:45 +0800
Message-ID: <4414bb4f-d159-504e-5ba2-36807b2421ed@rock-chips.com>
References: <1474655197-26919-1-git-send-email-jacob-chen@iotwrt.com>
 <fb4ec747-fde3-142b-1963-be3b9cfab260@rock-chips.com>
 <3592219.tUs91je5kA@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.130]:48845 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753693AbcI2Hah (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Sep 2016 03:30:37 -0400
In-Reply-To: <3592219.tUs91je5kA@phil>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: shawn.lin@rock-chips.com, linux-gpio@vger.kernel.org, Jacob Chen <jacob2.chen@rock-chips.com>, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Jacob Chen <jacob-chen@iotwrt.com>

在 2016/9/27 6:35, Heiko Stuebner 写道:
> Am Samstag, 24. September 2016, 18:24:11 CEST schrieb Shawn Lin:
>> On 2016/9/24 2:26, Jacob Chen wrote:
>>> From: Jacob Chen <jacob2.chen@rock-chips.com>
>>>
>>> In some drivers, disable_irq() call don't be symmetric with enable_irq()
>>> , disable_irq() will be called before call free_irq().
>>
>> Which upstream drivers you refer to?
>>
>> Shouldn't it be the unbalanced call for these drivers?
>>
>>> But both disable_irq() and free_irq() will call
>>> rockchip_irq_gc_mask_set_bit,>
>>>  and clk_disable() will be called more times than clk_enable(), which will
>>>
>>> cause bugs.
>>>
>>> I think we can correct that by checking of mask.If mask is already set, do
>>> nothing.
>> Looks like a little hacky to me.
>
> that may be true, but on first glance I tend to agree with Jacob.
> Look for example at (a driver using disable_irq I picked at random) drivertc/
> rtcrs/-tps6586x.c .

yep, I took a quick look at the files you pointed to, and it seems
there should be the problems for what this patch to deal with. Probably
I didn't see this error since the drivers we was using happened to
handle it properly but maybe not for other drivers. I am okay if this
could solve problems for Jacob.

>
> In its probe function it does devm_request_irq directly followed by
> disable_irq on its alarm interrupt. The interrupt only gets enabled again if
> the rtc alarm gets enabled. So you can easily run into the disable + free case
> there as well. Similar probably in a lot of other drivers.
>
>
> Heiko
>
>>
>>> Change-Id: If19912c7658253e15531c04db6c70fdbffd5960a
>>
>> remove this.
>>
>>> Signed-off-by: Jacob Chen <jacob2.chen@rock-chips.com>
>>> ---
>>>
>>>  drivers/pinctrl/pinctrl-rockchip.c | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/pinctrl/pinctrl-rockchip.c
>>> b/drivers/pinctrl/pinctrl-rockchip.c index c6c04ac..9a8804a 100644
>>> --- a/drivers/pinctrl/pinctrl-rockchip.c
>>> +++ b/drivers/pinctrl/pinctrl-rockchip.c
>>> @@ -2334,8 +2334,12 @@ static void rockchip_irq_gc_mask_clr_bit(struct
>>> irq_data *d)>
>>>  void rockchip_irq_gc_mask_set_bit(struct irq_data *d)
>>>  {
>>>
>>>  	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
>>>
>>> +	struct irq_chip_type *ct = irq_data_get_chip_type(d);
>>>
>>>  	struct rockchip_pin_bank *bank = gc->private;
>>>
>>> +	if (*ct->mask_cache & d->mask)
>>> +		return;
>>> +
>>>
>>>  	irq_gc_mask_set_bit(d);
>>>  	clk_disable(bank->clk);
>>>
>>>  }
>>>
>>> --
>>> 2.7.4
>>>
>>>
>>> _______________________________________________
>>> Linux-rockchip mailing list
>>> Linux-rockchip@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-rockchip
>
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
>


-- 
Best Regards
Shawn Lin

