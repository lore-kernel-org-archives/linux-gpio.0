From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: 74x164: Allocate buffer with gen_74x164_chip
Date: Thu, 10 Dec 2015 17:14:38 +0100
Message-ID: <CACRpkdZxaau5pq_XZvvABRR7+C4LGPJ58VWSOKiRugu8cuJU5w@mail.gmail.com>
References: <1448894126-9309-1-git-send-email-geert+renesas@glider.be>
	<1448894126-9309-2-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:33356 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750966AbbLJQOi (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 11:14:38 -0500
Received: by obbsd4 with SMTP id sd4so12663050obb.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 08:14:38 -0800 (PST)
In-Reply-To: <1448894126-9309-2-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Alexandre Courbot <gnurou@gmail.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Nov 30, 2015 at 3:35 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> By moving the internal buffer to the end of struct gen_74x164_chip and
> converting it from a pointer to a zero-sized array, it can be allocated
> together with gen_74x164_chip, reducing the number of managed
> allocations.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

Yours,
Linus Walleij
