From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] pinctrl: armada-37xx: Add edge both type gpio irq support
Date: Tue, 31 Oct 2017 14:16:17 +0100
Message-ID: <20171031131617.GA11647@lunn.ch>
References: <20171019131003.9684-1-gregory.clement@free-electrons.com>
 <CACRpkdbqjh5U5QoE_B+7GfSyDdHW-NCAvogGq-2n8j6L6nG-Gw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([185.16.172.187]:35050 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751050AbdJaNQT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 31 Oct 2017 09:16:19 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdbqjh5U5QoE_B+7GfSyDdHW-NCAvogGq-2n8j6L6nG-Gw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Gregory CLEMENT <gregory.clement@free-electrons.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Antoine Tenart <antoine.tenart@free-electrons.com>, =?iso-8859-1?Q?Miqu=E8l?= Raynal <miquel.raynal@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>, Victor Gu <xigu@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>, Hua Jing <jinghua@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>, Ken Ma <make@marvell.com>

> Patch applied.
> 
> The discussion here is interesting, it is customary for GPIO drivers
> to implement double-edge detection emulation by swapping the
> edge detector around like this.

Hi Linus

I was not aware this was customary.

> It might be possible to collect some generic information about
> this in the Documentation/gpio/driver.txt document.

Yes, i think it should be documented somewhere. Even in the use case
here, detecting an SD card being inserted/removed, you could get some
bounce on the microswitch, miss an edge, and be in the wrong state.

       Andrew
