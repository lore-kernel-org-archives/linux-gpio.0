From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: freescale: imx: fix bogus check of of_iomap()
 return value
Date: Wed, 16 Mar 2016 13:57:09 +0100
Message-ID: <CACRpkdbUgk1syexK1Z+XPUHW+Xfz8zviwiryzZj-ysRR=eRTdg@mail.gmail.com>
References: <1457484336-8928-1-git-send-email-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:33135 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751099AbcCPM5K (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Mar 2016 08:57:10 -0400
Received: by mail-ob0-f169.google.com with SMTP id fz5so49920102obc.0
        for <linux-gpio@vger.kernel.org>; Wed, 16 Mar 2016 05:57:09 -0700 (PDT)
In-Reply-To: <1457484336-8928-1-git-send-email-vz@mleia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Adrian Alonso <aalonso@freescale.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Mar 9, 2016 at 1:45 AM, Vladimir Zapolskiy <vz@mleia.com> wrote:

> On error path of_iomap() returns NULL, hence IS_ERR() check is invalid
> and may cause a NULL pointer dereference, the change fixes this
> problem.
>
> While we are here invert a device node check to simplify the code.
>
> Fixes: 26d8cde5260b ("pinctrl: freescale: imx: add shared input select reg support")
> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>

Patch applied with Shawn's ACK.

Yours,
Linus Walleij
