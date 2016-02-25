From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: rcar: Use ARCH_RENESAS
Date: Thu, 25 Feb 2016 10:54:55 +0100
Message-ID: <CACRpkdamSJi51e=-p7OxFG9UZ2b5Cw_TtdbJzO22=BsSRyJCow@mail.gmail.com>
References: <1456191411-5569-1-git-send-email-horms+renesas@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:32986 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932853AbcBYJy4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Feb 2016 04:54:56 -0500
Received: by mail-oi0-f43.google.com with SMTP id j125so36790651oih.0
        for <linux-gpio@vger.kernel.org>; Thu, 25 Feb 2016 01:54:56 -0800 (PST)
In-Reply-To: <1456191411-5569-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Alexandre Courbot <gnurou@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-renesas-soc@vger.kernel.org

On Tue, Feb 23, 2016 at 2:36 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:

> Make use of ARCH_RENESAS in place of ARCH_SHMOBILE.
>
> This is part of an ongoing process to migrate from ARCH_SHMOBILE to
> ARCH_RENESAS the motivation for which being that RENESAS seems to be a more
> appropriate name than SHMOBILE for the majority of Renesas ARM based SoCs.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

OK sounds like a good cause, patch applied.

Yours,
Linus Walleij
