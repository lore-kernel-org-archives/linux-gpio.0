From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 2/2] pinctrl: single: remove misuse of IRQF_NO_SUSPEND
 flag
Date: Fri, 4 Dec 2015 15:44:39 +0000
Message-ID: <5661B4E7.2040405@arm.com>
References: <1448644860-29323-1-git-send-email-sudeep.holla@arm.com>
 <1448644860-29323-2-git-send-email-sudeep.holla@arm.com>
 <CACRpkdYy1fPAm5r0GxXxzgZA7RsqJ6ZtPtNzd1bzrfkME_j09g@mail.gmail.com>
 <20151203181337.GV23396@atomide.com> <566090FC.1020502@arm.com>
 <20151203214013.GB23396@atomide.com> <20151204154031.GG23396@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:55074 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752994AbbLDPon (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 4 Dec 2015 10:44:43 -0500
In-Reply-To: <20151204154031.GG23396@atomide.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Grygorii Strashko <grygorii.strashko@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-omap@vger.kernel.org



On 04/12/15 15:40, Tony Lindgren wrote:
> * Tony Lindgren <tony@atomide.com> [151203 13:41]:
>> * Sudeep Holla <sudeep.holla@arm.com> [151203 11:00]:
>>>
>>> I have added irq_set_irq_wake(pcs_soc->irq, state) in pcs_irq_set_wake
>>> which ensures it's marked for wakeup.
>>
>> Hmm well see the error I pasted in this thread, maybe that provides
>> more clues.
>
> The irq_set_irq_wake(pcs_soc->irq, state) in pcs_irq_set_wake does not
> look right to me as pcs_irq_set_wake toggles the irq_wake for each pin
> separately, not for the whole controller.
>

OK, my understanding was that this driver supports multiple single
pinmux with one main irq `pcs_soc->irq`. Hence I added the wakeup on
that irq. I now think that understand is wrong.

> I think all that can be left out with the snipped from Grygorii, and maybe
> also the lock_class_key changes.

OK

-- 
Regards,
Sudeep
