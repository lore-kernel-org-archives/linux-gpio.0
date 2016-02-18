From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 4/5] gpio: ep93xx: remove private irq_to_gpio function
Date: Fri, 19 Feb 2016 00:21:51 +0100
Message-ID: <CACRpkdYrUxkOGvxi85zAn8O32otLNGtBGrvQPSqvnm1htp=+-w@mail.gmail.com>
References: <455637086-2794174-1-git-send-email-arnd@arndb.de>
	<1455637261-2920972-1-git-send-email-arnd@arndb.de>
	<1455637261-2920972-4-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:33225 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1948606AbcBRXVv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Feb 2016 18:21:51 -0500
Received: by mail-ob0-f176.google.com with SMTP id jq7so91694314obb.0
        for <linux-gpio@vger.kernel.org>; Thu, 18 Feb 2016 15:21:51 -0800 (PST)
In-Reply-To: <1455637261-2920972-4-git-send-email-arnd@arndb.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Russell King <rmk+kernel@arm.linux.org.uk>, Bjorn Helgaas <bhelgaas@google.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Ralf Baechle <ralf@linux-mips.org>, Linux MIPS <linux-mips@linux-mips.org>

On Tue, Feb 16, 2016 at 4:40 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> The ep93xx goes through its own back-and-forth dance every time
> it wants to know the gpio number for an irq line, when it really
> just hardcodes a fixed offset in ep93xx_gpio_to_irq().
>
> This removes the pointless macro and replaces the conversion inside
> of the driver with simple add/subtract operations, using an
> explicit macro.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Holding this back waiting for the dependent cleanup to come in.

Yours,
Linus Walleij
