From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH] gpio: gpio-reg: fix build
Date: Sun, 24 Dec 2017 17:59:57 +0000
Message-ID: <20171224175956.GS10595@n2100.armlinux.org.uk>
References: <20171206173745.19853-1-grygorii.strashko@ti.com>
 <CAMuHMdWuHsM2TQaTsK4=XTq-Q1ea7CaNEMhWzDgt_ppqssxYpQ@mail.gmail.com>
 <20171224155619.GR10595@n2100.armlinux.org.uk>
 <CACRpkdavHjdELSxwn79YE1F5X8LygwENFF-WXzMbjJXXwDPNFg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:51780 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750735AbdLXSAP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Dec 2017 13:00:15 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdavHjdELSxwn79YE1F5X8LygwENFF-WXzMbjJXXwDPNFg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Grygorii Strashko <grygorii.strashko@ti.com>, linux-gpio@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>

On Sun, Dec 24, 2017 at 06:44:07PM +0100, Linus Walleij wrote:
> On Sun, Dec 24, 2017 at 4:56 PM, Russell King - ARM Linux
> <linux@armlinux.org.uk> wrote:
> 
> > But the main thing is, this needs to be fixed - it's been causing build
> > errors for those of us carrying patches to use it, and thereby destroying
> > the usefulness of nightly testing.
> 
> I'm sorry, it's my fault for not being swift enough. :(
> 
> I sent a combined seasonal greetings and pull request to
> Torvalds this morning.

Thanks, and Seasons Greetings to you!

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 8.8Mbps down 630kbps up
According to speedtest.net: 8.21Mbps down 510kbps up
