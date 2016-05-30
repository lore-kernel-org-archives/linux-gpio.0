From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] gpio: max77620: Configure interrupt trigger level
Date: Mon, 30 May 2016 17:01:40 +0200
Message-ID: <CACRpkdY1J_YVS94pZgK+6szvjQBWPVOAuty_H5hn1By+ZcYPoA@mail.gmail.com>
References: <1464095626-28424-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:36808 "EHLO
	mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933505AbcE3PBl (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 30 May 2016 11:01:41 -0400
Received: by mail-oi0-f49.google.com with SMTP id j1so272001638oih.3
        for <linux-gpio@vger.kernel.org>; Mon, 30 May 2016 08:01:41 -0700 (PDT)
In-Reply-To: <1464095626-28424-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, May 24, 2016 at 3:13 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:

> The GPIO sub modules of MAX77620 offers to configure the GPIO
> interrupt trigger level as RISING and FALLING edge.
>
> Pass this information to regmap-irg when registering for GPIO
> interrupts.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>

Patch applied.

Yours,
Linus Walleij
