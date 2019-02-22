From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] drivers: depend on HAS_IOMEM for devm_platform_ioremap_resource()
Date: Fri, 22 Feb 2019 12:24:56 +0200
Message-ID: <CAHp75Vdpjqqbmz6z8NfMqk5-463-BQdvE3QdD64jVReGp9s48g@mail.gmail.com>
References: <20190221162627.3476-1-brgl@bgdev.pl> <CAHp75VfKq5rkLUzW3HL8+a0wmaqGz7nz09Ki0nc0TxQDJb=9DA@mail.gmail.com>
 <CAHp75Vdz=qQCie1PrcoTmF-TL+swWKLEzHQE=D5ubnmufxRD9g@mail.gmail.com> <CAMRc=Me0A6FHKUjuhsk9U-tHo7dLK4U0-NXk+M4129tLn3KV_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMRc=Me0A6FHKUjuhsk9U-tHo7dLK4U0-NXk+M4129tLn3KV_w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Keerthy <j-keerthy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

On Fri, Feb 22, 2019 at 11:04 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> czw., 21 lut 2019 o 20:56 Andy Shevchenko <andy.shevchenko@gmail.com>
> napisa=C5=82(a):
> >
> > On Thu, Feb 21, 2019 at 9:55 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > >
> > > On Thu, Feb 21, 2019 at 6:27 PM Bartosz Golaszewski <brgl@bgdev.pl> w=
rote:
> > > >
> > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > >
> > > > We only build devm_ioremap_resource() if HAS_IOMEM is selected, so =
this
> > > > dependency must cascade down to devm_platform_ioremap_resource().
> > >
> > > > +#ifdef CONFIG_HAS_IOMEM
> > > >  void __iomem *devm_platform_ioremap_resource(struct platform_devic=
e *pdev,
> > > >                                              unsigned int index)
> > > >  {
> > > > @@ -96,6 +97,7 @@ void __iomem *devm_platform_ioremap_resource(stru=
ct platform_device *pdev,
> > > >         return devm_ioremap_resource(&pdev->dev, res);
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(devm_platform_ioremap_resource);
> > > > +#endif /* CONFIG_HAS_IOMEM */
> > >
> > > What about declaration in *.h?
> > >
> > > Perhaps you may just do this inside the function?
> >
> > #ifdef ...
> > #else
> > return ERR_PTR(-ENOTSUPP);
> > #endif
> >
>
> I followed the example of devm_ioremap_resource() which doesn't do
> this - it just expects never to be used by systems without IOMEM.

Okay, that's fine!


--=20
With Best Regards,
Andy Shevchenko
