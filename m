From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/5] gpio: ks8695: remove irq_to_gpio function
Date: Fri, 19 Feb 2016 00:20:53 +0100
Message-ID: <CACRpkdZEvuA2H7WaFtYtzOTRoZo1t5wpHu+O2oHGudoK63F8Gg@mail.gmail.com>
References: <455637086-2794174-1-git-send-email-arnd@arndb.de>
	<1455637261-2920972-1-git-send-email-arnd@arndb.de>
	<1455637261-2920972-3-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:35963 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1947656AbcBRXUy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Feb 2016 18:20:54 -0500
Received: by mail-ob0-f175.google.com with SMTP id gc3so90253481obb.3
        for <linux-gpio@vger.kernel.org>; Thu, 18 Feb 2016 15:20:53 -0800 (PST)
In-Reply-To: <1455637261-2920972-3-git-send-email-arnd@arndb.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Russell King <rmk+kernel@arm.linux.org.uk>, Bjorn Helgaas <bhelgaas@google.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Ralf Baechle <ralf@linux-mips.org>, Linux MIPS <linux-mips@linux-mips.org>

On Tue, Feb 16, 2016 at 4:40 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> The ks8695 gpio driver has its own copy of the irq_to_gpio()
> function. This is completely unused in the mainline kernel
> after we converted all remaining users several years ago,
> so we can remove the definition as well.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied.

Yours,
Linus Walleij
