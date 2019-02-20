From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 1/2] drivers: provide devm_platform_ioremap_resource()
Date: Wed, 20 Feb 2019 12:05:12 +0100
Message-ID: <CAMRc=Mdd2QXYjxJGp22OqBeyB+vm1Oe+OKgcB4OgYx3NS+yMEQ@mail.gmail.com>
References: <20190215152507.31066-1-brgl@bgdev.pl> <20190215152507.31066-2-brgl@bgdev.pl>
 <CACRpkdY43ojBZ1NUyvc0X8+3tc3=jhv4S2oJX2v-88TgrKxQqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdY43ojBZ1NUyvc0X8+3tc3=jhv4S2oJX2v-88TgrKxQqg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Keerthy <j-keerthy@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

=C5=9Br., 20 lut 2019 o 10:57 Linus Walleij <linus.walleij@linaro.org> napi=
sa=C5=82(a):
>
> On Fri, Feb 15, 2019 at 4:25 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote=
:
>
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > There are currently 1200+ instances of using platform_get_resource()
> > and devm_ioremap_resource() together in the kernel tree.
> >
> > This patch wraps these two calls in a single helper. Thanks to that
> > we don't have to declare a local variable for struct resource * and can
> > omit the redundant argument for resource type. We also have one
> > function call less.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> This makes a lot of sense. I think Andy can confirm the value, he
> knows a lot about good helpers.
>
> I'd need Greg's ACK on this before merging through GPIO.
>
> Can we make a script or coccinelle thing to fix them all when this
> is applied?
>

Yes, it's on my list (and also a chance to learn first hand how to
work with coccinelle), but we first need this function upstream. I'll
resend a v2 with the EXPORT_SYMBOL fixed.

Bart
