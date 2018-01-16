From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: mmio: Also read bits that are zero
Date: Tue, 16 Jan 2018 13:09:40 +0100
Message-ID: <CACRpkdZn4U74wJBzYMzc3AuQBMxkyfSvJcd6zx3UC4GFHtSb0w@mail.gmail.com>
References: <20180116110031.20533-1-linus.walleij@linaro.org> <20180116112025.GA19826@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f48.google.com ([209.85.214.48]:46025 "EHLO
        mail-it0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751831AbeAPMJm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jan 2018 07:09:42 -0500
Received: by mail-it0-f48.google.com with SMTP id x42so4605207ita.4
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jan 2018 04:09:42 -0800 (PST)
In-Reply-To: <20180116112025.GA19826@wunner.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lukas Wunner <lukas@wunner.de>
Cc: linux-gpio@vger.kernel.org, Clemens Gruber <clemens.gruber@pqgruber.com>, Bartosz Golaszewski <brgl@bgdev.pl>

On Tue, Jan 16, 2018 at 12:20 PM, Lukas Wunner <lukas@wunner.de> wrote:
> On Tue, Jan 16, 2018 at 12:00:31PM +0100, Linus Walleij wrote:
>> +     bit = -1;
>> +     while ((bit = find_next_bit(mask, gc->ngpio, bit + 1)) < gc->ngpio)
>>               readmask |= bgpio_line2mask(gc, bit);
>
> Amend include/linux/bitrev.h with a bitrev64() macro.
>
> Further amend it with a bitrevul() macro which calls bitrev32() or
> bitrev(64) depending on the arch's unsigned long size.
>
> Then use bitrevul() on mask and the rest is just OR/AND operations
> (instead of the while loop).

I hear you! :)

But can we do it as an improvement on top of the bugfix now that we
need to get something in before the merge window?

I would need acks and stuff to change bitrev.h and that may take
weeks.

Yours,
Linus Walleij
