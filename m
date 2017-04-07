From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3 v2] pinctrl: Add pincontrol driver for ARTPEC-6 SoC
Date: Fri, 7 Apr 2017 11:50:00 +0200
Message-ID: <CACRpkdbFGOBbyTij+5YWqqSxj=_70Ldjh6PPubnED+JO8piqgQ@mail.gmail.com>
References: <20170330113302.GF29118@axis.com> <CACRpkda_o9nU9jyHAEJxoownO-DXw72fr3yuxf2zGJkJvPbW7g@mail.gmail.com>
 <20170403124704.GW29118@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f172.google.com ([209.85.223.172]:35771 "EHLO
        mail-io0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755381AbdDGJuC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Apr 2017 05:50:02 -0400
Received: by mail-io0-f172.google.com with SMTP id z13so46395367iof.2
        for <linux-gpio@vger.kernel.org>; Fri, 07 Apr 2017 02:50:02 -0700 (PDT)
In-Reply-To: <20170403124704.GW29118@axis.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jesper Nilsson <jesper.nilsson@axis.com>
Cc: Jesper Nilsson <jespern@axis.com>, Lars Persson <larper@axis.com>, Niklas Cassel <niklass@axis.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "David S. Miller" <davem@davemloft.net>, Geert Uytterhoeven <geert+renesas@glider.be>, Mauro Carvalho Chehab <mchehab@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-arm-kernel@axis.com

On Mon, Apr 3, 2017 at 2:47 PM, Jesper Nilsson <jesper.nilsson@axis.com> wrote:

> Add pinctrl driver support for the Axis ARTPEC-6 SoC.
> There are only some pins that actually have different
> functions available, but all can control bias (pull-up/-down)
> and drive strength.
> Code originally written by Chris Paterson.
>
> Signed-off-by: Jesper Nilsson <jesper.nilsson@axis.com>
> ---
> Changes since v1:
> - Get rid of the artpec-6 pinctrl header
> - Replace the register arrays with a function that maps
>   from pin number to the register offset.
> - Cleanup duplicate information in artpec6_pin_groups array

Nice, patch applied for v4.12.

Yours,
Linus Walleij
