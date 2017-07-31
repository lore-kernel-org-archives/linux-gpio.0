From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: lp87565: Set proper output level and direction
 for direction_output
Date: Mon, 31 Jul 2017 15:27:33 +0200
Message-ID: <CACRpkdbwf=7KCOW7-CiR=Q-d6hkjuW694FGTJu6PLiPgv-LWsw@mail.gmail.com>
References: <20170703082812.23444-1-axel.lin@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f173.google.com ([209.85.223.173]:37689 "EHLO
        mail-io0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750954AbdGaN1f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Jul 2017 09:27:35 -0400
Received: by mail-io0-f173.google.com with SMTP id c74so110978875iod.4
        for <linux-gpio@vger.kernel.org>; Mon, 31 Jul 2017 06:27:34 -0700 (PDT)
In-Reply-To: <20170703082812.23444-1-axel.lin@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Keerthy <j-keerthy@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Jul 3, 2017 at 10:28 AM, Axel Lin <axel.lin@ingics.com> wrote:

> The value argument of lp87565_gpio_direction_output() means output level
> rather than gpio direction.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> Reviewed-by: Keerthy <j-keerthy@ti.com>
> Tested-by: Keerthy <j-keerthy@ti.com>
> ---
> v2: Call lp87565_gpio_set() instead of open-coded.
> I move lp87565_gpio_get/lp87565_gpio_set functions up to avoid forward
> declaration. It's fine to only move lp87565_gpio_set() but it looks better
> for me to move lp87565_gpio_get/lp87565_gpio_set together.
> Hope this change is fine.

Patch applied for fixes.

Yours,
Linus Walleij
