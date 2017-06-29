From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: armada-37xx: Fix uart2 group selection
 register mask
Date: Thu, 29 Jun 2017 11:44:33 +0200
Message-ID: <CACRpkdYsWrT-q5baD-Y7RYs2aQ2J3suEcEe4G8GceJUYS7JXyQ@mail.gmail.com>
References: <20170623122952.9871-1-gregory.clement@free-electrons.com> <20170623122952.9871-2-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170623122952.9871-2-gregory.clement@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ken Ma <make@marvell.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Stefan Roese <sr@denx.de>, Nadav Haklai <nadavh@marvell.com>, Victor Gu <xigu@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>, Hua Jing <jinghua@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>
List-Id: linux-gpio@vger.kernel.org

On Fri, Jun 23, 2017 at 2:29 PM, Gregory CLEMENT
<gregory.clement@free-electrons.com> wrote:

> From: Ken Ma <make@marvell.com>
>
> If north bridge selection register bit1 is clear, pins [10:8] are for
> SDIO0 Resetn, Wakeup, and PDN while if bit1 is set, pins [10:8]are for
> GPIO; when bit1 is clear, pin 9 and pin 10 can be used for uart2 RTSn
> and CTSn, so bit1 should be added to uart2 group and it must be set
> for both "gpio" and "uart" functions of uart2 group.
>
> Signed-off-by: Ken Ma <make@marvell.com>
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>

Patch applied.

Yours,
Linus Walleij
