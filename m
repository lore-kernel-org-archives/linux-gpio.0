From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: armada-37xx: Fix spurious irq management
Date: Thu, 24 May 2018 10:17:06 +0200
Message-ID: <CACRpkdak2q56BpjrvpGF_FzN=ZTbZ+71r425rFAe=b-kRQDqwA@mail.gmail.com>
References: <20180523084405.14410-1-gregory.clement@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180523084405.14410-1-gregory.clement@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Antoine Tenart <antoine.tenart@bootlin.com>, =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Victor Gu <xigu@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>, Hua Jing <jinghua@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>, Terry Zhou <bjzhou@marvell.com>, stable <stable@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, May 23, 2018 at 10:44 AM, Gregory CLEMENT
<gregory.clement@bootlin.com> wrote:

> From: Terry Zhou <bjzhou@marvell.com>
>
> Until now, if we found spurious irq in irq_handler, we only updated the
> status in register but not the status in the code. Due to this the system
> will got stuck dues to the infinite loop
>
> [gregory.clement@bootlin.com: update comment and add fix and stable tags]
> Fixes: 30ac0d3b0702 ("pinctrl: armada-37xx: Add edge both type gpio irq support")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Terry Zhou <bjzhou@marvell.com>
> Reviewed-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Patch applied.

Yours,
Linus Walleij
