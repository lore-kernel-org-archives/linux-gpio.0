From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1] gpio: max77620: get gpio value based on direction
Date: Mon, 4 Jul 2016 11:40:19 +0200
Message-ID: <CACRpkdbzupZSy+X7xTvU8_BszEofF0JBqcYfKanFU2LeyA+52g@mail.gmail.com>
References: <1467024984-28138-1-git-send-email-vreddytalla@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:33382 "EHLO
	mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753079AbcGDJkU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jul 2016 05:40:20 -0400
Received: by mail-oi0-f42.google.com with SMTP id u201so187874590oie.0
        for <linux-gpio@vger.kernel.org>; Mon, 04 Jul 2016 02:40:20 -0700 (PDT)
In-Reply-To: <1467024984-28138-1-git-send-email-vreddytalla@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Venkat Reddy Talla <vreddytalla@nvidia.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>

On Mon, Jun 27, 2016 at 12:56 PM, Venkat Reddy Talla
<vreddytalla@nvidia.com> wrote:

> Gpio direction is determined by DIRx bit of GPIO
> configuration register, return max77620 gpio value
> based on direction in or out.
>
> Signed-off-by: Venkat Reddy Talla <vreddytalla@nvidia.com>

Patch applied with Alex' ACK.

Yours,
Linus Walleij
