From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: Fix gpiochip_add_data_with_key() error path
Date: Thu, 25 Apr 2019 09:15:07 +0200
Message-ID: <CACRpkdZ0s2uZMS4K9SN+xQonKXQytBGnFR7v9ieBAwOUwi-XKg@mail.gmail.com>
References: <20190424135933.25545-1-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190424135933.25545-1-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Benoit Parrot <bparrot@ti.com>, Laxman Dewangan <ldewangan@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Apr 24, 2019 at 3:59 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The err_remove_chip block is too coarse, and may perform cleanup that
> must not be done.  E.g. if of_gpiochip_add() fails, of_gpiochip_remove()
> is still called, causing:

Good catch!

Patch applied for fixes.

Yours,
Linus Walleij
