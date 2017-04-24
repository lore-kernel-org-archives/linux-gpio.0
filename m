From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: arizona: Correct check whether the pin is an input
Date: Mon, 24 Apr 2017 16:22:48 +0200
Message-ID: <CACRpkdbEv5xHyh30pt3cqbDmatCv9_BhKHVOOkibukmULJRbfA@mail.gmail.com>
References: <1492594244-27361-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f54.google.com ([209.85.214.54]:35918 "EHLO
        mail-it0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1172278AbdDXOWu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Apr 2017 10:22:50 -0400
Received: by mail-it0-f54.google.com with SMTP id g66so62061588ite.1
        for <linux-gpio@vger.kernel.org>; Mon, 24 Apr 2017 07:22:50 -0700 (PDT)
In-Reply-To: <1492594244-27361-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "open list:WOLFSON MICROELECTRONICS DRIVERS" <patches@opensource.wolfsonmicro.com>

On Wed, Apr 19, 2017 at 11:30 AM, Charles Keepax
<ckeepax@opensource.wolfsonmicro.com> wrote:

> The logic to check if the pin is an input or output whilst testing if we
> need to read the register value from the hardware or not is currently
> inverted. Remove the erroneous not from the if statement.
>
> Fixes: 11598d174050 ("gpio: arizona: Correct handling for reading input GPIOs")
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

Patch applied.

Yours,
Linus Walleij
