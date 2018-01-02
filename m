From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: mcp23s08: fix irq setup order
Date: Tue, 2 Jan 2018 10:10:07 +0100
Message-ID: <CACRpkdZp0kp6vTAOj11Tc2mGD4MvWwpMGTQgEhQiQAdUgapcGw@mail.gmail.com>
References: <1514474364-32169-1-git-send-email-mastichi@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:41732 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750743AbeABJKI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jan 2018 04:10:08 -0500
Received: by mail-it0-f65.google.com with SMTP id x28so38151684ita.0
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jan 2018 01:10:07 -0800 (PST)
In-Reply-To: <1514474364-32169-1-git-send-email-mastichi@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dmitry Mastykin <mastichi@gmail.com>, Sebastian Reichel <sre@kernel.org>
Cc: Phil Reid <preid@electromag.com.au>, linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Dec 28, 2017 at 4:19 PM, Dmitry Mastykin <mastichi@gmail.com> wrote:

> When using mcp23s08 module with gpio-keys, often (50% of boots)
> it fails to get irq numbers with message:
> "gpio-keys keys: Unable to get irq number for GPIO 0, error -6".
> Seems that irqs must be setup before devm_gpiochip_add_data().
>
> Signed-off-by: Dmitry Mastykin <mastichi@gmail.com>

Patch applied, albeit for devel.

Should it be tagged for stable or go into fixes?

Yours,
Linus Walleij
