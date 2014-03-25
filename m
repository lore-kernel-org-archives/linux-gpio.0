From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: vr41xx: mark GPIO lines used for IRQ
Date: Tue, 25 Mar 2014 15:06:53 +0100
Message-ID: <CACRpkdYownU1JcCi=iuWEDokdD22j6qH2kARHZiKTOBmpg0xUw@mail.gmail.com>
References: <1390518477-10020-1-git-send-email-linus.walleij@linaro.org>
	<20140319170030.GH17197@linux-mips.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:34535 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752779AbaCYOGy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Mar 2014 10:06:54 -0400
Received: by mail-ob0-f172.google.com with SMTP id wm4so604198obc.31
        for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2014 07:06:54 -0700 (PDT)
In-Reply-To: <20140319170030.GH17197@linux-mips.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, linux-mips@linux-mips.org, Yoichi Yuasa <yuasa@linux-mips.org>

On Wed, Mar 19, 2014 at 6:00 PM, Ralf Baechle <ralf@linux-mips.org> wrote:
> On Fri, Jan 24, 2014 at 12:07:57AM +0100, Linus Walleij wrote:
>
> Added Yoichi to cc.
>
>> When an IRQ is started on a GPIO line, mark this GPIO as IRQ in
>> the gpiolib so we can keep track of the usage centrally.
>>
>> Cc: Ralf Baechle <ralf@linux-mips.org>
>> Cc: linux-mips@linux-mips.org
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
>> It would be much appreciated if one of the MIPS people could
>> test this patch, thanks in advance. (I did compile-test it
>> with a MIPS cross compiler.)
>> ---
>
> I haven't received any test results but as it's looking good I'm queueing
> this for 3.15.

If it works I'd like to queue it through the GPIO tree actually,
as I need to tweak it a bit to use the new resource callbacks
from the IRQ tree.

(But no big deal if you've already prepped your queue,
I can fix this up later.)

Yours,
Linus Walleij
