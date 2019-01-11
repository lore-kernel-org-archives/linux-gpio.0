From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/3] Few fix for pins configuration on Armada 37xx
Date: Fri, 11 Jan 2019 09:54:47 +0100
Message-ID: <CACRpkdZbano_a1CgF8mzUULZwgUL5rP3bnHPhvm+yB_G=wohbg@mail.gmail.com>
References: <20181221173259.8372-1-gregory.clement@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181221173259.8372-1-gregory.clement@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Antoine Tenart <antoine.tenart@bootlin.com>, =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Marcin Wojtas <mw@semihalf.com>
List-Id: linux-gpio@vger.kernel.org

On Fri, Dec 21, 2018 at 6:33 PM Gregory CLEMENT
<gregory.clement@bootlin.com> wrote:

> this small series fixes wrong pins configuration we currently have on
> Armada 37xx.
>
> For now it is especially annoying it we want to enable suspend to
> RAM for PCie.

All three patches applied for next (v5.1) with Miquel's
test tag.

Yours,
Linus Walleij
