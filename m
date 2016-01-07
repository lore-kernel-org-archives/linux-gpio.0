From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] gpio: brcmstb: Set endian flags for big-endian MIPS
Date: Thu, 7 Jan 2016 16:26:10 +0100
Message-ID: <CACRpkdavAtSqcdp3_C5WFgSnAwzkCx-5G_BkbC05T0-GxnJxBw@mail.gmail.com>
References: <1452106523-11556-1-git-send-email-f.fainelli@gmail.com>
	<1452106523-11556-3-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:32945 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750722AbcAGP0K (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Jan 2016 10:26:10 -0500
Received: by mail-oi0-f46.google.com with SMTP id y66so315724658oig.0
        for <linux-gpio@vger.kernel.org>; Thu, 07 Jan 2016 07:26:10 -0800 (PST)
In-Reply-To: <1452106523-11556-3-git-send-email-f.fainelli@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux MIPS <linux-mips@linux-mips.org>, Gregory Fong <gregory.0xf0@gmail.com>, jaedon.shin@gmail.com, Alexandre Courbot <gnurou@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>

On Wed, Jan 6, 2016 at 7:55 PM, Florian Fainelli <f.fainelli@gmail.com> wrote:

> Broadcom MIPS-based STB chips endianness is configured by boot strap,
> which also reverses all bus endianness (i.e., big-endian CPU + big
> endian bus ==> native endian I/O).
>
> Other architectures (e.g., ARM) either do not support big endian, or
> else leave I/O in little endian mode.
>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Patch applied with Gregory's ACK.

Yours,
Linus Walleij
