From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 05/13] pinctrl: Add Microsemi Ocelot SoC driver
Date: Fri, 15 Dec 2017 00:53:25 +0100
Message-ID: <CACRpkdZaaZArEhw3iWaQagrKa__+DcrzSY4i7PWNYwhUiNtm4A@mail.gmail.com>
References: <20171208154618.20105-1-alexandre.belloni@free-electrons.com>
 <20171208154618.20105-6-alexandre.belloni@free-electrons.com>
 <CACRpkdZ=+pFZYteq=wM=z-CGejY+dX_SqhtDbbGBn+q60arQ4w@mail.gmail.com> <CAOFm3uF_OjqK0cQ1A4Xkp8kZab+afqPsnF5rB9=a7Dym9jiU4w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:41218 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754291AbdLNXx0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Dec 2017 18:53:26 -0500
Received: by mail-it0-f68.google.com with SMTP id x28so15591406ita.0
        for <linux-gpio@vger.kernel.org>; Thu, 14 Dec 2017 15:53:26 -0800 (PST)
In-Reply-To: <CAOFm3uF_OjqK0cQ1A4Xkp8kZab+afqPsnF5rB9=a7Dym9jiU4w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Philippe Ombredanne <pombredanne@nexb.com>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Ralf Baechle <ralf@linux-mips.org>, Linux MIPS <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org

On Wed, Dec 13, 2017 at 10:23 AM, Philippe Ombredanne
<pombredanne@nexb.com> wrote:
> On Wed, Dec 13, 2017 at 9:15 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
>>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>>
>> Wow never saw that before. OK I guess.
>
> That's the new thing. Less legalese boilerplate, and more code for the
> better IMHO.
>
> You can check the doc patches from Thomas for details [1]
>
> [1] https://lkml.org/lkml/2017/12/4/934

Yeah I'm aware of this part, but I didn't see that combined license
before.

What is the reason for not just using GPL 2 here?

Yours,
Linus Walleij
