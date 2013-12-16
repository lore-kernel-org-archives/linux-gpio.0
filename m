From: Marc Gauthier <marc@cadence.com>
Subject: RE: [Linux-Xtensa] [PATCH v3] gpio: driver for Xtensa GPIO32
Date: Sun, 15 Dec 2013 22:11:06 -0800
Message-ID: <8CA974F497CA064FA9926E10ABCC061F047C83D8C3@MAILSJ4.global.cadence.com>
References: <36330381d07aed97fa587a6600ddee5f0be16da5.1386839921.git.baruch@tkos.co.il>
 <20131212181558.GA12555@psi-dev26.jf.intel.com>
 <20131212182442.GN1217@tarshish>
 <20131212192300.GB14726@psi-dev26.jf.intel.com>
 <20131216055032.GB3807@tarshish>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]:36067 "EHLO
	mx0b-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750923Ab3LPHF0 convert rfc822-to-8bit
	(ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 16 Dec 2013 02:05:26 -0500
In-Reply-To: <20131216055032.GB3807@tarshish>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Baruch Siach <baruch@tkos.co.il>, David Cohen <david.a.cohen@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>

Baruch Siach wrote:
[...]
> We could depend on, say HAVE_XTENSA_GPIO32, and select it
> from arch/xtensa/Kconfig for the appropriate xtensa variants.
> The problem is that no current mainline xtensa variant
> supports GPIO32. So, at some future point one of those who are 
> looking for unreferenced Kconfig symbols will just remove the 
> whole driver.


The Diamond 233L core has GPIO32.
The GPIO32 option is not mentioned in the variant core.h, however.

-Marc