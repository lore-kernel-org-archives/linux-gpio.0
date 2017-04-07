From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 08/38] Annotate hardware config module parameters in drivers/gpio/
Date: Fri, 7 Apr 2017 12:42:32 +0200
Message-ID: <CACRpkdaLW6egEB-w1iEfy1b0RM=yB8QoYFkatiUvEE8fvWJSiw@mail.gmail.com>
References: <149141141298.29162.5612793122429261720.stgit@warthog.procyon.org.uk>
 <149141147489.29162.566616944109123278.stgit@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f172.google.com ([209.85.223.172]:35000 "EHLO
        mail-io0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754757AbdDGKme (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Apr 2017 06:42:34 -0400
Received: by mail-io0-f172.google.com with SMTP id z13so47040933iof.2
        for <linux-gpio@vger.kernel.org>; Fri, 07 Apr 2017 03:42:34 -0700 (PDT)
In-Reply-To: <149141147489.29162.566616944109123278.stgit@warthog.procyon.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Howells <dhowells@redhat.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Greg KH <gregkh@linuxfoundation.org>, William Breathitt Gray <vilhelm.gray@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-security-module@vger.kernel.org, keyrings@vger.kernel.org

On Wed, Apr 5, 2017 at 6:57 PM, David Howells <dhowells@redhat.com> wrote:

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
> Suggested-by: Alan Cox <gnomes@lxorguk.ukuu.org.uk>
> Signed-off-by: David Howells <dhowells@redhat.com>
> Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> cc: Alexandre Courbot <gnurou@gmail.com>
> cc: linux-gpio@vger.kernel.org

Acked-by: Linus Walleij <linus.walleij@linaro.org>

I see that I don't have this symbol in my tree so I guess the patch
series adds it and this patch needs to follow it.

Yours,
Linus Walleij
