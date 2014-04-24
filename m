From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: rdc321x: Fix off-by-one for ngpio setting
Date: Thu, 24 Apr 2014 15:08:03 +0200
Message-ID: <CACRpkdaL7Zv0SwekpUW_rz1A+ttPjfU6=A=BwoayyRiFGyGwcA@mail.gmail.com>
References: <1398305629.14665.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f52.google.com ([209.85.219.52]:33444 "EHLO
	mail-oa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753239AbaDXNIF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Apr 2014 09:08:05 -0400
Received: by mail-oa0-f52.google.com with SMTP id l6so2602223oag.11
        for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2014 06:08:04 -0700 (PDT)
In-Reply-To: <1398305629.14665.1.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Florian Fainelli <florian@openwrt.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>

On Thu, Apr 24, 2014 at 4:13 AM, Axel Lin <axel.lin@ingics.com> wrote:

> The valid gpio is GPIO0 ~ GPIO58, so ngpio should be 59.
> This patch also renames RDC321X_MAX_GPIO to RDC321X_NUM_GPIO because it
> actually means the number of available GPIOs.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
> Hi Lee,
> This actually fixes the ngpio setting in gpio-rdc321x driver.
> So I think it makes sense to go via gpio tree.

Nah, better to take this in MFD, and change $SUBJECT
to "mfd:".

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
