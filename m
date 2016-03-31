From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: xgene-sb: Use irq_domain_free_irqs_common
 instead of open coded
Date: Thu, 31 Mar 2016 10:22:23 +0200
Message-ID: <CACRpkdb0XErdgaAVg5z+x4EThHWoPcW4Z3jagp=Atjnhue0mpA@mail.gmail.com>
References: <1458187231.27037.1.camel@ingics.com>
	<1458187303.27037.3.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1458187303.27037.3.camel@ingics.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Y Vo <yvo@apm.com>, Alexandre Courbot <gnurou@gmail.com>, Jiang Liu <jiang.liu@linux.intel.com>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Mar 17, 2016 at 5:01 AM, Axel Lin <axel.lin@ingics.com> wrote:

> Current code calls irq_domain_alloc_irqs_parent() in .alloc,
> so it should call irq_domain_free_irqs_parent() accordingly in .free.
> Fix it by switching to use irq_domain_free_irqs_common() instead.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Patch applied with Marc's ACK.

Yours,
Linus Walleij
