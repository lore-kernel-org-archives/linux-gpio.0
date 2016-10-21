From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: ts4800: Fix module autoload
Date: Fri, 21 Oct 2016 14:55:41 +0200
Message-ID: <CACRpkdZcopStg7B8si97gLzCvE1y4_VYXFjOsbw=gt+hX6pdfQ@mail.gmail.com>
References: <1476823442-31104-1-git-send-email-javier@osg.samsung.com> <1476823442-31104-2-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1476823442-31104-2-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Oct 18, 2016 at 10:44 PM, Javier Martinez Canillas
<javier@osg.samsung.com> wrote:

> If the driver is built as a module, autoload won't work because the module
> alias information is not filled. So user-space can't match the registered
> device with the corresponding module.
>
> Export the module alias information using the MODULE_DEVICE_TABLE() macro.
>
> Before this patch:
>
> $ modinfo drivers/gpio/gpio-ts4800.ko | grep alias
> $
>
> After this patch:
>
> $ modinfo drivers/gpio/gpio-ts4800.ko | grep alias
> alias:          of:N*T*Ctechnologic,ts4800-gpioC*
> alias:          of:N*T*Ctechnologic,ts4800-gpio
>
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

Patch applied for fixes.

Yours,
Linus Walleij
