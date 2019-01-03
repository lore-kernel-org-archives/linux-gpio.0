From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 0/3] Few fix for pins configuration on Armada 37xx
Date: Thu, 3 Jan 2019 15:38:57 +0100
Message-ID: <20190103153857.073d4e34@xps13>
References: <20181221173259.8372-1-gregory.clement@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181221173259.8372-1-gregory.clement@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Marcin Wojtas <mw@semihalf.com>
List-Id: linux-gpio@vger.kernel.org

Hi Gregory,

Gregory CLEMENT <gregory.clement@bootlin.com> wrote on Fri, 21 Dec 2018
18:32:56 +0100:

> Hello,
> 
> this small series fixes wrong pins configuration we currently have on
> Armada 37xx.
> 
> For now it is especially annoying it we want to enable suspend to
> RAM for PCie.

Thanks for the series, it works for me.

Tested-by: Miquel Raynal <miquel.raynal@bootlin.com>


Thanks,
Miquèl
