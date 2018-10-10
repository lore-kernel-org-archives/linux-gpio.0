From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: mediatek: select GPIOLIB
Date: Wed, 10 Oct 2018 13:53:46 +0200
Message-ID: <CACRpkdYwGyMosmwW9YkMSKs4VCet7c0itwx0jUKOXnGMkS2g9w@mail.gmail.com>
References: <20181008155803.3322412-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181008155803.3322412-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, Biao Huang <biao.huang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, zh.chen@mediatek.com, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Oct 8, 2018 at 5:58 PM Arnd Bergmann <arnd@arndb.de> wrote:

> Removing the linux/gpio.h include means we no longer have a declaration
> of gpiochip_lock_as_irq() when CONFIG_GPIOLIB is disabled:
>
> drivers/pinctrl/mediatek/mtk-eint.c: In function 'mtk_eint_irq_request_resources':
> drivers/pinctrl/mediatek/mtk-eint.c:247:8: error: implicit declaration of function 'gpiochip_lock_as_irq'; did you mean 'spin_lock_irq'? [-Werror=implicit-function-declaration]
> drivers/pinctrl/mediatek/mtk-eint.c: In function 'mtk_eint_irq_release_resources':
> drivers/pinctrl/mediatek/mtk-eint.c:272:2: error: implicit declaration of function 'gpiochip_unlock_as_irq'; did you mean 'spin_unlock_irq'? [-Werror=implicit-function-declaration]
>
> Select it explictly instead.
>
> Fixes: 1c5fb66afa2a ("pinctrl: Include <linux/gpio/driver.h> nothing else")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied.

Yours,
Linus Walleij
