From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: aspeed: g4: Fix mux configuration for GPIOs
 AA[4-7], AB[0-7]
Date: Thu, 26 Jan 2017 14:43:11 +0100
Message-ID: <CACRpkdZvgOGqNMArExNoc3EJLSnydpF6TAXsvWD5ubPLA12dNA@mail.gmail.com>
References: <20170123052717.9528-1-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170123052717.9528-1-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jan 23, 2017 at 6:27 AM, Andrew Jeffery <andrew@aj.id.au> wrote:

> Incorrect video output configuration bits were being tested on pins in
> GPIO banks AA and AB for the ROM{8,16} mux functions. The ROM{8,16}
> functions are the highest priority for the relevant pins and also the
> default function, so we require the relevant video output configuration
> be disabled to mux GPIO functionality. As the wrong bits were being
> tested a GPIO export would succeed but leave the pin in an unresponsive
> state (i.e. value updates were ignored).
>
> This misbehaviour was discovered as part of extending the GPIO
> controller's support to cover banks Y, Z, AA, AB and AC (AC in the case
> of the g5 SoC).
>
> Fixes: 6d329f14a75f ("pinctrl: aspeed-g4: Add mux configuration for all pins")
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Patch applied.

Yours,
Linus Walleij
