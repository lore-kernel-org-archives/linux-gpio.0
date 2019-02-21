From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/2] drivers: provide devm_platform_ioremap_resource()
Date: Thu, 21 Feb 2019 13:06:54 +0100
Message-ID: <CACRpkdauvLkMs6HQiuuBy9ACVB+zmYY6W8FqmdUUQFrYZcHjaQ@mail.gmail.com>
References: <20190220111240.10041-1-brgl@bgdev.pl> <20190220111240.10041-2-brgl@bgdev.pl>
 <20190220111650.GA13077@kroah.com> <CAMRc=MeXPsJCsKAnzUD7Cvhj2gy3pyd6X79e602awv3_Ys6mYA@mail.gmail.com>
 <20190220121506.GA23933@kroah.com> <CAMRc=Md0sqouS+p2RvW+fwM41eN5=P9Nd7V=gYuqxunfa3j-nA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMRc=Md0sqouS+p2RvW+fwM41eN5=P9Nd7V=gYuqxunfa3j-nA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Keerthy <j-keerthy@ti.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Feb 21, 2019 at 10:53 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> > > Should this go through the driver-core tree?
> >
> > No need, put it through the tree for patch 2/2.
> >
> > thanks,
> >
> > greg k-h
>
> Linus,
>
> can you take the two patches for v5.1?

Yup both merged to the GPIO tree, thanks!

Yours,
Linus Walleij
