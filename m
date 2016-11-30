From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: arizona: Tidy up probe error path
Date: Wed, 30 Nov 2016 13:50:58 +0100
Message-ID: <CACRpkdYCFJXs7Of4v7OjGjUWzMmegVowPqd4nQQEhSS=m1wCdg@mail.gmail.com>
References: <1480081710-27305-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1480081710-27305-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f174.google.com ([209.85.216.174]:32924 "EHLO
        mail-qt0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932844AbcK3Mu7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2016 07:50:59 -0500
Received: by mail-qt0-f174.google.com with SMTP id p16so185996585qta.0
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2016 04:50:59 -0800 (PST)
In-Reply-To: <1480081710-27305-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "open list:WOLFSON MICROELECTRONICS DRIVERS" <patches@opensource.wolfsonmicro.com>

On Fri, Nov 25, 2016 at 2:48 PM, Charles Keepax
<ckeepax@opensource.wolfsonmicro.com> wrote:

> There is some unnecessary complexity in the error path which now things
> are converted to devm is actually very simple. This patch simplifies
> things.
>
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

Patch applied.

Yours,
Linus Walleij
