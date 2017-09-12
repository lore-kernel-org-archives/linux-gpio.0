From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] pinctrl: sprd: fix build errors and dependencies
Date: Tue, 12 Sep 2017 09:39:30 +0200
Message-ID: <CACRpkdbz6bxmT3HwAT9kXnqg9UibLfmPbzpaEYgC-uOJ+bZofQ@mail.gmail.com>
References: <cef46365-5695-ee20-c2cf-12cad823d179@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cef46365-5695-ee20-c2cf-12cad823d179@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Baolin Wang <baolin.wang@spreadtrum.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Sep 4, 2017 at 5:35 PM, Randy Dunlap <rdunlap@infradead.org> wrote:

> From: Randy Dunlap <rdunlap@infradead.org>
>
> Fix build errors when CONFIG_OF is not enabled.
> Also, the pinctrl-sprd-sc9860 driver uses functions from the pinctrl-sprd
> driver, so the former should depend on the latter driver.
>
> ../drivers/pinctrl/sprd/pinctrl-sprd.c: In function 'sprd_dt_node_to_map':
> ../drivers/pinctrl/sprd/pinctrl-sprd.c:290:2: error: implicit declaration of function 'pinconf_generic_parse_dt_config' [-Werror=implicit-function-declaration]
>   ret = pinconf_generic_parse_dt_config(np, pctldev, &configs,
>   ^
> ../drivers/pinctrl/sprd/pinctrl-sprd.c: At top level:
> ../drivers/pinctrl/sprd/pinctrl-sprd.c:844:44: error: array type has incomplete element type
>  static const struct pinconf_generic_params sprd_dt_params[] = {
>                                             ^
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Baolin Wang <baolin.wang@spreadtrum.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org

Patch applied for fixes.

Yours,
Linus Walleij
