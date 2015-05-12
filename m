From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 1/4] Revert "gpio: generic: clamp retured value to [0,1]"
Date: Tue, 12 May 2015 16:45:04 +0900
Message-ID: <CAAVeFuLW6xzgMa0AxA_MW9idkwohyC6c93ZhG-hGvE+OdyJ+jg@mail.gmail.com>
References: <1430321701-13758-1-git-send-email-vladimir_zapolskiy@mentor.com>
 <1430321701-13758-2-git-send-email-vladimir_zapolskiy@mentor.com>
 <CACRpkdYWEygtL3h4Z6uaWGxc1ac2Q7_X9gddCobUj_dHpSiK0g@mail.gmail.com> <5550AAB2.4060308@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f172.google.com ([209.85.213.172]:35134 "EHLO
	mail-ig0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751802AbbELHpZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 May 2015 03:45:25 -0400
Received: by igbyr2 with SMTP id yr2so95581936igb.0
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2015 00:45:24 -0700 (PDT)
In-Reply-To: <5550AAB2.4060308@mentor.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Vladimir,

On Mon, May 11, 2015 at 10:12 PM, Vladimir Zapolskiy
<vladimir_zapolskiy@mentor.com> wrote:
> Hi Linus,
>
> On 11.05.2015 12:46, Linus Walleij wrote:
>> On Wed, Apr 29, 2015 at 5:34 PM, Vladimir Zapolskiy
>> <vladimir_zapolskiy@mentor.com> wrote:
>>
>>> This reverts commit 25b35da7f4cce82271859f1b6eabd9f3bd41a2bb.
>>>
>>> The original change is a fast workaround in GPIO generic driver,
>>> which is properly fixed by Alexandre's 23600969ff centralized handling
>>> of return values from GPIO chip drivers.
>>>
>>> To avoid a redundant check and copy/paste confusion, it is better to
>>> revert the change done in a particular driver.
>>>
>>> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
>>
>> I'm gonna drop this patch, because the code is helpful like this,
>> clear to see what is going on.
>>
>> In the long run I want to change the signature of the get/set functions
>> to take bools because that is what they actually handle.
>
> thank you for review.
>
> In my opinion (and according to my tests of course) it is safe to apply
> this revert commit, also the commit is anyway needed, when you switch to
> bool return values.
>
> I understand your wish to keep this code as a hint for the planned
> updates in the future, if price of the dead code plus small deviation
> between bgpio_get() and bgpio_get_set() is less than price of the hint
> in your opinion, I have no objections to skip this patch.

I'd also agree with Linus that we could live without this patch until
we switch the functions to return bools.

Actually, with implicit type conversion doing most of the job, I
wonder if it would be that hard to do - maybe you will want to give it
a quick try?
