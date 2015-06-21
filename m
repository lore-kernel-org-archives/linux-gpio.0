From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 1/2] gpio: altera: use of_mm_gpiochip_remove() to fix
 memory leak
Date: Sun, 21 Jun 2015 16:22:42 +0900
Message-ID: <CAAVeFu+5WFCTsgwxeWK4zqfHzaHXVuCD59kD-XfTiKMtSWwryA@mail.gmail.com>
References: <1434542383-21314-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:35095 "EHLO
	mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751394AbbFUHXC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jun 2015 03:23:02 -0400
In-Reply-To: <1434542383-21314-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tien Hock Loh <thloh@altera.com>

On Wed, Jun 17, 2015 at 8:59 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> This driver calls of_mm_gpiochip_add() to add a memory mapped gpio
> chip.  So, of_mm_gpiochip_remove() should be used when removing it.
>
> The direct call of gpiochip_remove() misses unmapping the register
> and freeing the label.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
