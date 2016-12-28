From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: rcar: set IRQ chip parent_device
Date: Wed, 28 Dec 2016 01:31:56 +0100
Message-ID: <CACRpkdanbF844hBqSTArUUkR+=DqyAt5TE7ee+KxNGOqKiqyrg@mail.gmail.com>
References: <20161208173228.16835-1-niklas.soderlund+renesas@ragnatech.se> <20161208173228.16835-2-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f171.google.com ([209.85.220.171]:35895 "EHLO
        mail-qk0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752298AbcL1Ab6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Dec 2016 19:31:58 -0500
Received: by mail-qk0-f171.google.com with SMTP id n21so227798450qka.3
        for <linux-gpio@vger.kernel.org>; Tue, 27 Dec 2016 16:31:57 -0800 (PST)
In-Reply-To: <20161208173228.16835-2-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

On Thu, Dec 8, 2016 at 6:32 PM, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:

> This enables Runtime PM handling for interrupts.
>
> By setting the parent_device in struct irq_chip genirq will call the
> pm_runtime_get/put APIs when an IRQ is requested/freed.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Patch applied with the ACKs.

Yours,
Linus Walleij
