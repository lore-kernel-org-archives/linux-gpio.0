From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] gpio: split gpiod board registration into machine header
Date: Thu, 24 Jul 2014 15:01:23 -0600
Message-ID: <53D17423.2070207@wwwdotorg.org>
References: <1406225801-30295-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:33129 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934176AbaGXVB1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Jul 2014 17:01:27 -0400
In-Reply-To: <1406225801-30295-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Alexandre Courbot <gnurou@gmail.com>, Andrew Victor <linux@maxim.org.za>, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Ralf Baechle <ralf@linux-mips.org>, Thierry Reding <thierry.reding@gmail.com>

On 07/24/2014 12:16 PM, Linus Walleij wrote:
> As per example from the regulator subsystem: put all defines and
> functions related to registering board info for GPIO descriptors
> into a separate <linux/gpio/machine.h> header.

Acked-by: Stephen Warren <swarren@nvidia.com>
