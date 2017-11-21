From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] gpio: 74x164: Fix crash during .remove()
Date: Tue, 21 Nov 2017 12:27:22 -0200
Message-ID: <CAOMZO5CCurrpWx3twLfPeGnGTuV3fP+vZAA24=JTXZUBRSBMEg@mail.gmail.com>
References: <1511273890-552-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:44919 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751251AbdKUO1X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Nov 2017 09:27:23 -0500
In-Reply-To: <1511273890-552-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

On Tue, Nov 21, 2017 at 12:18 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Commit 7ebc194d0fd4bb0f ("gpio: 74x164: Introduce 'enable-gpios'
> property") added a new member gpiod_oe to the end of the struct
> gen_74x164_chip, after the zero-length buffer array.
>
> However, this buffer is a flexible array, allocated together with the
> structure during .probe().  As the buffer is no longer the last member,
> writing to it corrupts the newly added member after it.
> During device removal, the corrupted member will be used as a pointer,
> leading to a crash.
>
> This went unnoticed, as the flexible array was declared as "buffer[0]"
> instead of "buffer[]", and thus did not trigger a "flexible array member
> not at end of struct" error from gcc.
>
> Move the gpiod_oe field up to fix this, and drop the zero from the array
> size to prevent future similar bugs.
>
> Fixes: 7ebc194d0fd4bb0f ("gpio: 74x164: Introduce 'enable-gpios' property")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks for the fix:

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
