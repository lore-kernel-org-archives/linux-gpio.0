From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] pinctrl: Flag strict is a field in struct
 pinmux_ops
Date: Tue, 21 Jun 2016 23:30:39 +0300
Message-ID: <1466541039.30123.224.camel@linux.intel.com>
References: <1466462448-98833-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:51116 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751926AbcFUUal (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 21 Jun 2016 16:30:41 -0400
In-Reply-To: <1466462448-98833-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On Tue, 2016-06-21 at 01:40 +0300, Andy Shevchenko wrote:
> Documentation incorrectly refers to struct pinctrl_desc, where no suc=
h
> flag is
> available. Replace the name of the struct.
>=20

+ Fixes: commit 8c4c2016345f ("pinctrl: move strict option to
pinmux_ops")
=C2=A0 =C2=A0=C2=A0
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> =C2=A0Documentation/pinctrl.txt | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/pinctrl.txt b/Documentation/pinctrl.txt
> index 4976389e..dd15a69 100644
> --- a/Documentation/pinctrl.txt
> +++ b/Documentation/pinctrl.txt
> @@ -831,7 +831,7 @@ separate memory range only intended for GPIO
> driving, and the register
> =C2=A0range dealing with pin config and pin multiplexing get placed i=
nto a
> =C2=A0different memory range and a separate section of the data sheet=
=2E
> =C2=A0
> -A flag "strict" in struct pinctrl_desc is available to check and den=
y
> +A flag "strict" in struct pinmux_ops is available to check and deny
> =C2=A0simultaneous access to the same pin from GPIO and pin multiplex=
ing
> =C2=A0consumers on hardware of this type. The pinctrl driver should s=
et
> this flag
> =C2=A0accordingly.

--=20

Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
