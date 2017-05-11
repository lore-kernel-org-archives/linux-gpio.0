From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 8/9] pinctrl: Use seq_putc() in pinctrl_maps_show()
Date: Thu, 11 May 2017 15:28:56 +0200
Message-ID: <CACRpkdb4=4BAT+aPLYneVNuBeaxntWAvG9t3Hgx=k5aHB96oCA@mail.gmail.com>
References: <d8cce619-5a37-2f8b-1c07-a4c45443fb50@users.sourceforge.net> <80f6dabc-6547-4d2b-2efa-15a90de41c0c@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f182.google.com ([209.85.223.182]:34628 "EHLO
        mail-io0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755478AbdEKN26 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 May 2017 09:28:58 -0400
Received: by mail-io0-f182.google.com with SMTP id k91so21178575ioi.1
        for <linux-gpio@vger.kernel.org>; Thu, 11 May 2017 06:28:57 -0700 (PDT)
In-Reply-To: <80f6dabc-6547-4d2b-2efa-15a90de41c0c@users.sourceforge.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, May 2, 2017 at 11:28 AM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 2 May 2017 10:47:35 +0200
>
> A single character (line break) should be put into a sequence.
> Thus use the corresponding function "seq_putc".
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied.

Maybe I will coalesce it with other commits as Andy suggests.

Yours,
Linus Walleij
