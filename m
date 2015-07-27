From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] gpio: etraxfs: fix set register flag
Date: Mon, 27 Jul 2015 14:59:50 +0200
Message-ID: <CACRpkdYvuqE+0f8e_u371ghb_OSOHoHYfH8o19_ecqSEzP_wXA@mail.gmail.com>
References: <1437570319-25297-1-git-send-email-rabin@rab.in>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:33433 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750803AbbG0M7u (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jul 2015 08:59:50 -0400
Received: by obdeg2 with SMTP id eg2so58674989obd.0
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jul 2015 05:59:50 -0700 (PDT)
In-Reply-To: <1437570319-25297-1-git-send-email-rabin@rab.in>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rabin Vincent <rabin@rab.in>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Jul 22, 2015 at 3:05 PM, Rabin Vincent <rabin@rab.in> wrote:

> BGPIO_F_UNREADABLE_REG_SET is incorrect, since the set register _is_
> readable.  What's really required is BGPIO_F_READ_OUTPUT_REG_SET:
> reading the set register reads the set output value.
>
> Signed-off-by: Rabin Vincent <rabin@rab.in>

Patch applied.

Yours,
Linus Walleij
