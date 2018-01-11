From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/4] bcm2835-gpio-exp: Driver for GPIO expander via
 mailbox service
Date: Thu, 11 Jan 2018 10:39:32 +0100
Message-ID: <CACRpkdZWF+8dX6eOHDO+qv=ubwqxTx4MJphoOCX4130eaEqGMA@mail.gmail.com>
References: <cover.1514898134.git.baruch@tkos.co.il> <bcac00c71b29c359b59053a30d817a8f17d6731d.1514898134.git.baruch@tkos.co.il>
 <CACRpkdb73jGGRm5OrXLGYSOjMni-NsOwdC7TXH2k+iAEnAvL2g@mail.gmail.com> <20180110034557.5sqpbsvt6ly6s2go@tarshish>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:35797 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754313AbeAKJjd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Jan 2018 04:39:33 -0500
Received: by mail-qk0-f195.google.com with SMTP id w1so3499770qka.2
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jan 2018 01:39:32 -0800 (PST)
In-Reply-To: <20180110034557.5sqpbsvt6ly6s2go@tarshish>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Baruch Siach <baruch@tkos.co.il>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.org>, Eric Anholt <eric@anholt.net>, Stefan Wahren <stefan.wahren@i2se.com>, linux-gpio@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>

On Wed, Jan 10, 2018 at 4:45 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Linus,
>
> On Wed, Jan 03, 2018 at 11:08:15AM +0100, Linus Walleij wrote:
>> On Tue, Jan 2, 2018 at 2:19 PM, Baruch Siach <baruch@tkos.co.il> wrote:
>> > +#include <linux/err.h>
>> > +#include <linux/gpio.h>
>>
>> Just use
>>
>> #include <linux/driver.h>
>
> You mean linux/gpio/driver.h, right?

Yes.

> I still need linux/gpio.h for GPIOF_DIR_*.

Don't use these, just use 0 and 1 open coded for the
moment (if you check my devel branch, the references to
these flags are gone).

We need to make new defines for the new API.

Yours,
Linus Walleij
