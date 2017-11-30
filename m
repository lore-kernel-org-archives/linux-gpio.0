From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: sunxi: Fix A64 UART mux value
Date: Thu, 30 Nov 2017 16:49:42 +0100
Message-ID: <CACRpkdZHdPuWa5sR72cpb6cjRmrYRt6VzA3YQ2jbc-+1DbdAdQ@mail.gmail.com>
References: <20171125121230.23555-1-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:42983 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751976AbdK3Ptn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Nov 2017 10:49:43 -0500
Received: by mail-io0-f196.google.com with SMTP id u42so7967248ioi.9
        for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2017 07:49:43 -0800 (PST)
In-Reply-To: <20171125121230.23555-1-andre.przywara@arm.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andre Przywara <andre.przywara@arm.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, linux-sunxi <linux-sunxi@googlegroups.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-gpio@vger.kernel.org

On Sat, Nov 25, 2017 at 1:12 PM, Andre Przywara <andre.przywara@arm.com> wrote:

> To use pin PF4 as the RX signal of UART0, we have to write 0b011 into
> the respective pin controller register.
> Fix the wrong value we had in our table so far.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Patch applied with Chen-Yu's ACK and fixes tag.

Yours,
Linus Walleij
