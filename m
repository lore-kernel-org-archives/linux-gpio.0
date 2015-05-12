From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: Re: [PATCH 1/4] Revert "gpio: generic: clamp retured value to [0,1]"
Date: Tue, 12 May 2015 10:54:26 +0300
Message-ID: <5551B1B2.4070606@mentor.com>
References: <1430321701-13758-1-git-send-email-vladimir_zapolskiy@mentor.com> <1430321701-13758-2-git-send-email-vladimir_zapolskiy@mentor.com> <CACRpkdYWEygtL3h4Z6uaWGxc1ac2Q7_X9gddCobUj_dHpSiK0g@mail.gmail.com> <5550AAB2.4060308@mentor.com> <CAAVeFuLW6xzgMa0AxA_MW9idkwohyC6c93ZhG-hGvE+OdyJ+jg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:44895 "EHLO
	relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751802AbbELHyf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 May 2015 03:54:35 -0400
In-Reply-To: <CAAVeFuLW6xzgMa0AxA_MW9idkwohyC6c93ZhG-hGvE+OdyJ+jg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Alexandre,

On 12.05.2015 10:45, Alexandre Courbot wrote:
> Hi Vladimir,
> 
> On Mon, May 11, 2015 at 10:12 PM, Vladimir Zapolskiy
> <vladimir_zapolskiy@mentor.com> wrote:
>> Hi Linus,
>>
>> On 11.05.2015 12:46, Linus Walleij wrote:
>>> On Wed, Apr 29, 2015 at 5:34 PM, Vladimir Zapolskiy
>>> <vladimir_zapolskiy@mentor.com> wrote:
>>>
>>>> This reverts commit 25b35da7f4cce82271859f1b6eabd9f3bd41a2bb.
>>>>
>>>> The original change is a fast workaround in GPIO generic driver,
>>>> which is properly fixed by Alexandre's 23600969ff centralized handling
>>>> of return values from GPIO chip drivers.
>>>>
>>>> To avoid a redundant check and copy/paste confusion, it is better to
>>>> revert the change done in a particular driver.
>>>>
>>>> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
>>>
>>> I'm gonna drop this patch, because the code is helpful like this,
>>> clear to see what is going on.
>>>
>>> In the long run I want to change the signature of the get/set functions
>>> to take bools because that is what they actually handle.
>>
>> thank you for review.
>>
>> In my opinion (and according to my tests of course) it is safe to apply
>> this revert commit, also the commit is anyway needed, when you switch to
>> bool return values.
>>
>> I understand your wish to keep this code as a hint for the planned
>> updates in the future, if price of the dead code plus small deviation
>> between bgpio_get() and bgpio_get_set() is less than price of the hint
>> in your opinion, I have no objections to skip this patch.
> 
> I'd also agree with Linus that we could live without this patch until
> we switch the functions to return bools.
> 
> Actually, with implicit type conversion doing most of the job, I
> wonder if it would be that hard to do - maybe you will want to give it
> a quick try?
> 

it should be quite a simple and straightforward change, I'll prepare
patches for review, thank you for offering the task.

--
With best wishes,
Vladimir
