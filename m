From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: ocelot: fix gpio direction
Date: Mon, 26 Mar 2018 11:05:25 +0200
Message-ID: <CACRpkdbEWdo6UNL2HSzvvszQZjYnyYTOuWQzkmqSw=CvpGYhOw@mail.gmail.com>
References: <20180322123500.2379-1-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180322123500.2379-1-alexandre.belloni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Mar 22, 2018 at 1:35 PM, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:

> Bits have to be cleared in DEVCPU_GCB:GPIO:GPIO_OE for input and set for
> output. ocelot_gpio_set_direction() got it wrong and this went unnoticed
> when the driver was reworked.
>
> Reported-by: Gregory Clement <gregory.clement@bootlin.com>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Patch applied.

Yours,
Linus Walleij
