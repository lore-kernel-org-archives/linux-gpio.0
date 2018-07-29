From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: mediatek: include chained_irq.h header
Date: Sun, 29 Jul 2018 23:15:54 +0200
Message-ID: <CACRpkdYHhS7sPY6RqMNUSZ+otnoGPkBVgcfT20B-jscemnmotQ@mail.gmail.com>
References: <20180724115722.1274065-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180724115722.1274065-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jul 24, 2018 at 1:57 PM Arnd Bergmann <arnd@arndb.de> wrote:

> Some randconfig builds fail in the mtk-eint driver:
>
> drivers/pinctrl/mediatek/mtk-eint.c: In function 'mtk_eint_irq_handler':
> drivers/pinctrl/mediatek/mtk-eint.c:324:2: error: implicit declaration of function 'chained_irq_enter'; did you mean 'rcu_irq_enter'? [-Werror=implicit-function-declaration]
>   chained_irq_enter(chip, desc);
>   ^~~~~~~~~~~~~~~~~
>   rcu_irq_enter
> drivers/pinctrl/mediatek/mtk-eint.c:367:2: error: implicit declaration of function 'chained_irq_exit'; did you mean 'rcu_irq_exit'? [-Werror=implicit-function-declaration]
>
> The functions are declared in linux/irqchip/chained_irq.h, and including
> that header makes it build in all configurations.
>
> Fixes: e46df235b4e6 ("pinctrl: mediatek: refactor EINT related code for all MediaTek pinctrl can fit")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied!

Thanks Arnd!

Yours,
Linus Walleij
