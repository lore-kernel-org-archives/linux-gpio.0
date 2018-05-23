From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: dwapb: Rework support for 1 interrupt per port A GPIO
Date: Wed, 23 May 2018 11:30:52 +0200
Message-ID: <CACRpkdY9di8hzPzVvaQjDaAd2ERqYKDwxAUspCKakkmxjD93fA@mail.gmail.com>
References: <1527065564-9127-1-git-send-email-phil.edworthy@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1527065564-9127-1-git-send-email-phil.edworthy@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Hoan Tran <hotran@apm.com>, Lee Jones <lee.jones@linaro.org>, Michel Pollet <michel.pollet@bp.renesas.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, May 23, 2018 at 10:52 AM, Phil Edworthy
<phil.edworthy@renesas.com> wrote:

> Treat DT and ACPI the same as much as possible. Note that we can't use
> platform_get_irq() to get the DT interrupts as they are in the port
> sub-node and hence do not have an associated platform device.
>
> This also fixes a problem introduced with error checking when calling
> platform_get_irq().
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>

OK this patch applied!

Yours,
Linus Walleij
