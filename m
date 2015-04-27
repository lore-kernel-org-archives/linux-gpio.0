From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 05/10] pinctrl: add imx7d support
Date: Mon, 27 Apr 2015 15:37:21 +0200
Message-ID: <CACRpkdYGUJViMBk=83hvozZnhNTqFErj70=OPNZ_UuAck5DWJg@mail.gmail.com>
References: <1429306135-24695-1-git-send-email-Frank.Li@freescale.com>
	<1429306135-24695-6-git-send-email-Frank.Li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:35698 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753012AbbD0NhW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Apr 2015 09:37:22 -0400
Received: by obcux3 with SMTP id ux3so83109045obc.2
        for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2015 06:37:22 -0700 (PDT)
In-Reply-To: <1429306135-24695-6-git-send-email-Frank.Li@freescale.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Frank.Li@freescale.com
Cc: =?UTF-8?B?5p2O5pm6?= <lznuaa@gmail.com>, Shawn Guo <shawn.guo@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Anson Huang <b20788@freescale.com>

On Fri, Apr 17, 2015 at 11:28 PM,  <Frank.Li@freescale.com> wrote:

> From: Frank Li <Frank.Li@freescale.com>
>
> Add i.MX7D pinctrl driver support
>
> Signed-off-by: Frank Li <Frank.Li@freescale.com>
> Signed-off-by: Anson Huang <b20788@freescale.com>

Can I get some indication from the Freescale maintainers as
of whether I should merge this? It looks good to me and can go
into the pinctrl tree independently as it seems to have only
Kconfig symbol dependencies.

Yours,
Linus Walleij
