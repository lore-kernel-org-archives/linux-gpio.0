From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 1/2] drivers: provide devm_platform_ioremap_resource()
Date: Wed, 20 Feb 2019 13:15:06 +0100
Message-ID: <20190220121506.GA23933@kroah.com>
References: <20190220111240.10041-1-brgl@bgdev.pl>
 <20190220111240.10041-2-brgl@bgdev.pl>
 <20190220111650.GA13077@kroah.com>
 <CAMRc=MeXPsJCsKAnzUD7Cvhj2gy3pyd6X79e602awv3_Ys6mYA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMRc=MeXPsJCsKAnzUD7Cvhj2gy3pyd6X79e602awv3_Ys6mYA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Keerthy <j-keerthy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

On Wed, Feb 20, 2019 at 12:21:26PM +0100, Bartosz Golaszewski wrote:
> śr., 20 lut 2019 o 12:16 Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> napisał(a):
> >
> > On Wed, Feb 20, 2019 at 12:12:39PM +0100, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > There are currently 1200+ instances of using platform_get_resource()
> > > and devm_ioremap_resource() together in the kernel tree.
> > >
> > > This patch wraps these two calls in a single helper. Thanks to that
> > > we don't have to declare a local variable for struct resource * and can
> > > omit the redundant argument for resource type. We also have one
> > > function call less.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >
> 
> Should this go through the driver-core tree?

No need, put it through the tree for patch 2/2.

thanks,

greg k-h
