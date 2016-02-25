From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pisosr: Use devm_gpiod_get_optional for gpio->load_gpio
Date: Thu, 25 Feb 2016 14:17:34 +0100
Message-ID: <CACRpkdbW+k=yM0gFQfmvcAstm9mECne+G7=OxbHYngd6P9tN4Q@mail.gmail.com>
References: <1456143411.23008.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:36813 "EHLO
	mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760651AbcBYNRf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Feb 2016 08:17:35 -0500
Received: by mail-oi0-f42.google.com with SMTP id w5so39010032oie.3
        for <linux-gpio@vger.kernel.org>; Thu, 25 Feb 2016 05:17:34 -0800 (PST)
In-Reply-To: <1456143411.23008.1.camel@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: "Andrew F. Davis" <afd@ti.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Feb 22, 2016 at 1:16 PM, Axel Lin <axel.lin@ingics.com> wrote:

> gpio->load_gpio is optional, so use devm_gpiod_get_optional instead.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Patch applied with Andrew's ACK.

Yours,
Linus Walleij
