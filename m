From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [patch] pinctrl: nsp-gpio: forever loop in nsp_gpio_get_strength()
Date: Thu, 24 Dec 2015 10:01:22 +0100
Message-ID: <CACRpkdbr4us-nMUJEv24YASprvHrnzv-dRMpXbrq+MEPuT10Wg@mail.gmail.com>
References: <20151224072532.GC29642@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:34902 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752534AbbLXJBW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Dec 2015 04:01:22 -0500
Received: by mail-ob0-f169.google.com with SMTP id 18so182402069obc.2
        for <linux-gpio@vger.kernel.org>; Thu, 24 Dec 2015 01:01:22 -0800 (PST)
In-Reply-To: <20151224072532.GC29642@mwanda>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, kernel-janitors@vger.kernel.org

On Thu, Dec 24, 2015 at 8:25 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> There is a signedness bug here so the loop will never exit.
>
> Fixes: 8bfcbbbcabe0 ('pinctrl: nsp: add gpio-a driver support for Broadcom NSP SoC')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Merry Christmas!
Patch applied.

Yours,
Linus Walleij
