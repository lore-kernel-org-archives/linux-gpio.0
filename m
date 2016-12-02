From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 08/39] Annotate hardware config module parameters in drivers/gpio/
Date: Fri, 2 Dec 2016 13:55:16 +0100
Message-ID: <CACRpkdZR=4w93OwL3KTZev+3ukPM1d9J+J=qkCxRKpBqcAqy9w@mail.gmail.com>
References: <148059537897.31612.9461043954611464597.stgit@warthog.procyon.org.uk>
 <148059543997.31612.610019846448617763.stgit@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <148059543997.31612.610019846448617763.stgit@warthog.procyon.org.uk>
Sender: owner-linux-security-module@vger.kernel.org
To: David Howells <dhowells@redhat.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, minyard@acm.org, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, William Breathitt Gray <vilhelm.gray@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-security-module@vger.kernel.org, keyrings@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Thu, Dec 1, 2016 at 1:30 PM, David Howells <dhowells@redhat.com> wrote:

> When the kernel is running in secure boot mode, we lock down the kernel to
> prevent userspace from modifying the running kernel image.  Whilst this
> includes prohibiting access to things like /dev/mem, it must also prevent
> access by means of configuring driver modules in such a way as to cause a
> device to access or modify the kernel image.
>
> To this end, annotate module_param* statements that refer to hardware
> configuration and indicate for future reference what type of parameter they
> specify.  The parameter parser in the core sees this information and can
> skip such parameters with an error message if the kernel is locked down.
> The module initialisation then runs as normal, but just sees whatever the
> default values for those parameters is.
>
> Note that we do still need to do the module initialisation because some
> drivers have viable defaults set in case parameters aren't specified and
> some drivers support automatic configuration (e.g. PNP or PCI) in addition
> to manually coded parameters.
>
> This patch annotates drivers in drivers/gpio/.
>
> Suggested-by: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: William Breathitt Gray <vilhelm.gray@gmail.com>
> cc: Linus Walleij <linus.walleij@linaro.org>
> cc: Alexandre Courbot <gnurou@gmail.com>
> cc: linux-gpio@vger.kernel.org

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
