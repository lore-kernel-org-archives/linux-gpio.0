From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH] pinctrl: zynq: add static const to zynq_pctrl_groups
Date: Thu, 28 May 2015 09:09:45 -0700
Message-ID: <20150528160945.GT31081@xsjsorenbubuntu>
References: <1432817873-6106-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-by2on0094.outbound.protection.outlook.com ([207.46.100.94]:42174
	"EHLO na01-by2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753822AbbE1QKB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 28 May 2015 12:10:01 -0400
Content-Disposition: inline
In-Reply-To: <1432817873-6106-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-gpio@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Thu, 2015-05-28 at 09:57PM +0900, Masahiro Yamada wrote:
> This array is only referenced in this file and never updated.
>=20
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Acked-by: S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>

	S=C3=B6ren
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
