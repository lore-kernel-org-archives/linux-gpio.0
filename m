From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2] pinctrl: rockchip: add support the get_direction
Date: Fri, 01 Apr 2016 02:21:07 +0200
Message-ID: <4521590.yHkfr458Oq@phil>
References: <1458028545-1202-1-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:54056 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757614AbcDAAVZ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Mar 2016 20:21:25 -0400
In-Reply-To: <1458028545-1202-1-git-send-email-wxt@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Caesar Wang <wxt@rock-chips.com>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org

Am Dienstag, 15. M=E4rz 2016, 15:55:45 schrieb Caesar Wang:
> This patch adds the get_direction to support the gpio
> interface.
>=20
> The gpio direction is not used on rockchip platform when use the gpio
> debugfs.
>=20
> Tested on kylin board. (RK3036 SoCs)
> The repro steps:
> $/sys/class/gpio/
> echo 53 > export
> $/sys/class/gpio/gpio53# cat direction
> in
> In general, the gpio53 should be out value, but the direction is the
> default value 'in',  since the get_direction didn't supported in rock=
chip
> pinctrl.
>=20
> So, we should add this patch to support it.
>=20
> Reported-by: Jeffy Chen <jeffy.chen@rock-chips.com>
> Signed-off-by: Caesar Wang <wxt@rock-chips.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
