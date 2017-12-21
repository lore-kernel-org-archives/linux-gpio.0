From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl/nomadik/abx500: Delete an error message for a
 failed memory allocation in abx500_gpio_probe()
Date: Thu, 21 Dec 2017 10:19:55 +0100
Message-ID: <CACRpkdbk5_NMRBD0DXOY1AF9tSVVqEySaendm4Q7X6UC2FUPQQ@mail.gmail.com>
References: <e5be1da7-460d-a47d-59b8-c1902907f5a4@users.sourceforge.net> <1fa81c02-0b51-16d1-b713-971f7f44eb31@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:46296 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752101AbdLUJT4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Dec 2017 04:19:56 -0500
Received: by mail-it0-f66.google.com with SMTP id t1so9896761ite.5
        for <linux-gpio@vger.kernel.org>; Thu, 21 Dec 2017 01:19:56 -0800 (PST)
In-Reply-To: <1fa81c02-0b51-16d1-b713-971f7f44eb31@users.sourceforge.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, Alessandro Rubini <rubini@unipv.it>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Dec 20, 2017 at 10:51 AM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 20 Dec 2017 10:12:56 +0100
>
> Omit an extra message for a memory allocation failure in this function.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied.

Yours,
Linus Walleij
