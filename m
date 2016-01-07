From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] gpio: brcmstb: Allow building driver for BMIPS_GENERIC
Date: Thu, 7 Jan 2016 16:27:30 +0100
Message-ID: <CACRpkdbxUCq=aHkBSJ14LaKRYte=cupf=34g9APuafNpBXkobA@mail.gmail.com>
References: <1452106523-11556-1-git-send-email-f.fainelli@gmail.com>
	<1452106523-11556-4-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:33825 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752754AbcAGP1a (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Jan 2016 10:27:30 -0500
Received: by mail-ob0-f175.google.com with SMTP id wp13so193938557obc.1
        for <linux-gpio@vger.kernel.org>; Thu, 07 Jan 2016 07:27:30 -0800 (PST)
In-Reply-To: <1452106523-11556-4-git-send-email-f.fainelli@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux MIPS <linux-mips@linux-mips.org>, Gregory Fong <gregory.0xf0@gmail.com>, jaedon.shin@gmail.com, Alexandre Courbot <gnurou@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>

On Wed, Jan 6, 2016 at 7:55 PM, Florian Fainelli <f.fainelli@gmail.com> wrote:

> BMIPS_GENERIC (arch/mips/bmips) is the Kconfig symbol associated with
> Broadcom MIPS-based STB chips. Since this driver is perfectly usable on
> these platforms as well, allow using it.
>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Patch applied with Gregory's ACK.

Yours,
Linus Walleij
