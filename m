From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] gpio: remove redundant owner assignments of drivers
Date: Mon, 23 May 2016 09:34:03 +0100
Message-ID: <20160523083403.GC20422@localhost.localdomain>
References: <1463968150-9334-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:36259 "EHLO
	mx0a-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753157AbcEWId4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Mon, 23 May 2016 04:33:56 -0400
Content-Disposition: inline
In-Reply-To: <1463968150-9334-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-gpio@vger.kernel.org, patches@opensource.wolfsonmicro.com, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org

On Mon, May 23, 2016 at 10:49:10AM +0900, Masahiro Yamada wrote:
> A platform_driver need not set an owner since it will be populated
> by platform_driver_register().
> Likewise for mcb_driver (gpio-menz127.c).
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

For the Wolfson bits:

Acked-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

Thanks,
Charles
