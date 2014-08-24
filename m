From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH linux-next] irq: export handle_fasteoi_irq
Date: Sun, 24 Aug 2014 22:17:40 +0200
Message-ID: <4865705.6YRejgXUhp@wuerfel>
References: <1408663880-29179-1-git-send-email-vincent.stehle@laposte.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1408663880-29179-1-git-send-email-vincent.stehle@laposte.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Vincent =?ISO-8859-1?Q?Stehl=E9?= <vincent.stehle@laposte.net>, linux-next@vger.kernel.org, linux-gpio@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: linux-gpio@vger.kernel.org

On Friday 22 August 2014 01:31:20 Vincent Stehl=E9 wrote:
> Export handle_fasteoi_irq to be able to use it in e.g. the Zynq gpio =
driver
> since commit 6dd859508336 ("gpio: zynq: Fix IRQ handlers").
>=20
> This fixes the following link issue:
>=20
>   ERROR: "handle_fasteoi_irq" [drivers/gpio/gpio-zynq.ko] undefined!
>=20
> Signed-off-by: Vincent Stehl=E9 <vincent.stehle@laposte.net>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Lars-Peter Clausen <lars@metafoo.de>
> Cc: Linus Walleij <linus.walleij@linaro.org>
>=20

Acked-by: Arnd Bergmann <arnd@arndb.de>

I saw the same thing here and came up with the same fix.
