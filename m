From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/4] gpio-stmpe: Move an assignment in stmpe_gpio_probe()
Date: Tue, 16 Jan 2018 11:03:04 +0100
Message-ID: <CACRpkdYEKtnxun+ev-oscbDW4+Gjj=0pFdeW=1LznYZaH9vyPw@mail.gmail.com>
References: <df11c007-360e-ce6b-2f70-61b6fb6b49cf@users.sourceforge.net> <25ddf208-1f02-8bb7-b6b8-e0ffa422b754@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:40415 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751117AbeAPKDF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jan 2018 05:03:05 -0500
Received: by mail-io0-f195.google.com with SMTP id t22so4006679ioa.7
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jan 2018 02:03:05 -0800 (PST)
In-Reply-To: <25ddf208-1f02-8bb7-b6b8-e0ffa422b754@users.sourceforge.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Jan 12, 2018 at 9:03 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 12 Jan 2018 20:44:15 +0100
>
> Move the assignment for the local variable "irq" so that its setting
> will only be performed directly before it is checked by this function.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied.

Yours,
Linus Walleij
