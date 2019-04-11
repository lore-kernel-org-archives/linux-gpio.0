From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: eic: sprd: Fix incorrect irq type setting for the
 sync EIC
Date: Thu, 11 Apr 2019 15:40:16 +0200
Message-ID: <CACRpkdY5kKRMkTV8-d_CgF75J3cOA+v2Hv2w4K7FqtDy+ABDmg@mail.gmail.com>
References: <e7ca1df3b3159d6e1c65c6a2a9f01a7ecabcc821.1554882235.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e7ca1df3b3159d6e1c65c6a2a9f01a7ecabcc821.1554882235.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Orson Zhai <orsonzhai@gmail.com>, Lyra Zhang <zhang.lyra@gmail.com>, Mark Brown <broonie@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Apr 10, 2019 at 9:48 AM Baolin Wang <baolin.wang@linaro.org> wrote:

> When setting sync EIC as IRQ_TYPE_EDGE_BOTH type, we missed to set the
> SPRD_EIC_SYNC_INTMODE register to 0, which means detecting edge signals.
>
> Thus this patch fixes the issue.
>
> Fixes: 25518e024e3a ("gpio: Add Spreadtrum EIC driver support")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>

Patch applied for fixes.

Yours,
Linus Walleij
