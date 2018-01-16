From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/4] gpio-stmpe: Delete an unnecessary variable
 initialisation in stmpe_gpio_probe()
Date: Tue, 16 Jan 2018 11:04:10 +0100
Message-ID: <CACRpkdYr8U-6bzQ7rOX_768Hdo-u1kMQJ3OFWDOR+t11zvrAjw@mail.gmail.com>
References: <df11c007-360e-ce6b-2f70-61b6fb6b49cf@users.sourceforge.net> <245fffed-3b76-5265-25b1-9f9077518894@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:44417 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750832AbeAPKEL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jan 2018 05:04:11 -0500
Received: by mail-io0-f195.google.com with SMTP id k18so16207017ioc.11
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jan 2018 02:04:11 -0800 (PST)
In-Reply-To: <245fffed-3b76-5265-25b1-9f9077518894@users.sourceforge.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Jan 12, 2018 at 9:04 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 12 Jan 2018 20:48:40 +0100
>
> The local variable "irq" will eventually be set to an appropriate value
> a bit later. Thus omit the explicit initialisation at the beginning.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied.

Yours,
Linus Walleij
