From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: armada-37xx: Add edge both type gpio irq support
Date: Tue, 31 Oct 2017 14:27:13 +0100
Message-ID: <CACRpkdZxWwXcB8o4+gsYN+mnoQvE7eT5sPOO1mKNuELuo7T70g@mail.gmail.com>
References: <20171019131003.9684-1-gregory.clement@free-electrons.com>
 <CACRpkdbqjh5U5QoE_B+7GfSyDdHW-NCAvogGq-2n8j6L6nG-Gw@mail.gmail.com> <20171031131617.GA11647@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f173.google.com ([209.85.223.173]:45577 "EHLO
        mail-io0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751620AbdJaN1O (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Oct 2017 09:27:14 -0400
Received: by mail-io0-f173.google.com with SMTP id i38so35030130iod.2
        for <linux-gpio@vger.kernel.org>; Tue, 31 Oct 2017 06:27:14 -0700 (PDT)
In-Reply-To: <20171031131617.GA11647@lunn.ch>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Gregory CLEMENT <gregory.clement@free-electrons.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Antoine Tenart <antoine.tenart@free-electrons.com>, =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>, Victor Gu <xigu@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>, Hua Jing <jinghua@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>, Ken Ma <make@marvell.com>

On Tue, Oct 31, 2017 at 2:16 PM, Andrew Lunn <andrew@lunn.ch> wrote:

>> The discussion here is interesting, it is customary for GPIO drivers
>> to implement double-edge detection emulation by swapping the
>> edge detector around like this.
>
> Hi Linus
>
> I was not aware this was customary.
>
>> It might be possible to collect some generic information about
>> this in the Documentation/gpio/driver.txt document.
>
> Yes, i think it should be documented somewhere. Even in the use case
> here, detecting an SD card being inserted/removed, you could get some
> bounce on the microswitch, miss an edge, and be in the wrong state.

Indeed :/

This is I guess why it is a good idea to combine this with the
debounce feature if the hardware supports it.

I'll think about some writeup.

Yours,
Linus Walleij
