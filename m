From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH 0/4] irqchip: renesas: Use proper irq_chip name and parent
Date: Tue, 11 Jun 2019 12:23:02 +0100
Message-ID: <b1720fb0-b638-32d1-7f48-c1f24b64e83f@arm.com>
References: <20190607095858.10028-1-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190607095858.10028-1-geert+renesas@glider.be>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 07/06/2019 10:58, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> Recently, Marc pointed out some common misconceptions w.r.t. the .name
> and .parent_device fields in struct irq_chip.  This patch series fixes
> them in the Renesas interrupt controller drivers.
> 
> The first two patches are destined for the irqchip tree, the last two
> for the GPIO tree.
> 
> Thanks!
> 
> Geert Uytterhoeven (4):
>   irqchip/renesas-intc-irqpin: Use proper irq_chip name and parent
>   irqchip/renesas-irqc: Use proper irq_chip name and parent
>   gpio: em: Use proper irq_chip name
>   gpio: rcar: Use proper irq_chip name
> 
>  drivers/gpio/gpio-em.c                    | 2 +-
>  drivers/gpio/gpio-rcar.c                  | 2 +-
>  drivers/irqchip/irq-renesas-intc-irqpin.c | 3 ++-
>  drivers/irqchip/irq-renesas-irqc.c        | 3 ++-
>  4 files changed, 6 insertions(+), 4 deletions(-)
> 

I've applied patches 1 and2 to the irqchip tree.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
