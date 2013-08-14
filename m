From: David Daney <ddaney@caviumnetworks.com>
Subject: Re: [PATCH v2 0/2] OCTEON GPIO support.
Date: Wed, 14 Aug 2013 12:16:42 -0700
Message-ID: <520BD79A.50307@caviumnetworks.com>
References: <1375133350-18828-1-git-send-email-ddaney.cavm@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bl2lp0205.outbound.protection.outlook.com ([207.46.163.205]:21265
	"EHLO na01-bl2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1758446Ab3HNTRG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 14 Aug 2013 15:17:06 -0400
In-Reply-To: <1375133350-18828-1-git-send-email-ddaney.cavm@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: ralf@linux-mips.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>

Ping.

Hi Linus,

I wonder if you have had a chance to look at these...

David Daney


On 07/29/2013 02:29 PM, David Daney wrote:
> From: David Daney <david.daney@cavium.com>
>
> The Cavium, OCTEON is a MIPS based SoC.  Here we add support for its
> on-chip GPIO lines.
>
> Changes from v1: Cleaned up variable names, messages and added some
> comments as suggested by Linus Walleij.
>
> The second patch depends on the first, but is in code maintained by
> Ralf.  It may be best to mrege both of these together, perhaps from
> the GPIO tree, with Ralf's Acked-by.
>
> David Daney (2):
>    MIPS: OCTEON: Select ARCH_REQUIRE_GPIOLIB
>    gpio MIPS/OCTEON: Add a driver for OCTEON's on-chip GPIO pins.
>
>   arch/mips/Kconfig                               |   1 +
>   arch/mips/include/asm/mach-cavium-octeon/gpio.h |  21 ++++
>   drivers/gpio/Kconfig                            |   8 ++
>   drivers/gpio/Makefile                           |   1 +
>   drivers/gpio/gpio-octeon.c                      | 157 ++++++++++++++++++++++++
>   5 files changed, 188 insertions(+)
>   create mode 100644 arch/mips/include/asm/mach-cavium-octeon/gpio.h
>   create mode 100644 drivers/gpio/gpio-octeon.c
>

