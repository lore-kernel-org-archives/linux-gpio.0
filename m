From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pch: Build context save/restore only for PM
Date: Thu, 2 Oct 2014 10:01:06 +0200
Message-ID: <CACRpkdYu3W9Y10UBtEKaOP+k3bzZQLD4tM9gXpLe9UAtjk7cdw@mail.gmail.com>
References: <1412234421-11065-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f172.google.com ([209.85.213.172]:50130 "EHLO
	mail-ig0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751182AbaJBIBH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Oct 2014 04:01:07 -0400
Received: by mail-ig0-f172.google.com with SMTP id r2so442072igi.11
        for <linux-gpio@vger.kernel.org>; Thu, 02 Oct 2014 01:01:06 -0700 (PDT)
In-Reply-To: <1412234421-11065-1-git-send-email-thierry.reding@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Oct 2, 2014 at 9:20 AM, Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> The pch_gpio_save_reg_conf() and pch_gpio_restore_reg_conf() functions
> are only used in pch_gpio_suspend() and pch_gpio_resume(), respectively.
> Since the latter are only built if PM is enabled, make the former build
> under the same conditions.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Patch applied.

Yours,
Linus Walleij
