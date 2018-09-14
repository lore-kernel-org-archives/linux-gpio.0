From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: at91: don't use the same irqchip with multiple gpiochips
Date: Fri, 14 Sep 2018 10:59:47 +0200
Message-ID: <CACRpkdZWoZ1YCP9eJbB0BgfgON=Zf8q4w=OV4w2nRxvkcd6VaQ@mail.gmail.com>
References: <20180913124213.32065-1-ludovic.desroches@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180913124213.32065-1-ludovic.desroches@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Hans Verkuil <hverkuil@xs4all.nl>
List-Id: linux-gpio@vger.kernel.org

On Thu, Sep 13, 2018 at 2:46 PM Ludovic Desroches
<ludovic.desroches@microchip.com> wrote:

> Sharing the same irqchip with multiple gpiochips is not a good
> practice. For instance, when installing hooks, we change the state
> of the irqchip. The initial state of the irqchip for the second
> gpiochip to register is then disrupted.
>
> Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>

Patch applied.

Yours,
Linus Walleij
