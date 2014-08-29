From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/4] gpio: pca953x: Add DT binding for reset gpio
Date: Fri, 29 Aug 2014 08:27:16 +0200
Message-ID: <CACRpkda7Bsff9EyWyF0WvVK50WQKcmABYX50pXkohUEoQ0ahQA@mail.gmail.com>
References: <1406618686-22385-1-git-send-email-mpa@pengutronix.de>
	<1406618686-22385-5-git-send-email-mpa@pengutronix.de>
	<CACRpkdY0TqVH1tJR1H89S5hvdJUboQdVtNvZnL3NeWit4f+amw@mail.gmail.com>
	<1407507094.3354.11.camel@paszta.hi.pengutronix.de>
	<CACRpkdY1x41=b_q83fejkTHXGG8GYDFNRUXdt=1AR_R4N18Rwg@mail.gmail.com>
	<1408008113.4035.29.camel@paszta.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:40735 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751578AbaH2G1R (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Aug 2014 02:27:17 -0400
Received: by mail-ob0-f169.google.com with SMTP id wp4so1482128obc.28
        for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2014 23:27:16 -0700 (PDT)
In-Reply-To: <1408008113.4035.29.camel@paszta.hi.pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Markus Pargmann <mpa@pengutronix.de>, Houcheng Lin <houcheng@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Toby Smith <toby@tismith.id.au>, Aaron Sierra <asierra@xes-inc.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>

On Thu, Aug 14, 2014 at 11:21 AM, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> Am Montag, den 11.08.2014, 10:43 +0200 schrieb Linus Walleij:
>> On Fri, Aug 8, 2014 at 4:11 PM, Philipp Zabel <p.zabel@pengutronix.de> wrote:
>> > Am Freitag, den 08.08.2014, 15:14 +0200 schrieb Linus Walleij:

>> >> As it happens, Houcheng Lin has already proposed such a
>> >> driver:
>> >> http://marc.info/?l=linux-kernel&m=140309916607115&w=2
>> >
>> > That is a different issue, as there the device does not appear on the
>> > bus until the reset is released.
>>
>> You're just looking at the patch description. Look at what the
>> driver does.
>>
>> I wrote this reply to the patch:
>> http://marc.info/?l=linux-kernel&m=140480593524472&w=2
>>
>> With a delay of zero, the reset will be released
>> immediately, by the use of a helper OF node and this driver
>> from the reset subsystem. It's nice, generic code that solves
>> a generic problem of deasserting GPIO lines for
>> some reset.
>
> Yes, it does what you want. But its purpose is different, it's a bit
> indirect for the use case at hand,

I think a generic driver is always best, define what you mean
by "indirect" in this context.

> and we'll still find cases where this
> won't work (interaction with other pins).

But that is not what you're trying to solve right now.

> As to whether the sub-node
> might conflict with existing bindings, I don't know. This is something
> that should be taken to devicetree discussion list.

Um? I don't get this.

Yours,
Linus Walleij
