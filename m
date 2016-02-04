From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH] pinctrl: zynq: fix typo in group name for qspi1
Date: Thu, 4 Feb 2016 09:19:44 -0800
Message-ID: <20160204171944.GX4215@xsjsorenbubuntu>
References: <1454573648-21751-1-git-send-email-helmut.buchsbaum@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bl2nam02on0045.outbound.protection.outlook.com ([104.47.38.45]:41376
	"EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1756836AbcBDRvn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 4 Feb 2016 12:51:43 -0500
Content-Disposition: inline
In-Reply-To: <1454573648-21751-1-git-send-email-helmut.buchsbaum@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Helmut Buchsbaum <helmut.buchsbaum@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On Thu, 2016-02-04 at 09:14:08 +0100, Helmut Buchsbaum wrote:
> Due to a typo Zynq pin controller does not set pin function of qspi1
> when using function qspi1. So pin group for qspi1 has to be renamed t=
o
> "qspi1_0_grp" as outlined in the corresponding bindings documentation=
=2E
>=20
> This also removes kernel message:
>   zynq-pinctrl 700.pinctrl: invalid group "qspi1_0_grp" for function =
"qspi1"
>=20
> Signed-off-by: Helmut Buchsbaum <helmut.buchsbaum@gmail.com>
Acked-by: S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>

	S=C3=B6ren
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
