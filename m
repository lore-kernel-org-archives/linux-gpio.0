From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: davinci: fix build warning when !CONFIG_OF
Date: Wed, 30 May 2018 09:11:36 +0200
Message-ID: <CACRpkdaKFPp72FvOC9s7fxnmOsmNQ7xZ0O8WZi_a3+81E4mL8Q@mail.gmail.com>
References: <20180529145101.20808-1-nsekhar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180529145101.20808-1-nsekhar@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>
Cc: Keerthy <j-keerthy@ti.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, May 29, 2018 at 4:51 PM, Sekhar Nori <nsekhar@ti.com> wrote:

> This nukes the following warning that is seen when building without
> OF support:
>
> drivers/gpio/gpio-davinci.c:437:25: warning: =E2=80=98keystone_gpio_get_i=
rq_chip=E2=80=99 defined but not used [-Wunused-function]
>  static struct irq_chip *keystone_gpio_get_irq_chip(unsigned int irq)
>                          ^~~~~~~~~~~~~~~~~~~~~~~~~~
> Signed-off-by: Sekhar Nori <nsekhar@ti.com>

Patch applied.

Yours,
Linus Walleij
