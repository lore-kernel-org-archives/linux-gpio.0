From: Marek Behun <marek.behun@nic.cz>
Subject: Re: [PATCH 1/3] pinctrl: armada-37xx: Correct mpp definitions
Date: Sat, 22 Dec 2018 03:32:13 +0100
Message-ID: <20181222033213.43642e0f@nic.cz>
References: <20181221173259.8372-1-gregory.clement@bootlin.com>
        <20181221173259.8372-2-gregory.clement@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181221173259.8372-2-gregory.clement@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@bootlin.com>, =?UTF-8?B?TWlxdcOobA==?= Raynal <miquel.raynal@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Marcin Wojtas <mw@semihalf.com>
List-Id: linux-gpio@vger.kernel.org

On Fri, 21 Dec 2018 18:32:57 +0100
Gregory CLEMENT <gregory.clement@bootlin.com> wrote:

> +	PIN_GRP_GPIO("pcie1", 3, 1, BIT(5), "pcie"),
> +	PIN_GRP_GPIO("pcie1_clkreq", 4, 1, BIT(9), "pcie"),

If the pair is split to clkreq and reset, shouldn't the first be called
pcie1_reset?
Marek
