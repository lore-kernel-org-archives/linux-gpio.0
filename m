From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] pinctrl: sirf: Fix module autoloading for OF
Date: Wed, 16 Sep 2015 09:51:24 +0200
Message-ID: <55F91F7C.3080102@osg.samsung.com>
References: <1442389425-27846-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:36397 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752286AbbIPHv3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 16 Sep 2015 03:51:29 -0400
In-Reply-To: <1442389425-27846-1-git-send-email-javier@osg.samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Fabio Estevam <fabio.estevam@freescale.com>, =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, linux-gpio@vger.kernel.org, Barry Song <baohua@kernel.org>, Wei Chen <Wei.Chen@csr.com>, linux-arm-kernel@lists.infradead.org

Hello,

On 09/16/2015 09:43 AM, Javier Martinez Canillas wrote:
> Drivers needs to export the OF id table and this be built into
> the module or udev won't have the necessary information to auto
> load the driver module when the device is registered by OF.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 

Just found out that PINCTRL_SIRF is a boolean Kconfig symbol and not
a tristate one so it can't be built as a module. Sorry for the noise.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
