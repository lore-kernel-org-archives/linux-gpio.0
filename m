From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: mcp23s08: Use seq_putc() in mcp23s08_dbg_show()
Date: Thu, 11 May 2017 16:33:21 +0200
Message-ID: <CACRpkdZaUFfWrSGdo=G1QZSPO-S1Nit5tq2P7aq_ZD1w6HpZkw@mail.gmail.com>
References: <78956b0e-7f06-487c-cd11-fea77a65e66a@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f169.google.com ([209.85.223.169]:33337 "EHLO
        mail-io0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935711AbdEKOdW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 May 2017 10:33:22 -0400
Received: by mail-io0-f169.google.com with SMTP id p24so22539236ioi.0
        for <linux-gpio@vger.kernel.org>; Thu, 11 May 2017 07:33:22 -0700 (PDT)
In-Reply-To: <78956b0e-7f06-487c-cd11-fea77a65e66a@users.sourceforge.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, May 8, 2017 at 12:50 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 8 May 2017 12:44:36 +0200
>
> A single character (line break) should be put into a sequence.
> Thus use the corresponding function "seq_putc".
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

I can't change stuff around this driver right now as it is being
rewritten.

Yours,
Linus Walleij
