From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: ocelot: add MSCC Jaguar2 support
Date: Fri, 21 Dec 2018 11:48:04 +0100
Message-ID: <CACRpkdagN74C_j1Fg5_fOPANCjLi3Xfxhp=0yTgkFKZ0iGqP2w@mail.gmail.com>
References: <20181218200619.8281-1-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181218200619.8281-1-alexandre.belloni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Dec 18, 2018 at 9:06 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:

> Jaguar2 has the same register layout as Ocelot but it has 64 pins, meaning
> that there are 2 registers instead of one.
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Patch applied.

You know what you're doing and the DT binding update is completely
uncontroversial.

Yours,
Linus Walleij
