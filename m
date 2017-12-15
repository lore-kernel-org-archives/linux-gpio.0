From: Philippe Ombredanne <pombredanne@nexb.com>
Subject: Re: [PATCH v2 05/13] pinctrl: Add Microsemi Ocelot SoC driver
Date: Fri, 15 Dec 2017 08:59:15 +0100
Message-ID: <CAOFm3uFsM5Bbb2V-HYKf1kJgHokjUkuRLTht+7gO=-sxJ50faA@mail.gmail.com>
References: <20171208154618.20105-1-alexandre.belloni@free-electrons.com>
 <20171208154618.20105-6-alexandre.belloni@free-electrons.com>
 <CACRpkdZ=+pFZYteq=wM=z-CGejY+dX_SqhtDbbGBn+q60arQ4w@mail.gmail.com>
 <CAOFm3uF_OjqK0cQ1A4Xkp8kZab+afqPsnF5rB9=a7Dym9jiU4w@mail.gmail.com> <CACRpkdZaaZArEhw3iWaQagrKa__+DcrzSY4i7PWNYwhUiNtm4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:34011 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753605AbdLOH75 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Dec 2017 02:59:57 -0500
Received: by mail-wm0-f66.google.com with SMTP id y82so29441430wmg.1
        for <linux-gpio@vger.kernel.org>; Thu, 14 Dec 2017 23:59:57 -0800 (PST)
In-Reply-To: <CACRpkdZaaZArEhw3iWaQagrKa__+DcrzSY4i7PWNYwhUiNtm4A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, Linux MIPS <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org

Alexandre, Linux

On Fri, Dec 15, 2017 at 12:53 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> On Wed, Dec 13, 2017 at 10:23 AM, Philippe Ombredanne
> <pombredanne@nexb.com> wrote:
>> On Wed, Dec 13, 2017 at 9:15 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
>>>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>>>
>>> Wow never saw that before. OK I guess.
>>
>> That's the new thing. Less legalese boilerplate, and more code for the
>> better IMHO.
>>
>> You can check the doc patches from Thomas for details [1]
>>
>> [1] https://lkml.org/lkml/2017/12/4/934
>
> Yeah I'm aware of this part, but I didn't see that combined license
> before.
>
> What is the reason for not just using GPL 2 here?

Linus,
That'a a question for Alexandre that submitted this patch in the first
place, not me.

Alexandre?

-- 
Cordially
Philippe Ombredanne
