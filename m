From: Gregory Fong <gregory.0xf0@gmail.com>
Subject: Re: [PATCH 3/3] gpio: brcmstb: Allow building driver for BMIPS_GENERIC
Date: Thu, 7 Jan 2016 00:12:39 -0800
Message-ID: <CADtm3G4QLBmuawKz+Ri+e-hHEzi74yqMRbhKix55Yfmfh4YNYg@mail.gmail.com>
References: <1452106523-11556-1-git-send-email-f.fainelli@gmail.com> <1452106523-11556-4-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f178.google.com ([209.85.223.178]:35531 "EHLO
	mail-io0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751193AbcAGINJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Jan 2016 03:13:09 -0500
Received: by mail-io0-f178.google.com with SMTP id 77so213677571ioc.2
        for <linux-gpio@vger.kernel.org>; Thu, 07 Jan 2016 00:13:09 -0800 (PST)
In-Reply-To: <1452106523-11556-4-git-send-email-f.fainelli@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-gpio@vger.kernel.org, "open list:MIPS" <linux-mips@linux-mips.org>, jaedon.shin@gmail.com, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>

On Wed, Jan 6, 2016 at 10:55 AM, Florian Fainelli <f.fainelli@gmail.com> wrote:
> BMIPS_GENERIC (arch/mips/bmips) is the Kconfig symbol associated with
> Broadcom MIPS-based STB chips. Since this driver is perfectly usable on
> these platforms as well, allow using it.
>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Acked-by: Gregory Fong <gregory.0xf0@gmail.com>

I never did get to test this out myself on big-endian bmips.  Glad it
worked after the bus endianness fix in patch 2/3.
