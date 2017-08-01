From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: stm32: select IRQ_DOMAIN_HIERARCHY instead
 of depends on
Date: Tue, 1 Aug 2017 10:05:33 +0200
Message-ID: <CACRpkdZoSeb0dc6E1nnEqKp=XGp4U2nmm8S42bMi6CYg2=LTBg@mail.gmail.com>
References: <1499814710-16686-1-git-send-email-yamada.masahiro@socionext.com> <1499814710-16686-2-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1499814710-16686-2-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Alexandre Torgue <alexandre.torgue@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jul 12, 2017 at 1:11 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Drivers that need IRQ_DOMAIN_HIERARCHY should "select" it, but
> drivers/pinctrl/stm32/Kconfig is the only exception that uses
> "depends on" syntax.  This prevents GPIO drivers from select'ing
> IRQ_DOMAIN_HIERARCHY.
>
> For example, if I add "select IRQ_DOMAIN_HIERARCHY" to GPIO_XGENE_SB,
> I get the following recursive dependency error.
>
> drivers/gpio/Kconfig:13:error: recursive dependency detected!
> For a resolution refer to Documentation/kbuild/kconfig-language.txt
> subsection "Kconfig recursive dependency limitations"
> drivers/gpio/Kconfig:13:        symbol GPIOLIB is selected by PINCTRL_STM32
> For a resolution refer to Documentation/kbuild/kconfig-language.txt
> subsection "Kconfig recursive dependency limitations"
> drivers/pinctrl/stm32/Kconfig:3:        symbol PINCTRL_STM32 is selected by PINCTRL_STM32F429
> For a resolution refer to Documentation/kbuild/kconfig-language.txt
> subsection "Kconfig recursive dependency limitations"
> drivers/pinctrl/stm32/Kconfig:11:       symbol PINCTRL_STM32F429 depends on IRQ_DOMAIN_HIERARCHY
> For a resolution refer to Documentation/kbuild/kconfig-language.txt
> subsection "Kconfig recursive dependency limitations"
> kernel/irq/Kconfig:67:  symbol IRQ_DOMAIN_HIERARCHY is selected by GPIO_XGENE_SB
> For a resolution refer to Documentation/kbuild/kconfig-language.txt
> subsection "Kconfig recursive dependency limitations"
> drivers/gpio/Kconfig:502:       symbol GPIO_XGENE_SB depends on GPIOLIB
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied for GPIO fixes with Alexandre's test tag.

Yours,
Linus Walleij
