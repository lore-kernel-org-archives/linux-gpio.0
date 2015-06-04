From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [RFT v2 05/48] gpio: Use irq_desc_get_xxx() to avoid redundant
 lookup of irq_desc
Date: Thu, 4 Jun 2015 08:20:12 +0200
Message-ID: <CABxcv==Gg7GOzyo5kAEC5ezQpsTMPo=Bi0H4rfRUY5iQJ4oSTQ@mail.gmail.com>
References: <1433391238-19471-1-git-send-email-jiang.liu@linux.intel.com>
	<1433391238-19471-6-git-send-email-jiang.liu@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yh0-f51.google.com ([209.85.213.51]:34393 "EHLO
	mail-yh0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751371AbbFDGUN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jun 2015 02:20:13 -0400
Received: by yhom41 with SMTP id m41so7606734yho.1
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jun 2015 23:20:13 -0700 (PDT)
In-Reply-To: <1433391238-19471-6-git-send-email-jiang.liu@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jiang Liu <jiang.liu@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Bjorn Helgaas <bhelgaas@google.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Randy Dunlap <rdunlap@infradead.org>, Yinghai Lu <yinghai@kernel.org>, Borislav Petkov <bp@alien8.de>, Ray Jui <rjui@broadcom.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@deeprootsystems.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Michal Simek <michal.simek@xilinx.com>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Tony Luck <tony.luck@intel.com>, x86@kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>, linux-pci@vger.kernel.org, linux-acpi@vger.kernel.org, bcm-

Hello Jiang,

On Thu, Jun 4, 2015 at 6:13 AM, Jiang Liu <jiang.liu@linux.intel.com> wrote:
> Use irq_desc_get_xxx() to avoid redundant lookup of irq_desc while we
> already have a pointer to corresponding irq_desc.
>
> Signed-off-by: Jiang Liu <jiang.liu@linux.intel.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-bcm-kona.c   |    2 +-
>  drivers/gpio/gpio-dwapb.c      |    2 +-
>  drivers/gpio/gpio-mvebu.c      |    2 +-
>  drivers/gpio/gpio-mxc.c        |    6 +++---
>  drivers/gpio/gpio-mxs.c        |    2 +-
>  drivers/gpio/gpio-omap.c       |    2 +-

For gpio-omap:

Acked-by: Javier Martinez Canillas <javier@dowhile0.org>

Best regards,
Javier
