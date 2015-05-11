From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: Re: [PATCH 1/4] Revert "gpio: generic: clamp retured value to [0,1]"
Date: Mon, 11 May 2015 16:12:18 +0300
Message-ID: <5550AAB2.4060308@mentor.com>
References: <1430321701-13758-1-git-send-email-vladimir_zapolskiy@mentor.com>	<1430321701-13758-2-git-send-email-vladimir_zapolskiy@mentor.com> <CACRpkdYWEygtL3h4Z6uaWGxc1ac2Q7_X9gddCobUj_dHpSiK0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:59799 "EHLO
	relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754383AbbEKNMW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 11 May 2015 09:12:22 -0400
In-Reply-To: <CACRpkdYWEygtL3h4Z6uaWGxc1ac2Q7_X9gddCobUj_dHpSiK0g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,

On 11.05.2015 12:46, Linus Walleij wrote:
> On Wed, Apr 29, 2015 at 5:34 PM, Vladimir Zapolskiy
> <vladimir_zapolskiy@mentor.com> wrote:
> 
>> This reverts commit 25b35da7f4cce82271859f1b6eabd9f3bd41a2bb.
>>
>> The original change is a fast workaround in GPIO generic driver,
>> which is properly fixed by Alexandre's 23600969ff centralized handling
>> of return values from GPIO chip drivers.
>>
>> To avoid a redundant check and copy/paste confusion, it is better to
>> revert the change done in a particular driver.
>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
> 
> I'm gonna drop this patch, because the code is helpful like this,
> clear to see what is going on.
> 
> In the long run I want to change the signature of the get/set functions
> to take bools because that is what they actually handle.

thank you for review.

In my opinion (and according to my tests of course) it is safe to apply
this revert commit, also the commit is anyway needed, when you switch to
bool return values.

I understand your wish to keep this code as a hint for the planned
updates in the future, if price of the dead code plus small deviation
between bgpio_get() and bgpio_get_set() is less than price of the hint
in your opinion, I have no objections to skip this patch.

--
With best wishes,
Vladimir
