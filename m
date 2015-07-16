From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio:Fix build warning about void to integer cast in the
 function mmio_74xx_gpio_probe
Date: Thu, 16 Jul 2015 14:00:24 +0200
Message-ID: <CACRpkdbj61+XoTCambLEGG=PNdkunvqnmRpV1VKi5pX1ouPzGw@mail.gmail.com>
References: <1436042072-7496-1-git-send-email-xerofoify@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1436042072-7496-1-git-send-email-xerofoify@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicholas Krause <xerofoify@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sat, Jul 4, 2015 at 10:34 PM, Nicholas Krause <xerofoify@gmail.com> wrote:

> This fixes the build warning , warning: cast from pointer to integer
> of different size when building this file on a x86 allmodconfig
> configuration. In order for me to fix this build warning I changed
> the cast in the function mmio_74xx_gpio_probe from casting the
> variable data of the stucture pointer of_id to uintptr_t rather
> then unsigned when assigning to the variable flag of the structure
> pointer priv of the structure type mmio_74xx_gpio_priv.
>
>
> Signed-off-by: Nicholas Krause <xerofoify@gmail.com>

Patch applied with some tweaks to the long subject line.

Yours,
Linus Walleij
