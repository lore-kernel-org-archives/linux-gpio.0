From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v8 3/7] irqdomain: Factor out code to add and remove items
 to and from the revmap
Date: Fri, 18 Aug 2017 10:15:36 +0100
Message-ID: <58f842b4-0e90-c7c6-57cc-331420a4d469@arm.com>
References: <1503017616-3252-1-git-send-email-david.daney@cavium.com>
 <1503017616-3252-4-git-send-email-david.daney@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:60100 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750709AbdHRJPj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 18 Aug 2017 05:15:39 -0400
In-Reply-To: <1503017616-3252-4-git-send-email-david.daney@cavium.com>
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Daney <david.daney@cavium.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

On 18/08/17 01:53, David Daney wrote:
> The code to add and remove items to and from the revmap occurs several
> times.
> 
> In preparation for the follow on patches that add more uses of this
> code, factor this out in to separate static functions.
> 
> Signed-off-by: David Daney <david.daney@cavium.com>

Reviewed-by: Marc Zyngier <marc.zyngier@arm.com>

	M.
-- 
Jazz is not dead. It just smells funny...
