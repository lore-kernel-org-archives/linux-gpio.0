From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: zynq: Reduce level of indention in zynq_gpio_irqhandler()
Date: Fri, 29 Aug 2014 08:33:13 +0200
Message-ID: <CACRpkdZFLr5uFSe52o_SBytkMr0Zxw=bL8GxDThaxiA+y266Ow@mail.gmail.com>
References: <1408355696-9998-1-git-send-email-lars@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:49478 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751578AbaH2GdN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Aug 2014 02:33:13 -0400
Received: by mail-oi0-f48.google.com with SMTP id a141so1305066oig.35
        for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2014 23:33:13 -0700 (PDT)
In-Reply-To: <1408355696-9998-1-git-send-email-lars@metafoo.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, Michal Simek <michal.simek@xilinx.com>, Harini Katakam <harini.katakam@xilinx.com>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Aug 18, 2014 at 11:54 AM, Lars-Peter Clausen <lars@metafoo.de> wrote:

> zynq_gpio_irqhandler() uses up to 7 tabs of indention in some parts. Refactor
> things to use a helper function for the inner loop to reduce the indention to a
> sane level.
>
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>

Patch applied.

Yours,
Linus Walleij
