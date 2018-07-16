From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpiolib: don't allow userspace to set values of input lines
Date: Mon, 16 Jul 2018 15:40:44 +0200
Message-ID: <CACRpkdaWGwhJ1D683R+7TV0JsUg-pNYZ2xm_0+16O2NgnBo+4g@mail.gmail.com>
References: <20180716083424.11157-1-brgl@bgdev.pl> <20180716083424.11157-2-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180716083424.11157-2-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jul 16, 2018 at 10:34 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> User space can currently both read and set values of input lines using
> the character device. This was not allowed by the old sysfs interface
> nor is it a correct behavior.
>
> Check the first descriptor in the set for the OUT flag when asked to
> set values and return -EPERM if the line is input.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

Patch applied! Thanks for fixing this.

>         } else if (cmd == GPIOHANDLE_SET_LINE_VALUES_IOCTL) {
> -               /* TODO: check if descriptors are really output */

I wonder what kind of lazy coder leaves this kind of garbage
behind for others to fix up...

d7c51b47ac11e (Linus Walleij           2016-04-26 10:35:29 +0200  451)
 } else if (cmd == GPIOHANDLE_SET_LINE_VALUES_IOCTL) {
d7c51b47ac11e (Linus Walleij           2016-04-26 10:35:29 +0200  452)
         /* TODO: check if descriptors are really output */
d7c51b47ac11e (Linus Walleij           2016-04-26 10:35:29 +0200  453)
         if (copy_from_user(&ghd, ip, sizeof(ghd)))

Oh that guy.

Yours,
Linus Walleij
