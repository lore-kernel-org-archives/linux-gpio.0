From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] drivers: depend on HAS_IOMEM for devm_platform_ioremap_resource()
Date: Fri, 22 Feb 2019 17:22:18 +0100
Message-ID: <CACRpkdbeyoQbVFDFq1Z3NXoWgu5F2a2pNQd9XJ4KkOws7_gUVw@mail.gmail.com>
References: <20190221162627.3476-1-brgl@bgdev.pl> <CAHp75VfKq5rkLUzW3HL8+a0wmaqGz7nz09Ki0nc0TxQDJb=9DA@mail.gmail.com>
 <CABGGiswPUe2PEmi_7a7SsB6vK7WVHysOoNkueoG+3h4RdfmB8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CABGGiswPUe2PEmi_7a7SsB6vK7WVHysOoNkueoG+3h4RdfmB8Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <rob.herring@linaro.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Keerthy <j-keerthy@ti.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-gpio@vger.kernel.org

On Fri, Feb 22, 2019 at 3:22 PM Rob Herring <rob.herring@linaro.org> wrote:

> Just a drive by comment, but IMO we should just get rid of HAS_IOMEM
> altogether. It is really just a !UML option as I think every other
> arch enables it. If folks really want to disable drivers on UML, just
> disable the subsystems.

I just got a build failure from S390 for the same thing so apparently
there is S390 Linux without IOMEM. I have no idea how that works
but whenever Arnd start talking to me about how S390 works
my head start spinning.

Yours,
Linus Walleij
