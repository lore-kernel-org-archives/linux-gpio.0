From: Hoan Tran <hotran@apm.com>
Subject: Re: [PATCH v3] gpio: dwapb: Add support for next generation of X-Gene SoC
Date: Thu, 23 Feb 2017 09:16:19 -0800
Message-ID: <CAFHUOYxaqo+potzYFNqFM-sBKvOvapB_8L8MvqOK5xmq93X8Sw@mail.gmail.com>
References: <1487705563-8054-1-git-send-email-hotran@apm.com> <CACRpkdYEg6gr_qzDPggfcS=qaLc25iQNXTH7Ziq5juBo3Xyq6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ot0-f170.google.com ([74.125.82.170]:35508 "EHLO
        mail-ot0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751557AbdBWRQU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Feb 2017 12:16:20 -0500
Received: by mail-ot0-f170.google.com with SMTP id w44so28306169otw.2
        for <linux-gpio@vger.kernel.org>; Thu, 23 Feb 2017 09:16:20 -0800 (PST)
In-Reply-To: <CACRpkdYEg6gr_qzDPggfcS=qaLc25iQNXTH7Ziq5juBo3Xyq6Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Jamie Iles <jamie@jamieiles.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Loc Ho <lho@apm.com>

On Thu, Feb 23, 2017 at 7:07 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Feb 21, 2017 at 8:32 PM, Hoan Tran <hotran@apm.com> wrote:
>
>> Next generation of X-Gene SoC's GPIO hardware register map is very
>> similar to DW GPIO. It only differs by a few register addresses.
>> This patch modifies DW GPIO driver to accommodate the difference
>> in a few register addresses.
>>
>> Signed-off-by: Hoan Tran <hotran@apm.com>
>
> Patch applied for v4.12 with Andy's review tag.
> Will appear in linux-next after the merge window.

Thanks, Linus!

Regards
Hoan

>
> Yours,
> Linus Walleij
