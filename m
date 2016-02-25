From: Joachim Eastwood <manabian@gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: core: create unlocked version of pinctrl_find_gpio_range_from_pin
Date: Thu, 25 Feb 2016 12:19:57 +0100
Message-ID: <CAGhQ9Vy6wLctan9-O-FOL6E2_HUhFcHcu+qbx_Ye3ai37w0esg@mail.gmail.com>
References: <1456008716-6236-1-git-send-email-manabian@gmail.com>
	<1456008716-6236-2-git-send-email-manabian@gmail.com>
	<CACRpkdbrS98Bd7Wx8k6GVp27We1nNNtyqEwiR1SxGp1T5myVVw@mail.gmail.com>
	<CACRpkdZ6EODhqbH9amTdgCMbR1Qq4A867wiK24q6RAg+7Svy+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f178.google.com ([209.85.223.178]:35589 "EHLO
	mail-io0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752706AbcBYLT6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Feb 2016 06:19:58 -0500
Received: by mail-io0-f178.google.com with SMTP id g203so84608558iof.2
        for <linux-gpio@vger.kernel.org>; Thu, 25 Feb 2016 03:19:57 -0800 (PST)
In-Reply-To: <CACRpkdZ6EODhqbH9amTdgCMbR1Qq4A867wiK24q6RAg+7Svy+w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On 25 February 2016 at 10:23, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Feb 25, 2016 at 10:21 AM, Linus Walleij
> <linus.walleij@linaro.org> wrote:
>> On Sat, Feb 20, 2016 at 11:51 PM, Joachim Eastwood <manabian@gmail.com> wrote:
>>
>>> pinctrl_find_gpio_range_from_pin takes the pctldev->mutex but so
>>> does pinconf_pins_show and this will cause a deadlock if
>>> pinctrl_find_gpio_range_from_pin is used in .pin_config_get
>>> callback.
>>>
>>> Create an unlocked version of pinctrl_find_gpio_range_from_pin to
>>> allow pin to gpio lookup to be used from pinconf_pins_show.
>>>
>>> Signed-off-by: Joachim Eastwood <manabian@gmail.com>
>>
>> I understand that the function is needed and it's semantically
>> OK.
>>
>>> +EXPORT_SYMBOL_GPL(__pinctrl_find_gpio_range_from_pin);
>> (...)
>>> +extern struct pinctrl_gpio_range *
>>> +__pinctrl_find_gpio_range_from_pin(struct pinctrl_dev *pctldev,
>>> +                                  unsigned int pin);
>>> +
>>
>> This function name is NOT OK.
>>
>> Rename it pinctrl_fund_gpio_range_from_pin_unlocked(),
>
> Or rather, pinctrl_fund_gpio_range_from_pin_locked(),
> indicating that you're already holding the necessary lock
> when calling the function. Now I'm even confusing myself,
> sorry :(

Shouldn't the function name indicate what the function does with the lock?

pinctrl_fund_gpio_range_from_pin_unlocked() would indicate to me that
it does not acquire a lock and it is your responsibility as a caller
to ensure that the correct lock is held before calling.

But I am fine with either pinctrl_fund_gpio_range_from_pin_unlocked()
or pinctrl_fund_gpio_range_from_pin_locked(). It's all up to you.


regards,
Joachim Eastwood
