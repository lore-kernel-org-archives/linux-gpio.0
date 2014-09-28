From: Shawn Guo <shawn.guo@freescale.com>
Subject: Re: [PATCH 0/9] ARM: vf610: Suspend/resume support
Date: Sun, 28 Sep 2014 11:15:10 +0800
Message-ID: <20140928031508.GB12999@dragon>
References: <cover.1411404079.git.stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bn1bon0130.outbound.protection.outlook.com ([157.56.111.130]:10272
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753371AbaI1DPv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sat, 27 Sep 2014 23:15:51 -0400
Content-Disposition: inline
In-Reply-To: <cover.1411404079.git.stefan@agner.ch>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: kernel@pengutronix.de, linus.walleij@linaro.org, gnurou@gmail.com, linux@arm.linux.org.uk, jingchang.lu@freescale.com, b20788@freescale.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org

On Mon, Sep 22, 2014 at 07:09:21PM +0200, Stefan Agner wrote:
> This patchset provides suspend/resume support for Freescale Vybrid
> SoC (vf610). The code is generally aligned to the implementation
> for i.MX6. The subsystems SRC and GPC need some changes to support
> the Vybrid specific implementation.
> 
> This patchset relies on GPIO driver to be present (in order to
> provide a wakeup source) as well as using the ARM Global Timer
> clock source (the Vybrid specifc PIT clock source, vf_pit_timer.c
> does not support shutdown).
> 
> The implemented sleep states (LP-RUN and STOP), are not the most
> power saving functions available on Vybrid. Especially for
> suspend-to-memory one of the LPSTOP modes looks more appropriate.
> However, the complexity is somewhat higher (we would need to move
> execution path to SRAM and store IOMUX and DDRMC configuration).
> Currently, I have not the resources to look into that so I hope
> that this initial code qualifies as power saving functions to be
> applied.

So you have quite a lot of unnecessary code which is only needed by
suspend from SRAM (store IOMUX and DDRMC configuration).

Not happy with that.

Shawn
