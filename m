From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v7] gpio: add Intel WhiskeyCove PMIC GPIO driver
Date: Thu, 11 Aug 2016 13:30:37 +0200
Message-ID: <CACRpkdah_05qExCpNKcJXUG9rRuw9BjkoB4uUE2j0UWG0z9_xw@mail.gmail.com>
References: <20160725215938.GC211765@worksta>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160725215938.GC211765@worksta>
Sender: linux-kernel-owner@vger.kernel.org
To: Bin Gao <bin.gao@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ajay Thomas <ajay.thomas.david.rajamanickam@intel.com>, Yegnesh S Iyer <yegnesh.s.iyer@intel.com>, Bin Gao <bin.gao@intel.com>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jul 25, 2016 at 11:59 PM, Bin Gao <bin.gao@linux.intel.com> wrote:

> This patch introduces a separate GPIO driver for Intel WhiskeyCove PMIC.
> This driver is based on gpio-crystalcove.c.
>
> Signed-off-by: Ajay Thomas <ajay.thomas.david.rajamanickam@intel.com>
> Signed-off-by: Bin Gao <bin.gao@intel.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
> Changes in v7:

This v7 patch applied.

Can you please send a separate patch adding .get_direction() to the
gpiochip? It's a feature I've been pushing more and more recently.

Yours,
Linus Walleij
