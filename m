From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: mvebu: Fix cause computation in irq handler
Date: Mon, 7 Aug 2017 14:15:12 +0200
Message-ID: <CACRpkda6mm8Ogam2vD6LY4XBwzKdSeh8-e5ieUZWtZXnbSrOhg@mail.gmail.com>
References: <20170712112229.858-1-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170712112229.858-1-gregory.clement@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Nadav Haklai <nadavh@marvell.com>, Shadi Ammouri <shadi@marvell.com>, Yehuda Yitschak <yehuday@marvell.com>, Omri Itach <omrii@marvell.com>, Hanna Hawa <hannah@marvell.com>, Igal Liberman <igall@marvell.com>, Marcin Wojtas <mw@semihalf.com>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jul 12, 2017 at 1:22 PM, Gregory CLEMENT
<gregory.clement@free-electrons.com> wrote:

> When switching to regmap, the way to compute the irq cause was
> reorganized. However while doing it, a typo was introduced: a 'xor'
> replaced a 'and'.
>
> This lead to wrong behavior in the interrupt handler ans one of the
> symptom was wrong irq handler called on the Armada 388 GP:
> "->handle_irq():  c016303c,
> handle_bad_irq+0x0/0x278
> ->irq_data.chip(): c0b0ec0c,
> 0xc0b0ec0c
> ->action():   (null)
>    IRQ_NOPROBE set
>  IRQ_NOREQUEST set
> unexpected IRQ trap at vector 00
> irq 0, desc: ee804800, depth: 1, count: 0, unhandled: 0"
>
> Fixes: 2233bf7a92e7 ("gpio: mvebu: switch to regmap for register access")
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>

Patch applied for fixes.

Yours,
Linus Walleij
