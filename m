From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: mvebu: use correct MPP sel value for dev pins
Date: Wed, 16 May 2018 14:55:00 +0200
Message-ID: <CACRpkdbAaMrHJ8TjJTtNyVtoOSRAEf2Z8gRthFH0ze4RyybBag@mail.gmail.com>
References: <20180507022555.31645-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180507022555.31645-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Gregory Clement <gregory.clement@bootlin.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, May 7, 2018 at 4:25 AM, Chris Packham
<chris.packham@alliedtelesis.co.nz> wrote:

> The "dev" function is selected with the value 0x4 not 0x01.
>
> Fixes: commit d7ae8f8dee7f ("pinctrl: mvebu: pinctrl driver for 98DX3236 SoC")
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Patch applied.

Does it need to go into fixes? Stable?

Yours,
Linus Walleij
