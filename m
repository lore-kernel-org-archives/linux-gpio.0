From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: of: Optimize quirk checks
Date: Mon, 8 Apr 2019 13:04:27 +0200
Message-ID: <CACRpkdY2G6xJf7WbraXvH0p2Rp=FVJxnsnJBCzCpZZmPag5bNw@mail.gmail.com>
References: <20190329084229.17018-1-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190329084229.17018-1-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Mar 29, 2019 at 9:42 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Simple string comparisons are cheaper than DT lookups, as the latter
> involve taking a spinlock and traversing properties.
> Hence optimize quirk checks by postponing DT lookups after string
> comparisons.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks Geert! I merged v5.1-rc3 into my devel branch and
applied this on top.

Yours,
Linus Walleij
