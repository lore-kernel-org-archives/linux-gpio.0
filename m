From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: davinci: Fix a check for unbanked gpio
Date: Mon, 18 Nov 2013 11:48:19 +0100
Message-ID: <CACRpkdbeWa76n1yrLxLJUEaz116k+48EbRtPO2iz=y=WLYoR_Q@mail.gmail.com>
References: <1383893156-28010-1-git-send-email-prabhakar.csengg@gmail.com>
	<1383893156-28010-2-git-send-email-prabhakar.csengg@gmail.com>
	<5281C82B.9090402@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f46.google.com ([209.85.219.46]:34135 "EHLO
	mail-oa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751172Ab3KRKsU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Nov 2013 05:48:20 -0500
Received: by mail-oa0-f46.google.com with SMTP id o6so464927oag.33
        for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2013 02:48:19 -0800 (PST)
In-Reply-To: <5281C82B.9090402@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>
Cc: Prabhakar Lad <prabhakar.csengg@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, LKML <linux-kernel@vger.kernel.org>, DLOS <davinci-linux-open-source@linux.davincidsp.com>, LAK <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Nov 12, 2013 at 7:18 AM, Sekhar Nori <nsekhar@ti.com> wrote:
> On Friday 08 November 2013 12:15 PM, Prabhakar Lad wrote:
>> From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
>>
>> This patch fixes a check for offset in gpio_to_irq_unbanked()
>> and also assigns gpio_irq, gpio_unbanked of chips[0] to
>> appropriate values which is used in gpio_to_irq_unbanked()
>> function.
>>
>> Reported-by: Grygorii Strashko <grygorii.strashko@ti.com>
>> Signed-off-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>
>
> You should note explicitly that this patch fixes broken unbanked IRQ
> support. You mostly just described what you are doing.
>
> I will fixup while committing.

So you're carrying this patch Sekhar?

Thanks:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
