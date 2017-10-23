From: Doug Berger <opendmb@gmail.com>
Subject: Re: [PATCH 7/7] gpio: brcmstb: implement suspend/resume/shutdown
Date: Mon, 23 Oct 2017 16:06:39 -0700
Message-ID: <b6a889bc-261d-2082-568c-2eb4847b44b5@gmail.com>
References: <20170930034057.15166-1-opendmb@gmail.com>
 <20170930034057.15166-8-opendmb@gmail.com> <20171019090359.GB31645@kessel>
 <aa8a2900-22a5-5ec5-2afc-038fc42ea940@gmail.com>
 <CADtm3G5utU_-6+FMqnxN0LYJggLhSe7Q6V5LbwchLQLe5zVing@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:53160 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751290AbdJWXGo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Oct 2017 19:06:44 -0400
In-Reply-To: <CADtm3G5utU_-6+FMqnxN0LYJggLhSe7Q6V5LbwchLQLe5zVing@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gregory Fong <gregory.0xf0@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Brian Norris <computersforpeace@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 10/20/2017 05:54 PM, Gregory Fong wrote:
> On Thu, Oct 19, 2017 at 11:39 AM, Doug Berger <opendmb@gmail.com> wrote:
>>>> +static int brcmstb_gpio_resume(struct device *dev)
>>>> +{
>>>> +    struct brcmstb_gpio_priv *priv = dev_get_drvdata(dev);
>>>> +    struct brcmstb_gpio_bank *bank;
>>>> +    u32 wake_mask = 0;
>>>
>>> This isn't really being used as a mask, contrary to appearances.  It's
>>> just tracking whether any active IRQs were seen.  Please change to use a
>>> bool instead and adjust the name accordingly.
>>>
>>
>> I see your point, but I believe it is cleaner to use this to consolidate
>> the bit masks returned by each __brcmstb_gpio_get_active_irqs() call.
>> This allows a single test rather than a test per bank.
> 
> What about something like this?
> 
> bool need_wakeup_event = false;
> 
> list_for_each_entry(bank, &priv->bank_list, node) {
>         need_wakeup_event |= !!__brcmstb_gpio_get_active_irqs(bank);
>         brcmstb_gpio_bank_restore(priv, bank);
> }
> 
> if (priv->parent_wake_irq && need_wakeup_event)
>         pm_wakeup_event(dev, 0);
> 

It's less efficient, but it is not performance sensitive so if you feel
this is more understandable I'll make the change.

Thanks,
    Doug
