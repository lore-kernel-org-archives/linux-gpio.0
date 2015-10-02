From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: pinconf-generic: sort pin configuration
 params alphabetically
Date: Fri, 2 Oct 2015 15:08:03 -0700
Message-ID: <CACRpkdaGjonCSpNy-FUgN2t8+Fy5rT-SLKywZ_xRLOCRkYyewQ@mail.gmail.com>
References: <1443614838-23569-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1443614838-23569-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Sep 30, 2015 at 5:07 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Currently, the dt_params array in drivers/pinctrl/pinconf-generic.c
> is not sorted in the same order as the enum pin_config_param in
> include/linux/pinctrl/pinconf-generic.h.
>
> Sort enum pin_config_param, conf_items, dt_params, alphabetically
> for consistency.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
