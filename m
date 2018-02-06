From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio-wm831x: Use seq_putc() in wm831x_gpio_dbg_show()
Date: Tue, 6 Feb 2018 14:29:51 +0100
Message-ID: <CACRpkdbMRzD11F9b5QHCHeRp7aBqXNCr6dpPjKg9fSFdc5rOVQ@mail.gmail.com>
References: <85344479-907c-adf7-6ae6-6d6acff2c1b1@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f176.google.com ([209.85.223.176]:42968 "EHLO
        mail-io0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751084AbeBFN3x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Feb 2018 08:29:53 -0500
Received: by mail-io0-f176.google.com with SMTP id 25so2474014ioj.9
        for <linux-gpio@vger.kernel.org>; Tue, 06 Feb 2018 05:29:53 -0800 (PST)
In-Reply-To: <85344479-907c-adf7-6ae6-6d6acff2c1b1@users.sourceforge.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, patches@opensource.cirrus.com, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Jan 12, 2018 at 9:37 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 12 Jan 2018 21:30:09 +0100
>
> A single character (line break) should be put into a sequence.
> Thus use the corresponding function "seq_putc".
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied with Charles' ACK.

Yours,
Linus Walleij
