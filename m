From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: check ops->pin_config_set in pinconf_set_config()
Date: Mon, 7 Aug 2017 15:21:53 +0200
Message-ID: <CACRpkda7xLrd5z=WXXbPFL+_iwZ=x5ctZGhm5yPoUurtb9Yspg@mail.gmail.com>
References: <1501815572-2792-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1501815572-2792-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Aug 4, 2017 at 4:59 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> pinconf_set_config() is called by pinctrl_gpio_set_config().
> If a GPIO driver is backed by a pinctrl driver and it does not
> support .pin_config_set() hook, it causes NULL pointer dereference.
>
> Fixes: 15381bc7c7f5 ("pinctrl: Allow configuration of pins from gpiolib based drivers")
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patcg applied with Mika's ACK.

Yours,
Linus Walleij
