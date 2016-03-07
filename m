From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: moxart: Drop redundant code to set already
 initialized gpio_chip fields
Date: Mon, 7 Mar 2016 11:37:56 +0700
Message-ID: <CACRpkdZdgSJ5XJ6kpGrVPgucNajmDEU4fpONBnUFEDn8TDQ_fA@mail.gmail.com>
References: <1456473597.24027.0.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:35748 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751341AbcCGEh5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Mar 2016 23:37:57 -0500
Received: by mail-oi0-f47.google.com with SMTP id c203so72238320oia.2
        for <linux-gpio@vger.kernel.org>; Sun, 06 Mar 2016 20:37:57 -0800 (PST)
In-Reply-To: <1456473597.24027.0.camel@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Jonas Jensen <jonas.jensen@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Feb 26, 2016 at 2:59 PM, Axel Lin <axel.lin@ingics.com> wrote:

> These fields are initialized by bgpio_init() with exactly the same settings
> so remove the redundant code.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Patch applied.

Yours,
Linus Walleij
