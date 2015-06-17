From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: rockchip: generalize perpin driver-strength setting
Date: Wed, 17 Jun 2015 10:20:32 +0200
Message-ID: <CACRpkda7U++34xSi-ePb4g7tZLde80YSaooY6WHcM=n097ZiGg@mail.gmail.com>
References: <2322857.kblfsanYOB@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:34878 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752881AbbFQIUc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Jun 2015 04:20:32 -0400
Received: by obbgp2 with SMTP id gp2so28224165obb.2
        for <linux-gpio@vger.kernel.org>; Wed, 17 Jun 2015 01:20:32 -0700 (PDT)
In-Reply-To: <2322857.kblfsanYOB@diego>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>

On Fri, Jun 12, 2015 at 11:50 PM, Heiko St=C3=BCbner <heiko@sntech.de> =
wrote:

> The upcoming support for the RK3368 ARM64 SoC also supports perpin
> drive strength settings (at different register positions), so general=
ize
> the register and offset calculation to easily support this one too.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Patch applied.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
