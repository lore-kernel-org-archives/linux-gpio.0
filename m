From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] gpio: zynq: Fix IRQ handlers
Date: Mon, 11 Aug 2014 09:03:03 +0200
Message-ID: <CACRpkdYi8oxMr-K=m6E0b+UusNUF1ekDb25HVFmT+HAiyqrMoQ@mail.gmail.com>
References: <1405677133-8706-1-git-send-email-lars@metafoo.de>
	<1405677133-8706-3-git-send-email-lars@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f47.google.com ([209.85.219.47]:53365 "EHLO
	mail-oa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752242AbaHKHDE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Aug 2014 03:03:04 -0400
Received: by mail-oa0-f47.google.com with SMTP id g18so5804237oah.20
        for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2014 00:03:03 -0700 (PDT)
In-Reply-To: <1405677133-8706-3-git-send-email-lars@metafoo.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, Michal Simek <michal.simek@xilinx.com>, Harini Katakam <harini.katakam@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Jul 18, 2014 at 11:52 AM, Lars-Peter Clausen <lars@metafoo.de> =
wrote:

> The Zynq GPIO interrupt handling code as two main issues:
(...)
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>

Patch applied with S=C3=B6ren's ACK!

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
