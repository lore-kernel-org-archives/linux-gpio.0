From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: rewrite gpiochip_offset_to_desc()
Date: Wed, 4 Dec 2013 13:46:15 +0100
Message-ID: <CACRpkdayNyV3znNVs3eagNxwtVJCiYS=aS0LM0P+pR2J4Fk-Bg@mail.gmail.com>
References: <1386041471-1826-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:57791 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932173Ab3LDMqQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2013 07:46:16 -0500
Received: by mail-ob0-f169.google.com with SMTP id wm4so16193708obc.28
        for <linux-gpio@vger.kernel.org>; Wed, 04 Dec 2013 04:46:15 -0800 (PST)
In-Reply-To: <1386041471-1826-1-git-send-email-acourbot@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Dec 3, 2013 at 4:31 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:

> gpiochip_offset_to_desc() was using gpio_to_desc(), which directly
> addresses the global GPIO array we are hoping to get rid of someday.
> Reimplement it using the descriptor array of the chip itself, after
> checking the requested offset is within the valid bounds of the chip.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Patch applied.

Yours,
Linus Walleij
