From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] gpio: of: Fix of_gpiochip_add() error path
Date: Thu, 28 Mar 2019 17:58:28 +0100
Message-ID: <CACRpkdbjwp6MRT17GKHubv_Tvo+A=vSNdatsyx7Anbugi+7mQg@mail.gmail.com>
References: <20190328131349.18838-1-geert+renesas@glider.be> <20190328131349.18838-2-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190328131349.18838-2-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Benoit Parrot <bparrot@ti.com>, Laxman Dewangan <ldewangan@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Mar 28, 2019 at 2:13 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> If the call to of_gpiochip_scan_gpios() in of_gpiochip_add() fails, no
> error handling is performed.  This lead to the need of callers to call
> of_gpiochip_remove() on failure, which causes "BAD of_node_put() on ..."
> if the failure happened before the call to of_node_get().
>
> Fix this by adding proper error handling.
>
> Note that calling gpiochip_remove_pin_ranges() multiple times causes no
> harm: subsequent calls are a no-op.
>
> Fixes: dfbd379ba9b7431e ("gpio: of: Return error if gpio hog configuration failed")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

Yours,
Linus Walleij
