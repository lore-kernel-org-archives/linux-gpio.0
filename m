From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: arizona: Remove pointless set of platform drvdata
Date: Wed, 30 Nov 2016 13:50:15 +0100
Message-ID: <CACRpkdYoAMV_4rU_xy65BfRxseofm6OqZynhwqnAtsPSDugi4Q@mail.gmail.com>
References: <1480081710-27305-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f182.google.com ([209.85.220.182]:34904 "EHLO
        mail-qk0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932844AbcK3MuR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2016 07:50:17 -0500
Received: by mail-qk0-f182.google.com with SMTP id n204so207896396qke.2
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2016 04:50:16 -0800 (PST)
In-Reply-To: <1480081710-27305-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "open list:WOLFSON MICROELECTRONICS DRIVERS" <patches@opensource.wolfsonmicro.com>

On Fri, Nov 25, 2016 at 2:48 PM, Charles Keepax
<ckeepax@opensource.wolfsonmicro.com> wrote:

> We use the gpio chip private data in all the callbacks so remove this
> redundant line of code.
>
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

Patch applied.

Yours,
Linus Walleij
