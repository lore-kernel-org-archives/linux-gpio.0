From: Daniel Axtens <dja@axtens.net>
Subject: Re: [PATCH] pinctrl: pxa2xx: add MODULE_LICENSE
Date: Sun, 03 Dec 2017 12:03:17 +1100
Message-ID: <87mv30fwru.fsf@linkitivity.dja.id.au>
References: <20171202094015.11696-1-dja@axtens.net> <CACRpkdYWTNEJZ3TUCsgEdDMRytGiOiMV6YhRKgciO1Qwgbeorg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pl0-f67.google.com ([209.85.160.67]:40708 "EHLO
        mail-pl0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752240AbdLCBDW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 2 Dec 2017 20:03:22 -0500
Received: by mail-pl0-f67.google.com with SMTP id 1so8375534pla.7
        for <linux-gpio@vger.kernel.org>; Sat, 02 Dec 2017 17:03:22 -0800 (PST)
In-Reply-To: <CACRpkdYWTNEJZ3TUCsgEdDMRytGiOiMV6YhRKgciO1Qwgbeorg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-gpio@vger.kernel.org, Jiri Kosina <trivial@kernel.org>

Linus Walleij <linus.walleij@linaro.org> writes:

> On Sat, Dec 2, 2017 at 10:40 AM, Daniel Axtens <dja@axtens.net> wrote:
>
>> This fixes the following warning on an allmodconfig build:
>> WARNING: modpost: missing MODULE_LICENSE() in drivers/pinctrl/pxa/pinctrl-pxa2xx.o
>>
>> This matches the license in the header.
>>
>> Signed-off-by: Daniel Axtens <dja@axtens.net>
>
> Somebody patches this too. Sorry!
No worries, apologies for the noise!

Regards,
Daniel
>
> Thanks anyway!
>
> Yours,
> Linus Walleij
