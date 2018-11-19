From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] gpio: davinci: restore a way to manually specify the
 GPIO base
Date: Mon, 19 Nov 2018 14:19:25 +0100
Message-ID: <CACRpkdZkZeVSi3O1AR-uZFcBEwp6BN95UxkgKHZz3FJbOHS3mw@mail.gmail.com>
References: <20181113135051.15308-1-brgl@bgdev.pl> <20181113135051.15308-3-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20181113135051.15308-3-brgl@bgdev.pl>
Sender: stable-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "Nori, Sekhar" <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Russell King <linux@armlinux.org.uk>, Keerthy <j-keerthy@ti.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, stable <stable@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Nov 13, 2018 at 2:51 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Commit 587f7a694f01 ("gpio: davinci: Use dev name for label and
> automatic base selection") broke the network support in legacy boot
> mode for da850-evm since we can no longer request the MDIO clock GPIO.
>
> Other boards may be broken too, which I haven't tested.
>
> The problem is in the fact that most board files still use the legacy
> GPIO API where lines are requested by numbers rather than descriptors.
>
> While this should be fixed eventually, in order to unbreak the board
> for now - provide a way to manually specify the GPIO base in platform
> data.
>
> Fixes: 587f7a694f01 ("gpio: davinci: Use dev name for label and automatic base selection")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

I guess this will be merged throug ARM SoC?

Yours,
Linus Walleij
