From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] gpio: zynq: Fixed broken wakeup implementation
Date: Thu, 4 Sep 2014 18:27:11 +0200
Message-ID: <CACRpkdbb0oeA0b5SSLtR6U7jv8asCeEJdHEsDAg7_tH+GHc5RQ@mail.gmail.com>
References: <1409335127-26712-1-git-send-email-soren.brinkmann@xilinx.com>
	<1409335127-26712-3-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:56584 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754449AbaIDQ1M (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Sep 2014 12:27:12 -0400
Received: by mail-oi0-f53.google.com with SMTP id x69so1771427oia.12
        for <linux-gpio@vger.kernel.org>; Thu, 04 Sep 2014 09:27:11 -0700 (PDT)
In-Reply-To: <1409335127-26712-3-git-send-email-soren.brinkmann@xilinx.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Soren Brinkmann <soren.brinkmann@xilinx.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Michal Simek <michal.simek@xilinx.com>, Harini Katakam <harinik@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Ezra Savard <ezras@xilinx.com>, Ezra Savard <ezra.savard@xilinx.com>

On Fri, Aug 29, 2014 at 7:58 PM, Soren Brinkmann
<soren.brinkmann@xilinx.com> wrote:

> From: Ezra Savard <ezra.savard@xilinx.com>
>
> Use of unmask/mask in set_wake was an incorrect implementation. The new
> implementation correctly sets wakeup for the gpio chip's IRQ so the gpio chip
> will not sleep while wakeup-enabled gpio are in use.
>
> Signed-off-by: Ezra Savard <ezra.savard@xilinx.com>
> Reviewed-by: Soren Brinkmann <soren.brinkmann@xilinx.com>

Patch applied.

However the problems seems quite generic.

Do you see this kind of error in other GPIO drivers?

IRQchip semantics always make me nervous.

Yours,
Linus Walleij
