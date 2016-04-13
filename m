From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] gpio/ls2080a: Add compatible "fsl, ls2080a-gpio" for
 ls2080a gpio nodes
Date: Wed, 13 Apr 2016 13:04:58 +0800
Message-ID: <20160413050458.GI28903@tiger>
References: <1458726442-1851-1-git-send-email-Gang.Liu@nxp.com>
 <1458726442-1851-4-git-send-email-Gang.Liu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:38433 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757584AbcDMFF1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 13 Apr 2016 01:05:27 -0400
Content-Disposition: inline
In-Reply-To: <1458726442-1851-4-git-send-email-Gang.Liu@nxp.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Liu Gang <Gang.Liu@nxp.com>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, khilman@linaro.org, robh+dt@kernel.org, leoyang.li@nxp.com, mingkai.hu@nxp.com, scott.wood@nxp.com

On Wed, Mar 23, 2016 at 05:47:22PM +0800, Liu Gang wrote:
> The compatible "fsl,qoriq-gpio" is used by gpio driver:
> drivers/gpio/gpio-mpc8xxx.c to implement general gpio
> functionalities.
> 
> The chip-specific compatible "fsl,ls2080a-gpio" may be
> used to fix potential gpio IP block errata or other
> chip-specific gpio issues.
> 
> Signed-off-by: Liu Gang <Gang.Liu@nxp.com>

Updated patch subject as below and then applied it.

arm64: dts: ls2080a: Add compatible "fsl,ls2080a-gpio" for ls2080a gpio nodes

Shawn
