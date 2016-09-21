From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH] pinctrl: mvebu: orion5x: Generalise mv88f5181l support for 88f5181
Date: Wed, 21 Sep 2016 12:10:48 +0200
Message-ID: <87a8f15zrr.fsf@free-electrons.com>
References: <20160920162635.4195-1-gregory.clement@free-electrons.com>
        <CACRpkdbo6JmR=K58KQ_J0Gd5_gLqub65watU-iEabQ0rWdeVpQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:56970 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1754090AbcIUKKx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Sep 2016 06:10:53 -0400
In-Reply-To: <CACRpkdbo6JmR=K58KQ_J0Gd5_gLqub65watU-iEabQ0rWdeVpQ@mail.gmail.com>
        (Linus Walleij's message of "Tue, 20 Sep 2016 23:54:48 +0200")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Jamie Lentin <jm@lentin.co.uk>

Hi Linus,
 
 On mar., sept. 20 2016, Linus Walleij <linus.walleij@linaro.org> wrote:

> On Tue, Sep 20, 2016 at 6:26 PM, Gregory CLEMENT
> <gregory.clement@free-electrons.com> wrote:
>
>> From: Jamie Lentin <jm@lentin.co.uk>
>>
>> As far as I'm aware the mv88f5181-b1 and mv88f5181l are the same at the
>> pinctrl level, so re-use the definitions for both.
>>
>> [gregory.clement@free-electrons.com: fix commit title]
>> Signed-off-by: Jamie Lentin <jm@lentin.co.uk>
>> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>> Acked-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
>
> Is this the patch from your pull request?

yes this one.

> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> Or do you prefer that I take it into the pinctrl tree?

No it is ok, it will be in the second tentaive of my pull request.

Thanks,

Gregory


>
> Yours,
> Linus Walleij

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
