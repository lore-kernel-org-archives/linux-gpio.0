From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl/nomadik/abx500: Improve a size determination
 in abx500_gpio_probe()
Date: Thu, 21 Dec 2017 10:20:54 +0100
Message-ID: <CACRpkdYepPFNq6SLUbkr+=UasPzq2mVQg_a9eKK_WNVmnF1FDA@mail.gmail.com>
References: <e5be1da7-460d-a47d-59b8-c1902907f5a4@users.sourceforge.net> <93beb4d9-99e2-e7f2-e752-2d7228a8df46@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:40697 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752330AbdLUJUz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Dec 2017 04:20:55 -0500
Received: by mail-it0-f68.google.com with SMTP id f190so10058699ita.5
        for <linux-gpio@vger.kernel.org>; Thu, 21 Dec 2017 01:20:55 -0800 (PST)
In-Reply-To: <93beb4d9-99e2-e7f2-e752-2d7228a8df46@users.sourceforge.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, Alessandro Rubini <rubini@unipv.it>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Dec 20, 2017 at 10:52 AM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 20 Dec 2017 10:22:53 +0100
>
> Replace the specification of a data structure by a pointer dereference
> as the parameter for the operator "sizeof" to make the corresponding size
> determination a bit safer according to the Linux coding style convention.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied.

Yours,
Linus Walleij
