From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/4] gpio-stmpe: Use seq_putc() in stmpe_dbg_show()
Date: Tue, 16 Jan 2018 10:59:32 +0100
Message-ID: <CACRpkdZ0hN+AEbghiyk49s9Qec5Nt2JTZLJfe=oJm1w238U7jA@mail.gmail.com>
References: <df11c007-360e-ce6b-2f70-61b6fb6b49cf@users.sourceforge.net> <91234c1e-9106-ae5d-ebed-8e3d5f272c1e@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f53.google.com ([209.85.214.53]:33836 "EHLO
        mail-it0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750816AbeAPJ7d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jan 2018 04:59:33 -0500
Received: by mail-it0-f53.google.com with SMTP id m11so11019950iti.1
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jan 2018 01:59:32 -0800 (PST)
In-Reply-To: <91234c1e-9106-ae5d-ebed-8e3d5f272c1e@users.sourceforge.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Jan 12, 2018 at 9:01 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 12 Jan 2018 19:30:50 +0100
>
> A single character (line break) should be put into a sequence.
> Thus use the corresponding function "seq_putc".
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied.

Yours,
Linus Walleij
