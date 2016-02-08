From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 1/5] gpio: ath79: Move to the generic GPIO driver
Date: Mon, 8 Feb 2016 11:58:14 +0900
Message-ID: <CAAVeFuJkUi5DXZmxd641pWFRUqL8HGzVKK4HZf-7-c0EvjRFVQ@mail.gmail.com>
References: <1454010273-21513-1-git-send-email-albeu@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f175.google.com ([209.85.223.175]:35088 "EHLO
	mail-io0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754694AbcBHC6e (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 7 Feb 2016 21:58:34 -0500
In-Reply-To: <1454010273-21513-1-git-send-email-albeu@free.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alban Bedel <albeu@free.fr>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Antony Pavlov <antonynpavlov@gmail.com>, Gabor Juhos <juhosg@openwrt.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Jan 29, 2016 at 4:44 AM, Alban Bedel <albeu@free.fr> wrote:
> Drop most of the code in favor of the generic MMIO GPIO driver.
> As the driver now depend on CONFIG_GPIO_GENERIC also add a Kconfig
> entry to make the driver optional.
>
> We leave the base pointer and lock in the data struct because they are
> needed for the IRQ support.
>
> Signed-off-by: Alban Bedel <albeu@free.fr>
> ---
>  drivers/gpio/Kconfig      |   9 ++++
>  drivers/gpio/Makefile     |   2 +-
>  drivers/gpio/gpio-ath79.c | 126 ++++++----------------------------------------
>  3 files changed, 24 insertions(+), 113 deletions(-)

Nice, much less code!

Acked-by: Alexandre Courbot <acourbot@nvidia.com>
