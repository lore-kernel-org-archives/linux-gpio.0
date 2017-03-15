From: Jayachandran C <jnair@caviumnetworks.com>
Subject: Re: [PATCH] gpio: xlp: Update for ARCH_THUNDER2
Date: Wed, 15 Mar 2017 10:48:00 +0000
Message-ID: <20170315104759.GA2584@localhost>
References: <1489317268-5376-1-git-send-email-jnair@caviumnetworks.com>
 <CACRpkdZ88ObS-eqT5tVmktXWy6HdS9hor9wjJ6Ktvb6efcNYGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bl2nam02on0083.outbound.protection.outlook.com ([104.47.38.83]:13760
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753412AbdCOKsR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Mar 2017 06:48:17 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdZ88ObS-eqT5tVmktXWy6HdS9hor9wjJ6Ktvb6efcNYGQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Kamlakant.Patel@cavium.com

On Wed, Mar 15, 2017 at 11:22:58AM +0100, Linus Walleij wrote:
> On Sun, Mar 12, 2017 at 12:14 PM, Jayachandran C
> <jnair@caviumnetworks.com> wrote:
> 
> > ARCH_VULCAN arm64 platform (for Broadcom Vulcan ARM64 processors) has
> > been discontinued. Cavium's ThunderX2 CN99XX (ARCH_THUNDER2) will be
> > the next revision of this platform.
> >
> > Update compile dependencies and ACPI ID to reflect this change. There
> > is not need to retain ARCH_VULCAN since the Vulcan processor was never
> > in production.
> >
> > Signed-off-by: Jayachandran C <jnair@caviumnetworks.com>
> 
> Patch applied.
> 
> > -       depends on OF_GPIO && (CPU_XLP || ARCH_VULCAN || COMPILE_TEST)
> > +       depends on OF_GPIO && (CPU_XLP || ARCH_THUNDER2 || COMPILE_TEST)
> 
> I kept ARCH_VULCAN.
> 
> I will consider removing it when Vulcan DTS files etc get removed from
> arch/arm64/boot/dts/broadcom/*

I have a patch posted to move the dts files at:
https://www.spinics.net/lists/arm-kernel/msg568462.html
and I hope it will get merged in the next cycle. I should have added
this to the patch comments, so that you have the complete information.
 
> People may still be using preproduction boards and I do not want
> to screw things up for them.

I understand, I left the Broadcom ACPI and DT strings alone due
to similar concerns. For the Kconfig symbol, it is not much of an
issue, but I'll leave that to your preference.

Thanks,
JC.
