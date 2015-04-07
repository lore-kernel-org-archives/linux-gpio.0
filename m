From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: Re: [PATCH] gpio: dwapb: enable for ARC
Date: Tue, 7 Apr 2015 13:55:19 +0000
Message-ID: <1428414919.2665.2.camel@synopsys.com>
References: <1427790607-24842-1-git-send-email-abrodkin@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-7"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from us01smtprelay-2.synopsys.com ([198.182.47.9]:47223 "EHLO
	smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754542AbbDGN44 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Apr 2015 09:56:56 -0400
In-Reply-To: <1427790607-24842-1-git-send-email-abrodkin@synopsys.com>
Content-Language: en-US
Content-ID: <F70AFFBBC9008F45A2531E9F1680C1E5@internal.synopsys.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, Vineet Gupta <Vineet.Gupta1@synopsys.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,

On Tue, 2015-03-31 at 11:30 +-0300, Alexey Brodkin wrote:
+AD4- From: Vineet Gupta +ADw-vgupta+AEA-synopsys.com+AD4-
+AD4- 
+AD4- Synopsys SDP platform uses DW GPIO controller in design with
+AD4- ARC cores. So adding ARC to architectures that may select this
+AD4- GPIO controller.
+AD4- 
+AD4- Even though support for Synopsys SDP is yet to be submitted we'll need
+AD4- this tiny option enabled at least for properly working interrupts (DW
+AD4- GPIO controller is used as interrupt controller).
+AD4- 
+AD4- Signed-off-by: Vineet Gupta +ADw-vgupta+AEA-synopsys.com+AD4-
+AD4- Signed-off-by: Alexey Brodkin +ADw-abrodkin+AEA-synopsys.com+AD4-
+AD4- Cc: Andy Shevchenko +ADw-andriy.shevchenko+AEA-linux.intel.com+AD4-
+AD4- Cc: Linus Walleij +ADw-linus.walleij+AEA-linaro.org+AD4-
+AD4- ---
+AD4-  drivers/gpio/Kconfig +AHw- 2 +--
+AD4-  1 file changed, 1 insertion(+-), 1 deletion(-)
+AD4- 
+AD4- diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
+AD4- index 4b3284b..83d2d0b 100644
+AD4- --- a/drivers/gpio/Kconfig
+AD4- +-+-+- b/drivers/gpio/Kconfig
+AD4- +AEAAQA- -148,7 +-148,7 +AEAAQA- config GPIO+AF8-GENERIC+AF8-PLATFORM
+AD4-  
+AD4-  config GPIO+AF8-DWAPB
+AD4-  	tristate +ACI-Synopsys DesignWare APB GPIO driver+ACI-
+AD4- -	depends on ((ARM +AHwAfA- ARM64) +ACYAJg- OF+AF8-GPIO) +AHwAfA- X86+AF8-INTEL+AF8-QUARK
+AD4- +-	depends on ((ARC +AHwAfA- ARM +AHwAfA- ARM64) +ACYAJg- OF+AF8-GPIO) +AHwAfA- X86+AF8-INTEL+AF8-QUARK
+AD4-  	select GPIO+AF8-GENERIC
+AD4-  	select GENERIC+AF8-IRQ+AF8-CHIP
+AD4-  	help

I'm wondering if there's a chance for this patch to be reviewed and/or
applied?

-Alexey
