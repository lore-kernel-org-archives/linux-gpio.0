From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] added device tree support to gpio-generic driver
Date: Wed, 10 Jun 2015 10:42:42 +0200
Message-ID: <CACRpkdbWhtkMgz2qTg1y7AguLQCJXnAoi7gVnFvPb1sR7eES_g@mail.gmail.com>
References: <1433487062-10647-1-git-send-email-romain.baeriswyl@alitech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:33320 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753997AbbFJImn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jun 2015 04:42:43 -0400
Received: by oiha141 with SMTP id a141so27747479oih.0
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2015 01:42:42 -0700 (PDT)
In-Reply-To: <1433487062-10647-1-git-send-email-romain.baeriswyl@alitech.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Romain Baeriswyl <romain.baeriswyl@alitech.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Christian Ruppert <christian.ruppert@alitech.com>, Anton Vorontsov <cbouatmailru@gmail.com>, Rojhalat Ibrahim <imr@rtschenk.de>, abdoulaye berthe <berthe.ab@gmail.com>, Anthony Fee <anthony.fee@emutex.com>, Alexander Shiyan <shc_work@mail.ru>

This patch needs to go to the devicetree list too, see To: on this
mail.

On Fri, Jun 5, 2015 at 8:51 AM, Romain Baeriswyl
<romain.baeriswyl@alitech.com> wrote:

> +Required properties:
> +- compatible : "basic-mmio-gpio" for little endian register access or
> +               "basic-mmio-gpio-be" for big endian register access

Basic I don't know.

"single-register-gpio" is more to the point, don't you think?

> +- ngpios: Specifies the number of gpio mapped in the register. The value is
> +          limited to the number of bits of the LONG type.

So if it is 8 for a 32 bit register, does it mean bits 0..7 little endian or
big endian, or does it depend on endianness? Clarify this
in the binding.

> +
> +Optional properties:
> +- base: Allows to forces the gpio number base offset used to index the gpio in
> +        the device. If it is not see then the driver search autonoumously for
> +        valid index range.
> +
> +Examples:
> +
> +       gpio_a {
> +               compatible = "basic-mmio-gpio";
> +               ngpios = <32>;
> +       };

Yours,
Linus Walleij
