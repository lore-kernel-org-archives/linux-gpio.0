From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: raspberrypi-exp: decrease refcount on firmware dt node
Date: Sun, 16 Dec 2018 01:20:50 +0100
Message-ID: <CACRpkdY_RcZXt=Rk3rdRLxnjGGuBz3ggSjAq9oVZS3CPidsXzA@mail.gmail.com>
References: <20181210165005.27965-1-nsaenzjulienne@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181210165005.27965-1-nsaenzjulienne@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, Dave Stevenson <dave.stevenson@raspberrypi.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Dec 10, 2018 at 5:50 PM Nicolas Saenz Julienne
<nsaenzjulienne@suse.de> wrote:

> We're getting a reference RPi's firmware node in order to be able to
> communicate with it's driver. We should decrease the reference count on
> the dt node after being done with it.
>
> Fixes: a98d90e7d588 ("gpio: raspberrypi-exp: Driver for RPi3 GPIO expander via mailbox service")
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

Patch applied.

Yours,
Linus Walleij
