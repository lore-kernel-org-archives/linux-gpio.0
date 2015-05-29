From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH] pinctrl: add pinctrl_register_reason() to return proper
 error code
Date: Fri, 29 May 2015 09:16:42 -0700
Message-ID: <20150529161642.GC31081@xsjsorenbubuntu>
References: <1432899016-18155-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bl2on0077.outbound.protection.outlook.com ([65.55.169.77]:22433
	"EHLO na01-bl2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752493AbbE2QQs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 29 May 2015 12:16:48 -0400
Content-Disposition: inline
In-Reply-To: <1432899016-18155-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org

On Fri, 2015-05-29 at 08:30PM +0900, Masahiro Yamada wrote:
> The pinctrl_register() just returns NULL on error, so the callers
> can not know the exact reason of the failure.
>=20
> Some of the pinctrl drivers return -EINVAL, some -ENODEV, and some
> -ENOMEM on error of pinctrl_register() , although the error code
> might be different from the actual cause of the error.
>=20
> This new function, pinctrl_register_reason(), helps the drivers get
> and return the appropriate error code.
>=20
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>

	S=C3=B6ren
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
