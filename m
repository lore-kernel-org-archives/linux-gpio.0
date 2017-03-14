From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RFT] gpio: exar: Set proper output level in exar_direction_output
Date: Tue, 14 Mar 2017 14:56:15 +0100
Message-ID: <CACRpkdZvwrf__eX6eMq=k3HU+=ErFZ9xSkJC4R2+FUw-fBNsXw@mail.gmail.com>
References: <20170226143658.24036-1-axel.lin@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f182.google.com ([209.85.223.182]:34489 "EHLO
        mail-io0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751607AbdCNN4S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Mar 2017 09:56:18 -0400
Received: by mail-io0-f182.google.com with SMTP id b140so10733427iof.1
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2017 06:56:17 -0700 (PDT)
In-Reply-To: <20170226143658.24036-1-axel.lin@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sun, Feb 26, 2017 at 3:36 PM, Axel Lin <axel.lin@ingics.com> wrote:

> Current code does not set output level in exar_direction_output, fix it.
> Also move the direction_output/direction_input code block to avoid forward
> declaration for exar_set_value().
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
> Hi Sudip,
> I don't have this h/w, so please review and test if this patch works.
> thanks,
> Axel

Patch applied.

Yours,
Linus Walleij
