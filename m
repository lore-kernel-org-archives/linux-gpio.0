From: Andrew Bresticker <abrestic@chromium.org>
Subject: Re: [PATCH 104/182] pinctrl: pistachio: use gpiochip data pointer
Date: Wed, 9 Dec 2015 09:35:50 -0800
Message-ID: <CAL1qeaGvp=5T025H=GQUsgXQBZ1cKjgcCF+8CVg7QQ8wGvNibQ@mail.gmail.com>
References: <1449667929-2705-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f171.google.com ([209.85.213.171]:38049 "EHLO
	mail-ig0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752653AbbLIRfv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 12:35:51 -0500
Received: by igbxm8 with SMTP id xm8so46508055igb.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 09:35:51 -0800 (PST)
In-Reply-To: <1449667929-2705-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>

On Wed, Dec 9, 2015 at 5:32 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
>
> Cc: Andrew Bresticker <abrestic@chromium.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Andrew Bresticker <abrestic@chromium.org>
