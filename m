From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [patch 15/22] pinctrl: Use irq_desc_get_xxx() to avoid redundant
 lookup of irq_desc
Date: Tue, 8 Sep 2015 16:50:30 +0200
Message-ID: <CACRpkdaWv6EKcP9COMFKZAyk4FOYTvDTC1RtTG7xjk9TSm_qhQ@mail.gmail.com>
References: <20150713072703.919712512@linutronix.de>
	<20150713072815.548358316@linutronix.de>
	<CAP=VYLrx3rJSvCEgZz47Ka1fye5EK6yetQKna=7fMGn3kOwiLg@mail.gmail.com>
	<CACRpkdb+Pi11u7dwHn0JPvbBERm5qKPuw=iVVUSg6ZL+E6zz4Q@mail.gmail.com>
	<alpine.DEB.2.11.1509081603360.3854@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:33438 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754868AbbIHOub (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Sep 2015 10:50:31 -0400
Received: by obbbh8 with SMTP id bh8so85266632obb.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2015 07:50:30 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.11.1509081603360.3854@nanos>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, LKML <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jiang Liu <jiang.liu@linux.intel.com>

On Tue, Sep 8, 2015 at 4:10 PM, Thomas Gleixner <tglx@linutronix.de> wrote:
> On Tue, 8 Sep 2015, Linus Walleij wrote:
>> On Mon, Aug 31, 2015 at 11:28 PM, Paul Gortmaker
>> <paul.gortmaker@windriver.com> wrote:
>> > On Mon, Jul 13, 2015 at 4:47 PM, Thomas Gleixner <tglx@linutronix.de> wrote:
>> >> From: Jiang Liu <jiang.liu@linux.intel.com>
>> >>
>> >> Use irq_desc_get_xxx() to avoid redundant lookup of irq_desc while we
>> >> already have a pointer to corresponding irq_desc.
>> >
>> > Hi Linus,
>> >
>> > It seems that linux-next has this copy of the patch as 5663bb27dec1, which
>> > has a stray irq_desc_get_irq_chip in s3c24xx ; (2nd instance of "irq" is
>> > bogus looking.)   I first assumed it was from tglx since it did not have any
>> > additional SOB lines, but on further investigation I traced it back to sfr's
>> > merge of pinctrl/for-next.
>>
>> Hm, saw this a bit late I guess.
>>
>> Torvalds has merged my trees, is there a problem in mainline
>> that need to be addressed or did this fix itself?
>
> No, it's buggered in Linus tree as well.

OK fixing it.

Yours,
Linus Walleij
