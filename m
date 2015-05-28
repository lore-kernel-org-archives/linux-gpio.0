From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH] pinctrl: zynq: add static to zynq_pins
Date: Thu, 28 May 2015 09:09:27 -0700
Message-ID: <20150528160927.GS31081@xsjsorenbubuntu>
References: <1432817843-6038-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bl2on0089.outbound.protection.outlook.com ([65.55.169.89]:64627
	"EHLO na01-bl2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751556AbbE1QJt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 28 May 2015 12:09:49 -0400
Content-Disposition: inline
In-Reply-To: <1432817843-6038-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-gpio@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Thu, 2015-05-28 at 09:57PM +0900, Masahiro Yamada wrote:
> This array is only referenced in this file.
>=20
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Acked-by: S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>

I start to wonder how I missed all of these :) Thanks for cleaning it
up!

	S=C3=B6ren
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
