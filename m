From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2] gpio/ls1043a: Add compatible "fsl, qoriq-gpio" for
 ls1043a gpio nodes
Date: Wed, 13 Apr 2016 13:03:28 +0800
Message-ID: <20160413050328.GH28903@tiger>
References: <1458726442-1851-1-git-send-email-Gang.Liu@nxp.com>
 <1458726442-1851-3-git-send-email-Gang.Liu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:38385 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757615AbcDMFEC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 13 Apr 2016 01:04:02 -0400
Content-Disposition: inline
In-Reply-To: <1458726442-1851-3-git-send-email-Gang.Liu@nxp.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Liu Gang <Gang.Liu@nxp.com>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, khilman@linaro.org, robh+dt@kernel.org, leoyang.li@nxp.com, mingkai.hu@nxp.com, scott.wood@nxp.com

On Wed, Mar 23, 2016 at 05:47:21PM +0800, Liu Gang wrote:
> The compatible "fsl,qoriq-gpio" is used by gpio driver:
> drivers/gpio/gpio-mpc8xxx.c to implement general gpio
> functionalities.
> 
> The chip-specific compatible "fsl,ls1043a-gpio" may be
> used to fix potential gpio IP block errata or other
> chip-specific gpio issues.
> 
> Signed-off-by: Liu Gang <Gang.Liu@nxp.com>

Changed subject prefix to 'arm64: dts: ls1043a: ...', dropped the space
after 'fsl,', adn then applied the patch.

Yes, arm and arm64 use different prefix style, uppercase vs lowercase.

Shawn
