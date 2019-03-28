From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] gpio: Remove obsolete comment about
 gpiochip_free_hogs() usage
Date: Thu, 28 Mar 2019 18:00:38 +0100
Message-ID: <CACRpkdZfXnwd1Onm7YgBi89GfC_jtSEAy0GrRHuQhBddaFL_VA@mail.gmail.com>
References: <20190328131349.18838-1-geert+renesas@glider.be> <20190328131349.18838-4-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190328131349.18838-4-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Benoit Parrot <bparrot@ti.com>, Laxman Dewangan <ldewangan@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Mar 28, 2019 at 2:13 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> gpiochip_free_hogs() was always called from gpiochip_remove(), not
> of_gpiochip_remove().  It is now also called from the failure patch in
> gpiochip_add_data_with_key().
>
> Fixes: f625d4601759f1cf ("gpio: add GPIO hogging mechanism")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied for v5.2.

Yours,
Linus Walleij
