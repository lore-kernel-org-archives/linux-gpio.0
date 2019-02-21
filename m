From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 1/2] drivers: provide devm_platform_ioremap_resource()
Date: Thu, 21 Feb 2019 10:53:29 +0100
Message-ID: <CAMRc=Md0sqouS+p2RvW+fwM41eN5=P9Nd7V=gYuqxunfa3j-nA@mail.gmail.com>
References: <20190220111240.10041-1-brgl@bgdev.pl> <20190220111240.10041-2-brgl@bgdev.pl>
 <20190220111650.GA13077@kroah.com> <CAMRc=MeXPsJCsKAnzUD7Cvhj2gy3pyd6X79e602awv3_Ys6mYA@mail.gmail.com>
 <20190220121506.GA23933@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190220121506.GA23933@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Keerthy <j-keerthy@ti.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-gpio@vger.kernel.org

=C5=9Br., 20 lut 2019 o 13:15 Greg Kroah-Hartman
<gregkh@linuxfoundation.org> napisa=C5=82(a):
>
> On Wed, Feb 20, 2019 at 12:21:26PM +0100, Bartosz Golaszewski wrote:
> > =C5=9Br., 20 lut 2019 o 12:16 Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> napisa=C5=82(a):
> > >
> > > On Wed, Feb 20, 2019 at 12:12:39PM +0100, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > >
> > > > There are currently 1200+ instances of using platform_get_resource(=
)
> > > > and devm_ioremap_resource() together in the kernel tree.
> > > >
> > > > This patch wraps these two calls in a single helper. Thanks to that
> > > > we don't have to declare a local variable for struct resource * and=
 can
> > > > omit the redundant argument for resource type. We also have one
> > > > function call less.
> > > >
> > > > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > >
> >
> > Should this go through the driver-core tree?
>
> No need, put it through the tree for patch 2/2.
>
> thanks,
>
> greg k-h

Linus,

can you take the two patches for v5.1?

Bart
