From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v8 4/7] irqdomain: Check for NULL function pointer in
 irq_domain_free_irqs_hierarchy()
Date: Fri, 18 Aug 2017 10:16:10 +0100
Message-ID: <db5a37de-8b73-23b0-571d-eca807c55724@arm.com>
References: <1503017616-3252-1-git-send-email-david.daney@cavium.com>
 <1503017616-3252-5-git-send-email-david.daney@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1503017616-3252-5-git-send-email-david.daney@cavium.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: David Daney <david.daney@cavium.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 18/08/17 01:53, David Daney wrote:
> A follow-on patch will call irq_domain_free_irqs_hierarchy() when the
> free() function pointer may be NULL.
> 
> Add a NULL pointer check to handle this new use case.
> 
> Signed-off-by: David Daney <david.daney@cavium.com>

Reviewed-by: Marc Zyngier <marc.zyngier@arm.com>

	M.
-- 
Jazz is not dead. It just smells funny...
