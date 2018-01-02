From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl/spear/plgpio: Delete two error messages for a
 failed memory allocation in plgpio_probe()
Date: Tue, 2 Jan 2018 09:58:01 +0100
Message-ID: <CACRpkdbAJqrgghCV2tj4FdoPHweKYkze1s1UnmrvU71gqRVkAw@mail.gmail.com>
References: <66c3f488-ffdf-e55d-e511-e4af35e670b4@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:43312 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751447AbeABI6C (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jan 2018 03:58:02 -0500
Received: by mail-io0-f194.google.com with SMTP id w188so3872445iod.10
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jan 2018 00:58:02 -0800 (PST)
In-Reply-To: <66c3f488-ffdf-e55d-e511-e4af35e670b4@users.sourceforge.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, Viresh Kumar <vireshk@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Dec 27, 2017 at 10:39 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 27 Dec 2017 22:34:28 +0100
>
> Omit extra messages for a memory allocation failure in this function.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied with Viresh's ACK.

Yours,
Linus Walleij
