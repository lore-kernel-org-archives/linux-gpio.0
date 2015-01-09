From: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: Re: [PATCH] pinctrl: pass -DDEBUG in subdirs
Date: Fri, 9 Jan 2015 18:22:36 +0800
Message-ID: <1420798956.23114.18.camel@mtksdaap41>
References: <1420796506-10402-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailgw01.mediatek.com ([210.61.82.183]:53945 "EHLO
	mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
	with ESMTP id S1756397AbbAIKWo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jan 2015 05:22:44 -0500
In-Reply-To: <1420796506-10402-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org


On Fri, 2015-01-09 at 10:41 +0100, Linus Walleij wrote:
> When drivers are compiled in subdirectories the -DDEBUG flag need
> to be passed in the individual Makefiles.

Hi,

It will be easy to forget adding this when adding new subdirectories.
Can we do this instead?

diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index af365c5..36f1d620 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -1,6 +1,6 @@
 # generic pinmux support

-ccflags-$(CONFIG_DEBUG_PINCTRL)        += -DDEBUG
+subdir-ccflags-$(CONFIG_DEBUG_PINCTRL) += -DDEBUG

Joe.C



