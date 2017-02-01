From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] gpio: aspeed: Add banks Y, Z, AA, AB and AC
Date: Wed, 1 Feb 2017 15:58:48 +0100
Message-ID: <CACRpkdb-s8wgqwuYHEKHGRyu3uHMWQ01Z8CJZZUmdaYuweTuZQ@mail.gmail.com>
References: <20170127042442.28994-1-andrew@aj.id.au> <CACRpkdbQu9KkR5_dfKk=1-LWLdQ3dyZdtW1JD3SeZZD1s=X3fg@mail.gmail.com>
 <1485910329.4137.34.camel@aj.id.au> <1485912024.4137.36.camel@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f172.google.com ([209.85.223.172]:36151 "EHLO
        mail-io0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751014AbdBAO6u (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Feb 2017 09:58:50 -0500
Received: by mail-io0-f172.google.com with SMTP id j13so157909066iod.3
        for <linux-gpio@vger.kernel.org>; Wed, 01 Feb 2017 06:58:49 -0800 (PST)
In-Reply-To: <1485912024.4137.36.camel@aj.id.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Feb 1, 2017 at 2:20 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Wed, 2017-02-01 at 11:22 +1030, Andrew Jeffery wrote:
>> On Tue, 2017-01-31 at 15:50 +0100, Linus Walleij wrote:
>> > > > > > On Fri, Jan 27, 2017 at 5:24 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
>> > > This is less straight-forward than one would hope, as some banks only
>> > > have 4 pins rather than 8, others are output only, yet more (W and
>> > > X, already supported) are input-only, and in the case of the g4 SoC bank
>> > > AC doesn't exist.
>> > >
>> > > Add some structs to describe the varying properties of different banks
>> > > and integrate mechanisms to deny requests for unsupported
>> > > configurations.
>> > >
>> > > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>> > >
>> > > ---
>> > >
>> > > Since v2:
>> >
>> > Patch applied with some patch -p1 < fuzz
>> > please check the result.
>>
>
> *snip*
>
>> Regardless, I'll try to recreate it myself and inspect the fuzz damage.
>
> Ah, I think I see what's happened. I didn't send "gpio: aspeed: Make
> bank names strings" again because you claimed you had applied v1 in the
> v2 thread[1]. This patch doesn't fuzz when "gpio: aspeed: Make bank
> names strings" has been applied, so is it possible that you tried
> applying it to a tree missing "gpio: aspeed: Make bank names strings"?

I mistakedly applied *both* patches to the pinctrl tree, devel branch.

I blame stress.

Oh well I guess I have to keep them there and remove this copy
from the gpio tree.

If the version I applied in the pinctrl tree is the wrong one (which
is possible) then please send an incremental patch on top fixing
the difference, so I can apply that to the pinctrl tree too....

Yours,
Linus Walleij
