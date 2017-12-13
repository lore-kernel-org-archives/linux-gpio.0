From: Philippe Ombredanne <pombredanne@nexb.com>
Subject: Re: [PATCH v2 05/13] pinctrl: Add Microsemi Ocelot SoC driver
Date: Wed, 13 Dec 2017 10:23:21 +0100
Message-ID: <CAOFm3uF_OjqK0cQ1A4Xkp8kZab+afqPsnF5rB9=a7Dym9jiU4w@mail.gmail.com>
References: <20171208154618.20105-1-alexandre.belloni@free-electrons.com>
 <20171208154618.20105-6-alexandre.belloni@free-electrons.com> <CACRpkdZ=+pFZYteq=wM=z-CGejY+dX_SqhtDbbGBn+q60arQ4w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f178.google.com ([209.85.128.178]:46590 "EHLO
        mail-wr0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751523AbdLMJYD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Dec 2017 04:24:03 -0500
Received: by mail-wr0-f178.google.com with SMTP id x49so1450368wrb.13
        for <linux-gpio@vger.kernel.org>; Wed, 13 Dec 2017 01:24:02 -0800 (PST)
In-Reply-To: <CACRpkdZ=+pFZYteq=wM=z-CGejY+dX_SqhtDbbGBn+q60arQ4w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Ralf Baechle <ralf@linux-mips.org>, Linux MIPS <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org

On Wed, Dec 13, 2017 at 9:15 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>
> Wow never saw that before. OK I guess.

That's the new thing. Less legalese boilerplate, and more code for the
better IMHO.

You can check the doc patches from Thomas for details [1]

[1] https://lkml.org/lkml/2017/12/4/934
-- 
Cordially
Philippe Ombredanne
