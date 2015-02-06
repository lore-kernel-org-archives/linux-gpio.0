From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH] pinctrl: imx: do not implicitly set pin regs to -1
Date: Fri, 06 Feb 2015 20:40:43 +0100
Message-ID: <93e8f8135f2c459b7694ef1a22636f7b@agner.ch>
References: <1423240256-27210-1-git-send-email-stefan@agner.ch>
 <20150206192121.GD10842@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kmu-office.ch ([178.209.48.109]:54959 "EHLO
	mail.kmu-office.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754785AbbBFTlM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Feb 2015 14:41:12 -0500
In-Reply-To: <20150206192121.GD10842@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, kernel@pengutronix.de, shawn.guo@linaro.org, linux-arm-kernel@lists.infradead.org

On 2015-02-06 20:21, Uwe Kleine-K=C3=B6nig wrote:
> Hallo Stefan,
>=20
> On Fri, Feb 06, 2015 at 05:30:56PM +0100, Stefan Agner wrote:
>> -	memset(info->pin_regs, 0xff, sizeof(*info->pin_regs) * info->npins=
);
>> +
>> +	for (i =3D 0; i < info->npins; i++) {
>> +		info->pin_regs[i].mux_reg =3D -1;
>> +		info->pin_regs[i].conf_reg =3D -1;
>> +	}
> looks definitely better. Just out of interest, did you check if it
> changes the generated code?

Just checked quickly, before it branched to memset. The object file is
24 bytes larger. I guess memset might be a bit faster due to optimized
memory access. But not worth for some error handling relevant
initialization code IMHO...

--
Stefan
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
