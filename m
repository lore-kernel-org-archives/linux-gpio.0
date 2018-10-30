From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 5/5] pinctrl: pinctrl-at91-pio4: simplify getting .driver_data
Date: Tue, 30 Oct 2018 14:24:46 +0100
Message-ID: <CACRpkdYVa=0JOkRT=sm-eB+NSMGjHyWAzzZrc6UY8jdYRpuOtw@mail.gmail.com>
References: <20181021200032.1833-1-wsa+renesas@sang-engineering.com> <20181021200032.1833-6-wsa+renesas@sang-engineering.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181021200032.1833-6-wsa+renesas@sang-engineering.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Ludovic Desroches <ludovic.desroches@microchip.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sun, Oct 21, 2018 at 10:00 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:

> We should get 'driver_data' from 'struct device' directly. Going via
> platform_device is an unneeded step back and forth.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Patch applied with the acks.

Yours,
Linus Walleij
