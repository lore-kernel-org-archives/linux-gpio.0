From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: xgene: fix type of variable containing error codes
Date: Thu, 25 Feb 2016 11:00:29 +0100
Message-ID: <CACRpkdYxnmOkkWksWE+-eGa-J3hNNqU=GHC7xA4mhEyyye4Htg@mail.gmail.com>
References: <1456209934-13439-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:33626 "EHLO
	mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759164AbcBYKA3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Feb 2016 05:00:29 -0500
Received: by mail-oi0-f50.google.com with SMTP id j125so36868151oih.0
        for <linux-gpio@vger.kernel.org>; Thu, 25 Feb 2016 02:00:29 -0800 (PST)
In-Reply-To: <1456209934-13439-1-git-send-email-a.hajda@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, open list <linux-kernel@vger.kernel.org>

On Tue, Feb 23, 2016 at 7:45 AM, Andrzej Hajda <a.hajda@samsung.com> wrote:

> ret variable can contain error values and is compared with zero.
> Its type must be signed.
>
> The problem has been detected using coccinelle script
> scripts/coccinelle/tests/unsigned_lesser_than_zero.cocci
>
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>

Patch applied as obviously correct.

Yours,
Linus Walleij
