From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v2 1/2] gpio: pxa: change the interrupt management
Date: Tue, 15 Dec 2015 18:52:06 +0100
Message-ID: <87egenioqh.fsf@belgarion.home>
References: <1449960921-19002-1-git-send-email-robert.jarzmik@free.fr>
	<CACRpkdYKqWLZsEiSqoVxVikZ2RPToVHpmASoFPZmBnh0X_Qrcw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp11.smtpout.orange.fr ([80.12.242.133]:18161 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933282AbbLORwK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Dec 2015 12:52:10 -0500
In-Reply-To: <CACRpkdYKqWLZsEiSqoVxVikZ2RPToVHpmASoFPZmBnh0X_Qrcw@mail.gmail.com>
	(Linus Walleij's message of "Tue, 15 Dec 2015 14:15:51 +0100")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Linus Walleij <linus.walleij@linaro.org> writes:

> On Sat, Dec 12, 2015 at 11:55 PM, Robert Jarzmik <robert.jarzmik@free.fr> wrote:
>
>> The interrupt management is changed by this patch to rely on chip data
>> instead of chained interrupts.
>>
>> The main goal is to loosen the dependency on the global pxa chip
>> structure in favor of the passed chip data. The secondary goal is to
>> better show in /proc/interrupts the difference between interrupts for
>> gpio0 and gpio1 (directly wired to interrupt controller), and the other
>> gpios (wired onto a third line in the interrupt controller).
>>
>> The last advantage of this patch is that the interrupt is actually
>> requested, so that another driver cannot steal this line, or overwrite
>> the handler.
>>
>> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
>> ---
>> Since v1: moved CONFIG_OF for pxa_irq_domain_ops
>
> I already merged v1 and I don't like to rebase my tree,
> can you send an incremental patch fixing this, based off
> my "devel" branch?
Yeah, sure, I'll just do that.

Cheers.

-- 
Robert
