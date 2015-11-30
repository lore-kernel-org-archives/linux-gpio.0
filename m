From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] gpio: 74xx: fix a possible NULL dereference
Date: Mon, 30 Nov 2015 13:08:16 +0100
Message-ID: <CACRpkdZGrx3U8hB8QV3zpdR-8Sx4pphjDsmXfBpXbt66F-03sg@mail.gmail.com>
References: <1447273657-1668-1-git-send-email-clabbe.montjoie@gmail.com>
	<CAMuHMdVpVbEDgLcey2BhBpkKjfOLa9PaR6khx4bD_ryr1zrNrg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:34878 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752822AbbK3MIR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2015 07:08:17 -0500
Received: by obbnk6 with SMTP id nk6so124653447obb.2
        for <linux-gpio@vger.kernel.org>; Mon, 30 Nov 2015 04:08:17 -0800 (PST)
In-Reply-To: <CAMuHMdVpVbEDgLcey2BhBpkKjfOLa9PaR6khx4bD_ryr1zrNrg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: LABBE Corentin <clabbe.montjoie@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Nov 20, 2015 at 10:22 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Wed, Nov 11, 2015 at 9:27 PM, LABBE Corentin
> <clabbe.montjoie@gmail.com> wrote:
>> of_match_device could return NULL, and so cause a NULL pointer
>> dereference later at line 132:
>> priv->flags = (uintptr_t) of_id->data;
>>
>> Reported-by: coverity (CID 1324141)
>
> This is a DT-only driver, hence this cannot happen?

Yeah I said the same in comment to some other patch in the
series. But it doesn't hurt much either. Coccinelle has no clue
about deeper semantics, just shallow semantics.

Yours,
Linus Walleij
