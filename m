From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/2] GPIO support for Socionext Synquacer
Date: Tue, 31 Oct 2017 13:20:59 +0100
Message-ID: <CACRpkdbfM6SuXxkbfcmJ-JxK1Mt=oxy1qN3rEawoNb8gpmjM9Q@mail.gmail.com>
References: <20171027202148.4188-1-ard.biesheuvel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f179.google.com ([209.85.223.179]:56435 "EHLO
        mail-io0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751229AbdJaMVA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Oct 2017 08:21:00 -0400
Received: by mail-io0-f179.google.com with SMTP id m81so34564689ioi.13
        for <linux-gpio@vger.kernel.org>; Tue, 31 Oct 2017 05:21:00 -0700 (PDT)
In-Reply-To: <20171027202148.4188-1-ard.biesheuvel@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>

On Fri, Oct 27, 2017 at 10:21 PM, Ard Biesheuvel
<ard.biesheuvel@linaro.org> wrote:

> The Socionext Synquacer SC2A11, which is used in the arm64 Developer Box,
> shares its GPIO IP with a Fujitsu SoC for which we already have support
> in the tree. So let's tweak it so that we can reuse it.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
>
> Ard Biesheuvel (2):
>   gpio: mb86s7x: share with other SoCs as module
>   gpio: mb86s70: Revert "Return error if requesting an already assigned
>     gpio"

Nice. We might need to look into the following wrt this driver:

- Using generic MMIO GPIO, i.e. select GPIO_GENERIC in Kconfig
  and a patch such as commit 6d125412fc16802012a17665638f49b0b0c81f18
  "gpio: iop: Use generic GPIO MMIO functions for driver"
  apart from reduced code size this brings the .get_multiple() and
  .set_multiple() callbacks for FREE.
  The fact that the driver is so simple that it should have been using
  MMIO/GENERIC GPIO is a plain oversight during review.

- When submitting the DTS for that developer box, make sure that
  the 96boards header has proper GPIO line names from day 1,
  see e.g.
  commit bbaf867e2d3796bca465d07ffcd800a3bd570861
  "arm64: dts: hikey: name the GPIO lines"

Ard: if you have this machine on your desk help with the above would
be much appreciated (plus it's fun!) thanks a bunch :)

Yours,
Linus Walleij
