From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: mxs: use enable/disable regs to (un)mask irqs
Date: Mon, 24 Oct 2016 02:56:39 +0200
Message-ID: <CACRpkdYkKPMvVcvxzvAsMvaNUADc0e0GOMEFokzgPips=003Bg@mail.gmail.com>
References: <20161021131138.10467-1-s.hauer@pengutronix.de> <20161021131138.10467-2-s.hauer@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161021131138.10467-2-s.hauer@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Marek Vasut <marex@denx.de>
List-Id: linux-gpio@vger.kernel.org

On Fri, Oct 21, 2016 at 3:11 PM, Sascha Hauer <s.hauer@pengutronix.de> wrote:

> The mxs gpio controller does not only have a mask register to mask
> interrupts, but also enable/disable registers. Use the enable/disable
> registers rather than the mask register. This does not have any
> advantage for now, but makes the next patch simpler.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Patch applied with Marek's review tag.

Yours,
Linus Walleij
