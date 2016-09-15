From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: stm32: add IRQ_DOMAIN_HIERARCHY dependency
Date: Thu, 15 Sep 2016 14:13:46 +0200
Message-ID: <CACRpkdaDXk8yrnjs_y9=VU97dtRyMoYWVe1CSmw9azZNwwnpgA@mail.gmail.com>
References: <20160914101323.3254566-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160914101323.3254566-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Patrice Chotard <patrice.chotard@st.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Sep 14, 2016 at 12:13 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> The newly added irqchip support for the stm32 pinctrl driver uses
> hierarchical IRQ domains as provided by the NVIC primary irqchip.
> This works great for any configuration that may be relevant on
> stm32, but when doing compile-testing (randconfig), we can
> enable it without NVIC or any other primary irqchip that
> enables IRQ_DOMAIN_HIERARCHY:
>
> drivers/pinctrl/stm32/pinctrl-stm32.c:212:13: error: 'irq_chip_eoi_parent' undeclared here (not in a function)
> drivers/pinctrl/stm32/pinctrl-stm32.c:213:20: error: 'irq_chip_mask_parent' undeclared here (not in a function)
> drivers/pinctrl/stm32/pinctrl-stm32.c:214:20: error: 'irq_chip_unmask_parent' undeclared here (not in a function)
> drivers/pinctrl/stm32/pinctrl-stm32.c:215:20: error: 'irq_chip_set_type_parent' undeclared here (not in a function)
>
> This adds a Kconfig dependency to limit compile-testing to
> configurations that have IRQ_DOMAIN_HIERARCHY already enabled.
> It's not obvious whether we should use 'depends on' or 'select'
> here, I think either one works, with 'depends on' being more
> intuitive, while 'select' would be less likely to cause dependency
> loops.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: 0eb9f683336d ("pinctrl: Add IRQ support to STM32 gpios")

Ooops patch applied, thanks a lot!

Yours,
Linus Walleij
