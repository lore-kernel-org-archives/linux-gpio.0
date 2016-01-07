From: Gregory Fong <gregory.0xf0@gmail.com>
Subject: Re: [PATCH 2/3] gpio: brcmstb: Set endian flags for big-endian MIPS
Date: Thu, 7 Jan 2016 00:08:21 -0800
Message-ID: <CADtm3G5TPUVgdkrumAx1DmkxzCNwFd1KGMR6Ku+HQmGF4SYL-w@mail.gmail.com>
References: <1452106523-11556-1-git-send-email-f.fainelli@gmail.com> <1452106523-11556-3-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f182.google.com ([209.85.213.182]:34225 "EHLO
	mail-ig0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750852AbcAGIIv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Jan 2016 03:08:51 -0500
Received: by mail-ig0-f182.google.com with SMTP id ik10so50230832igb.1
        for <linux-gpio@vger.kernel.org>; Thu, 07 Jan 2016 00:08:51 -0800 (PST)
In-Reply-To: <1452106523-11556-3-git-send-email-f.fainelli@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-gpio@vger.kernel.org, "open list:MIPS" <linux-mips@linux-mips.org>, jaedon.shin@gmail.com, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>

On Wed, Jan 6, 2016 at 10:55 AM, Florian Fainelli <f.fainelli@gmail.com> wrote:
> Broadcom MIPS-based STB chips endianness is configured by boot strap,
> which also reverses all bus endianness (i.e., big-endian CPU + big
> endian bus ==> native endian I/O).
>
> Other architectures (e.g., ARM) either do not support big endian, or
> else leave I/O in little endian mode.
>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Acked-by: Gregory Fong <gregory.0xf0@gmail.com>
