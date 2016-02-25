From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] pinctrl: core: create unlocked version of pinctrl_find_gpio_range_from_pin
Date: Thu, 25 Feb 2016 16:23:23 +0100
Message-ID: <CACRpkdbYp8Tvd3pps=FkXZ0HUX0Y0KGe0TMuCT6ZeFF7YwxLkw@mail.gmail.com>
References: <1456008716-6236-1-git-send-email-manabian@gmail.com>
	<1456008716-6236-2-git-send-email-manabian@gmail.com>
	<CACRpkdbrS98Bd7Wx8k6GVp27We1nNNtyqEwiR1SxGp1T5myVVw@mail.gmail.com>
	<CACRpkdZ6EODhqbH9amTdgCMbR1Qq4A867wiK24q6RAg+7Svy+w@mail.gmail.com>
	<CAGhQ9Vy6wLctan9-O-FOL6E2_HUhFcHcu+qbx_Ye3ai37w0esg@mail.gmail.com>
	<CACRpkda0Hu+A9C8yNEYx-vxvKvvM+xhpu_N2QWwT7K+WYOhOFQ@mail.gmail.com>
	<CAGhQ9VzCL=OBf=xmHdU36HXC2NCL-dg9xA=gcQ5YfamWGs4n2g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:35087 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760269AbcBYPXY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Feb 2016 10:23:24 -0500
Received: by mail-oi0-f48.google.com with SMTP id x21so41640678oix.2
        for <linux-gpio@vger.kernel.org>; Thu, 25 Feb 2016 07:23:24 -0800 (PST)
In-Reply-To: <CAGhQ9VzCL=OBf=xmHdU36HXC2NCL-dg9xA=gcQ5YfamWGs4n2g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Joachim Eastwood <manabian@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Feb 25, 2016 at 4:15 PM, Joachim  Eastwood <manabian@gmail.com> wrote:
> On 25 February 2016 at 15:55, Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Thu, Feb 25, 2016 at 12:19 PM, Joachim  Eastwood <manabian@gmail.com> wrote:
>>
>>>> Or rather, pinctrl_fund_gpio_range_from_pin_locked(),
>>>> indicating that you're already holding the necessary lock
>>>> when calling the function. Now I'm even confusing myself,
>>>> sorry :(
>>>
>>> Shouldn't the function name indicate what the function does with the lock?
>>>
>>> pinctrl_fund_gpio_range_from_pin_unlocked() would indicate to me that
>>> it does not acquire a lock and it is your responsibility as a caller
>>> to ensure that the correct lock is held before calling.
>>
>> OK hm maybe you're right, grep the kernel for precedents.
>
> hmm, I not sure anymore.
>
> What do you think about pinctrl_find_gpio_range_from_pin_nolock()?
>
> The _nolock() prefix is also used in the kernel and might convey what
> we want better. Thoughts?

Go for it.

Yours,
Linus Walleij
