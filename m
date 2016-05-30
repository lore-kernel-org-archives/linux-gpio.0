From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] gpio: max77620: use the new open drain callback
Date: Mon, 30 May 2016 17:05:34 +0200
Message-ID: <CACRpkdaKY7YXuBkWU0PpkTZ0M0FV8g7sudOEAkzBcgZjL4qf=g@mail.gmail.com>
References: <1464095626-28424-1-git-send-email-ldewangan@nvidia.com>
	<1464095626-28424-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:36499 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754914AbcE3PFf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 30 May 2016 11:05:35 -0400
Received: by mail-oi0-f53.google.com with SMTP id j1so272148847oih.3
        for <linux-gpio@vger.kernel.org>; Mon, 30 May 2016 08:05:35 -0700 (PDT)
In-Reply-To: <1464095626-28424-3-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, May 24, 2016 at 3:13 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:

> The MAX77620 have a GPIO pins which can act as open drain or
> push pull mode. Implement support for controlling this from GPIO
> descriptor tables or other hardware descriptions such as
> device tree by implementing the .set_single_ended() callback.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>

Rebased and applied. (Because I didn't apply 2/3)

Yours,
Linus Walleij
