From: Ian Molton <ian.molton@codethink.co.uk>
Subject: Re: [PATCH] gpio: em: drop references to "virtual" IRQ
Date: Mon, 14 Oct 2013 10:59:32 +0100
Message-ID: <525BC084.2080009@codethink.co.uk>
References: <1381512207-6651-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from ducie-dc1.codethink.co.uk ([37.128.190.40]:45253 "EHLO
	ducie-dc1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754600Ab3JNJ7g (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Oct 2013 05:59:36 -0400
In-Reply-To: <1381512207-6651-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Magnus Damm <damm@opensource.se>

On 11/10/13 18:23, Linus Walleij wrote:
> Rename the argument "virq" to just "irq", this IRQ isn't any
> more "virtual" than any other Linux IRQ number, we use "hwirq"
> for the actual hw-numbers, "virq" is just bogus.
>
> Cc: Ian Molton <ian.molton@codethink.co.uk>
> Cc: Magnus Damm <damm@opensource.se>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Ian Molton <ian.molton@codethink.co.uk>

