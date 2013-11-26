From: Prabhakar Lad <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH 2/2] gpio: introduce GPIO_DAVINCI kconfig option
Date: Tue, 26 Nov 2013 15:59:12 +0530
Message-ID: <CA+V-a8vh4SE5ALOetdFBv1dEDJdZ58=aXGU3cVNjOMVFBfMeYA@mail.gmail.com>
References: <1385048076-7875-1-git-send-email-grygorii.strashko@ti.com> <1385048076-7875-3-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:64006 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752983Ab3KZK3e (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Nov 2013 05:29:34 -0500
In-Reply-To: <1385048076-7875-3-git-send-email-grygorii.strashko@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, LKML <linux-kernel@vger.kernel.org>

On Thu, Nov 21, 2013 at 9:04 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:
> The compatible to Davinci GPIO HW block is used by other TI SoCs, like
> Keystone, where GPIO support is declared as optional.
>
> Hence, introduce GPIO_DAVINCI Kconfig option which will allow to enable
> Davinci GPIO driver for Keystone SoCs when needed. At same time, kept
> Davinci GPIO driver enabled for Davinci SoCs by default.
>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Acked-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>

Regards,
--Prabhakar Lad
