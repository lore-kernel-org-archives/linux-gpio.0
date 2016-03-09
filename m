From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFT][PATCH v2 2/3] gpio: mpc8xxx: Remove *read_reg and
 *write_reg from struct mpc8xxx_gpio_chip
Date: Wed, 9 Mar 2016 10:43:44 +0700
Message-ID: <CACRpkdYXkBWau7uHp14BHQ3rmDE8xGiyzAtfnPaLktSum1xN5w@mail.gmail.com>
References: <1456125772.27297.0.camel@ingics.com>
	<1456125841.27297.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:36517 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750898AbcCIDnp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Mar 2016 22:43:45 -0500
Received: by mail-ob0-f169.google.com with SMTP id m7so34691411obh.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Mar 2016 19:43:45 -0800 (PST)
In-Reply-To: <1456125841.27297.1.camel@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Liu Gang <Gang.Liu@nxp.com>, Alexandre Courbot <gnurou@gmail.com>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Alexander Stein <alexander.stein@systec-electronic.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Feb 22, 2016 at 2:24 PM, Axel Lin <axel.lin@ingics.com> wrote:

> *read_reg and *write_reg can be removed because at all the places to call
> them, we can just use gc->read_reg/gc->write_reg instead.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Patch applied.

Yours,
Linus Walleij
