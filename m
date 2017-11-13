From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: tegra186: Remove tegra186_gpio_lock_class
Date: Mon, 13 Nov 2017 11:43:54 +0100
Message-ID: <CACRpkdYoWQUSRrQ=vsguv+M=L-Ava-jQ9vsux9G6_+m5-kFGfA@mail.gmail.com>
References: <20171110061055.12431-1-axel.lin@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:54527 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752092AbdKMKnz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Nov 2017 05:43:55 -0500
Received: by mail-io0-f196.google.com with SMTP id w127so2723703iow.11
        for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2017 02:43:54 -0800 (PST)
In-Reply-To: <20171110061055.12431-1-axel.lin@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org

On Fri, Nov 10, 2017 at 7:10 AM, Axel Lin <axel.lin@ingics.com> wrote:

> This is no longer required after commit 959bc7b22bd2
> ("gpio: Automatically add lockdep keys")
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Patch applied with Thierry's ACK.

Yours,
Linus Walleij
