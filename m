From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] pinctrl: berlin: fix 'pctrl->functions' allocation in berlin_pinctrl_build_state
Date: Fri, 3 Aug 2018 19:29:11 +0200
Message-ID: <CACRpkdZeCfOvwQ5qsHwzTD-wAyhqXMjfGbp6CGBtXdq4UifCwg@mail.gmail.com>
References: <20180801051049.21360-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180801051049.21360-1-yuehaibing@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: yuehaibing@huawei.com
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Kees Cook <keescook@chromium.org>, Jisheng Zhang <Jisheng.Zhang@synaptics.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Aug 1, 2018 at 7:11 AM YueHaibing <yuehaibing@huawei.com> wrote:

> fixes following Smatch static check warning:
>
>  drivers/pinctrl/berlin/berlin.c:237 berlin_pinctrl_build_state()
>  warn: passing devm_ allocated variable to kfree. 'pctrl->functions'
>
> As we will be calling krealloc() on pointer 'pctrl->functions', which means
> kfree() will be called in there, devm_kzalloc() shouldn't be used with
> the allocation in the first place.  Fix the warning by calling kcalloc()
> and managing the free procedure in error path on our own.
>
> Fixes: 3de68d331c24 ("pinctrl: berlin: add the core pinctrl driver for Marvell Berlin SoCs")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
> v2: free pctrl->functions instead of function as Jisheng Zhang suggested
> v3: v2 I send a wrong patch,this is the correct patch.

Patch applied with Jisheng's ACK!

Yours,
Linus Walleij
