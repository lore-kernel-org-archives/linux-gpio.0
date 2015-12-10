From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: at91-pio4: fix memleak after using dt map
Date: Thu, 10 Dec 2015 18:26:43 +0100
Message-ID: <CACRpkda7S+TgoZU0ApuVvYtOty-vaBLzPLeEkbDgw+jPs1_RVQ@mail.gmail.com>
References: <1448979542-1202-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:33068 "EHLO
	mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753576AbbLJR0o (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 12:26:44 -0500
Received: by oixx65 with SMTP id x65so50274918oix.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 09:26:43 -0800 (PST)
In-Reply-To: <1448979542-1202-1-git-send-email-ludovic.desroches@atmel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ludovic Desroches <ludovic.desroches@atmel.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>

On Tue, Dec 1, 2015 at 3:19 PM, Ludovic Desroches
<ludovic.desroches@atmel.com> wrote:

> configs is allocated by pinconf_generic_parse_dt_config(),
> pinctrl_utils_add_map_configs() duplicates configs so it can and has to
> be freed to prevent memory leaks.
>
> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> Reported-by: Yingjoe Chen <yingjoe.chen@mediatek.com>

Patch applied.

Yours,
Linus Walleij
