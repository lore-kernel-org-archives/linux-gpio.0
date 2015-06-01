From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC v1 05/25] gpio: Use irq_desc_get_xxx() to avoid redundant
 lookup of irq_desc
Date: Mon, 1 Jun 2015 14:45:59 +0200
Message-ID: <CACRpkdZfWK5H+gRD6inX31Ouq1XCvq7CneNDJV8x0iihXHzWjw@mail.gmail.com>
References: <1432116013-25902-1-git-send-email-jiang.liu@linux.intel.com>
	<1432116013-25902-6-git-send-email-jiang.liu@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:35683 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752444AbbFAMqA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Jun 2015 08:46:00 -0400
Received: by obcnx10 with SMTP id nx10so96703474obc.2
        for <linux-gpio@vger.kernel.org>; Mon, 01 Jun 2015 05:45:59 -0700 (PDT)
In-Reply-To: <1432116013-25902-6-git-send-email-jiang.liu@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jiang Liu <jiang.liu@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Bjorn Helgaas <bhelgaas@google.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Randy Dunlap <rdunlap@infradead.org>, Yinghai Lu <yinghai@kernel.org>, Borislav Petkov <bp@alien8.de>, Ray Jui <rjui@broadcom.com>, Alexandre Courbot <gnurou@gmail.com>, Javier Martinez Canillas <javier@dowhile0.org>, Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@deeprootsystems.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Michal Simek <michal.simek@xilinx.com>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Tony Luck <tony.luck@intel.com>, x86@kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.o>

On Wed, May 20, 2015 at 11:59 AM, Jiang Liu <jiang.liu@linux.intel.com> wrote:

> Use irq_desc_get_xxx() to avoid redundant lookup of irq_desc while we
> already have a pointer to corresponding irq_desc.
>
> Signed-off-by: Jiang Liu <jiang.liu@linux.intel.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Are there dependencies on this patch or can I just apply it
directly to the GPIO tree?

Yours,
Linus Walleij
