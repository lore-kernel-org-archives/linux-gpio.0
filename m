From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: ucb1400: Add MODULE_ALIAS
Date: Tue, 19 Nov 2013 10:51:49 +0100
Message-ID: <CACRpkdYbLGGywUJeKCmW_fcLGG2anTdbfrxp570LEoy=avocxg@mail.gmail.com>
References: <1384846280.4900.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:45833 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751480Ab3KSJvu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Nov 2013 04:51:50 -0500
Received: by mail-oa0-f53.google.com with SMTP id j17so3823955oag.12
        for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2013 01:51:49 -0800 (PST)
In-Reply-To: <1384846280.4900.1.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Marek Vasut <marex@denx.de>, Jean Delvare <jdelvare@suse.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Nov 19, 2013 at 8:31 AM, Axel Lin <axel.lin@ingics.com> wrote:

> This driver can be built as a module now.
> Add MODULE_ALIAS to support module auto-loading.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Applied for fixes with Jean's ACK, thanks!

Yours,
Linus Walleij
