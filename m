From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: rcar: Switch to use gpiolib irqchip helpers
Date: Wed, 14 Jan 2015 14:15:23 +0100
Message-ID: <CACRpkdY8HEtm_t2h7vAAZNPZMxxhfSum9TrKTD3TnRRuTUS_7w@mail.gmail.com>
References: <1421057279-16081-1-git-send-email-geert+renesas@glider.be>
	<1421057279-16081-3-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f181.google.com ([209.85.213.181]:48321 "EHLO
	mail-ig0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752523AbbANNPX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Jan 2015 08:15:23 -0500
Received: by mail-ig0-f181.google.com with SMTP id r2so6833555igi.2
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2015 05:15:23 -0800 (PST)
In-Reply-To: <1421057279-16081-3-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Alexandre Courbot <gnurou@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Jan 12, 2015 at 11:07 AM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Switch the R-Car Gen2 GPIO driver to use the gpiolib irqchip helpers.
>
> While doing this also make sure that gpiochip_irqchip_add() is called
> after the gpiochip itself is registered, as required.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Love it. Patch applied.

Yours,
Linus Walleij
