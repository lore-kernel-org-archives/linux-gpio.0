From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl/amd: Set the level based on ACPI tables
Date: Wed, 28 Dec 2016 13:32:14 +0100
Message-ID: <CACRpkdbD_OgxcS50TQk+KpAX_qrsy9GKiDrgmDsk7JyR=yxreQ@mail.gmail.com>
References: <61a2d2f5-2d84-af87-deda-adba064b1dba@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f171.google.com ([209.85.216.171]:34351 "EHLO
        mail-qt0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751395AbcL1McQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Dec 2016 07:32:16 -0500
Received: by mail-qt0-f171.google.com with SMTP id d45so126595007qta.1
        for <linux-gpio@vger.kernel.org>; Wed, 28 Dec 2016 04:32:15 -0800 (PST)
In-Reply-To: <61a2d2f5-2d84-af87-deda-adba064b1dba@amd.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Shyam Sundar S K <ssundark@amd.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "Agrawal, Nitesh-kumar" <Nitesh-kumar.Agrawal@amd.com>, "Sen, Pankaj" <Pankaj.Sen@amd.com>, "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>

On Thu, Dec 8, 2016 at 1:01 PM, Shyam Sundar S K <ssundark@amd.com> wrote:

> In the function amd_gpio_irq_set_type, read the values from
> the ACPI table to set the level and drop the settings passed
> by the client.
>
> Reviewed-by: Pankaj Sen <Pankaj.Sen@amd.com>
> Reviewed-by: Nitesh Kumar Agrawal <Nitesh-kumar.Agrawal@amd.com>
> Reviewed-by: Shah, Nehal-bakulchandra <Nehal-bakulchandra.Shah@amd.com>
> Signed-off-by: Shyam-sundar S-k <Shyam-sundar.S-k@amd.com>

Patch applied. The code makes a lot more sense now, too.

> -       /*
> -        * When level_trig is set EDGE and active_level is set HIGH in BIOS
> -        * default settings, ignore incoming settings from client and use
> -        * BIOS settings to configure GPIO register.
> +       /* Ignore the settings coming from the client and
> +        * read the values from the ACPI tables
> +        * while setting the trigger type

In my book you do the exact opposite: the client/consumer is the device
making use of this IRQ, and that defines what trigger to set.

Before this, you let the hardware power-on defaults define the trigger, which
was probably not such a good idea.

But it's just a comment so I don't care much.

Yours,
Linus Walleij
