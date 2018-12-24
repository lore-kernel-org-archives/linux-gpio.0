From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH 1/3] pinctrl: armada-37xx: Correct mpp definitions
Date: Mon, 24 Dec 2018 18:05:15 +0100
Message-ID: <87efa6c0tw.fsf@bootlin.com>
References: <20181221173259.8372-1-gregory.clement@bootlin.com>
        <20181221173259.8372-2-gregory.clement@bootlin.com>
        <20181222033213.43642e0f@nic.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181222033213.43642e0f@nic.cz> (Marek Behun's message of "Sat,
        22 Dec 2018 03:32:13 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Behun <marek.behun@nic.cz>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@bootlin.com>, =?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Marcin Wojtas <mw@semihalf.com>
List-Id: linux-gpio@vger.kernel.org

Hi Marek,
 
 On sam., déc. 22 2018, Marek Behun <marek.behun@nic.cz> wrote:

> On Fri, 21 Dec 2018 18:32:57 +0100
> Gregory CLEMENT <gregory.clement@bootlin.com> wrote:
>
>> +	PIN_GRP_GPIO("pcie1", 3, 1, BIT(5), "pcie"),
>> +	PIN_GRP_GPIO("pcie1_clkreq", 4, 1, BIT(9), "pcie"),
>
> If the pair is split to clkreq and reset, shouldn't the first be called
> pcie1_reset?

I considered this but chose to keep pcie1 in order to preserve backward
compatibility.

I agree that it is debatable, because without the fix the old device
tree can't work. However I find it better preserving the initial intent
of an existing device tree.

By talking about it, I think about an other option, keeping pcie1 name
to setup the pins 39 and 40 how it was documented. And introducing
pcie1_reset and pcie1_clkreq for new binding. however I don't know how
it could be handle by the pinctrl framework.

Gregory

> Marek

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
