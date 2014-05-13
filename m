From: Alan Tull <delicious.quinoa@gmail.com>
Subject: Re: [PATCH 6/7 v2] gpio: dwapb: use a second irq chip
Date: Tue, 13 May 2014 11:17:35 -0500
Message-ID: <CANk1AXQTy_qtOzXmp_NJ7aoRfAdmCDavDrYhp4KdPKkmJ8zCCg@mail.gmail.com>
References: <1395505004-22650-1-git-send-email-bigeasy@linutronix.de>
	<1395505004-22650-7-git-send-email-bigeasy@linutronix.de>
	<5331F6D5.7070809@gmail.com>
	<53427718.30406@linutronix.de>
	<CANk1AXSuBGj3vZ7knKmHTwDZLTkvVFT42Lt9ZTdk-E+sp=xQ+g@mail.gmail.com>
	<20140430111308.GA11829@linutronix.de>
	<CACRpkdb6wh9ah7ivNvU44j79LqFEVv-keAVxK8jO7h5LJsP5zg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qg0-f47.google.com ([209.85.192.47]:57076 "EHLO
	mail-qg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751071AbaEMQRh convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 13 May 2014 12:17:37 -0400
In-Reply-To: <CACRpkdb6wh9ah7ivNvU44j79LqFEVv-keAVxK8jO7h5LJsP5zg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Jamie Iles <jamie@jamieiles.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Alan Tull <atull@altera.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@altera.com>

On Fri, May 9, 2014 at 6:46 AM, Linus Walleij <linus.walleij@linaro.org=
> wrote:
> On Wed, Apr 30, 2014 at 1:13 PM, Sebastian Andrzej Siewior
> <bigeasy@linutronix.de> wrote:
>
>> Right new have one irq chip running always in level mode. It would n=
icer
>> to have two irq chips where one is handling level type interrupts an=
d
>> the other one is doing edge interrupts. So we can have at runtime tw=
o users
>> where one is using edge and the other level.
>>
>> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>> ---
>> I am very sorry for the delay. I assumed that I've already fixed the
>> patch sent it out. Just realized that it was not the case.
>>
>> v1=E2=80=A6v2:
>>     - using the lopp again but breaking the assignment of type and
>>       handler out of the loop as suggested by delicious quinoa.
>
> Can I have an ACK from Jamie &&|| Alan on this patch so I can apply
> it?
>
> Yours,
> Linus Walleij

Yes

Acked-by: Alan Tull <delicious.quinoa@gmail.com>

Alan
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
