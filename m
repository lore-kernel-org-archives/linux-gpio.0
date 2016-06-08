From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpiolib: Fix unaligned used of reference counters
Date: Wed, 8 Jun 2016 10:41:37 +0200
Message-ID: <CACRpkdak7ZT7fyVpfZB26m7xshJssV-8dxNWjOE22j6L2EUO0w@mail.gmail.com>
References: <1464973802-9286-1-git-send-email-ricardo.ribalda@gmail.com> <1464973802-9286-2-git-send-email-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464973802-9286-2-git-send-email-ricardo.ribalda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Roger Quadros <rogerq@ti.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Jun 3, 2016 at 7:10 PM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:

> gpiolib relies on the reference counters to clean up the gpio_device
> structure.
>
> Although the number of get/put is properly aligned on gpiolib.c
> itself, it does not take into consideration how the referece counters
> are affected by other external functions such as cdev_add and device_add.
>
> Because of this, after the last call to put_device, the reference counter
> has a value of +3, therefore never calling gpiodevice_release.
>
> Due to the fact that some of the device  has already been cleaned on
> gpiochip_remove, the library will end up OOPsing the kernel (e.g. a call
> to of_gpiochip_find_and_xlate).
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

Again, thanks for fixing my stupid mistakes.

Applied and tagged for stable.

Yours,
Linus Walleij
