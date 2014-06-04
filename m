From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH 0/4] <mach/gpio.h> purge
Date: Wed, 4 Jun 2014 12:23:33 -0500
Message-ID: <CAL_JsqL9_hbn-XDCm368YEPuW2mNnYio_-pAgUNOMw-7kd7MOQ@mail.gmail.com>
References: <1401888838-3126-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1401888838-3126-1-git-send-email-linus.walleij@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jun 4, 2014 at 8:33 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> After deleting <mach/gpio.h> from the AT91 only S5P remains.
> This patch set fixes up S5P and then removes NEED_MACH_GPIO_H
> permanently removing any references to <mach/gpio.h> from the
> ARM kernel. Do a small cleanout of a dangling reference to
> ARM_GPIOLIB_COMPLEX at the same time.

Awesome.

>
> Linus Walleij (4):
>   ARM: s5p: cut the custom ARCH_NR_GPIOS definition
>   ARM: mach-s5p: get rid of all <mach/gpio.h> headers
>   ARM: kill CONFIG_NEED_MACH_GPIO_H
>   ARM: delete old reference to ARM_GPIOLIB_COMPLEX
>
>  arch/arm/Kconfig                                  |  10 --
>  arch/arm/include/asm/gpio.h                       |   7 --
>  arch/arm/mach-s5p64x0/common.c                    |   2 +-
>  arch/arm/mach-s5p64x0/dev-audio.c                 |   3 +-
>  arch/arm/mach-s5p64x0/include/mach/gpio-samsung.h | 127 +++++++++++++++++++
>  arch/arm/mach-s5p64x0/include/mach/gpio.h         | 132 --------------------

Use -M option or set git config diff.renames=true so you don't have to remember.

Rob
