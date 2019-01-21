From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: pca953x: use a per instance irq_chip structure
Date: Mon, 21 Jan 2019 14:06:08 +0100
Message-ID: <CACRpkdYg3mUhetVO7nFOgGkpbeK+6355p-74wLWAH09JZcN8hQ@mail.gmail.com>
References: <20190116093158.2850-1-thomas.petazzoni@bootlin.com> <20190116093158.2850-2-thomas.petazzoni@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190116093158.2850-2-thomas.petazzoni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Marek Vasut <marex@denx.de>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jan 16, 2019 at 10:32 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:

> When a system has two PCA953x GPIO expanders, the kernel complains with:
>
> gpio gpiochip2: (0-0021): detected irqchip that is shared with multiple gpiochips: please fix the driver.
>
> Indeed, there is a single instance of "struct irq_chip" that gets
> re-used for both PCA953x instance. This commit moves the "struct
> irq_chip" to be part of the "struct pca953x_chip", so that we have one
> "struct irq_chip" per PCA953X instance.
>
> As part of this, the name of the irq_chip is also made different on a
> per-instance basis, now using the dev_name() of the I2C device. This
> changes what is visible in /proc/interrupts.
>
> Before:
>
>  47:          0          0   pca953x  10 Edge      e0100000.sdhci cd
>  48:          0          0   pca953x   6 Edge      e0101000.sdhci cd
>
> After:
>
>  47:          0          0    0-0020  10 Edge      e0100000.sdhci cd
>  48:          2          0    0-0020   6 Edge      e0101000.sdhci cd
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Patch applied.

Yours,
Linus Walleij
