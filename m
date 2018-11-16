From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: drop broken to_gpio_irq_chip() helper
Date: Fri, 16 Nov 2018 22:47:02 +0100
Message-ID: <CACRpkdYHjZ9z+a=3A=F5dk56uQk15vGsXRbn2Euz3Adv3fR99A@mail.gmail.com>
References: <20181112141028.10213-1-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181112141028.10213-1-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thierry Reding <treding@nvidia.com>, Grygorii Strashko <grygorii.strashko@ti.com>
List-Id: linux-gpio@vger.kernel.org

On Mon, Nov 12, 2018 at 3:11 PM Johan Hovold <johan@kernel.org> wrote:

> Drop the broken to_gpio_irq_chip() container_of() helper, which would
> break the build for anyone who tries to use it.
>
> Specifically, struct gpio_irq_chip only holds a pointer to a struct
> irq_chip so using container_of() on an irq-chip pointer makes no sense.
>
> Fixes: da80ff81a8f5 ("gpio: Move irqchip into struct gpio_irq_chip")
> Cc: Thierry Reding <treding@nvidia.com>
> Cc: Grygorii Strashko <grygorii.strashko@ti.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Patch applied, thanks!

Yours,
Linus Walleij
