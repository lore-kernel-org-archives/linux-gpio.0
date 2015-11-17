From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] pinctrl: qcom: qdf2xxx: improve error checking and reporting
Date: Tue, 17 Nov 2015 15:15:31 +0100
Message-ID: <7846916.TvyJAMuMZQ@wuerfel>
References: <1447171030-15056-1-git-send-email-timur@codeaurora.org> <CACRpkdb4Ck4XCUEKX7TEgCg8723vZA-sxqmd753O1q9uTBszfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.187]:54964 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750768AbbKQOQI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2015 09:16:08 -0500
In-Reply-To: <CACRpkdb4Ck4XCUEKX7TEgCg8723vZA-sxqmd753O1q9uTBszfQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Timur Tabi <timur@codeaurora.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Tuesday 17 November 2015 14:33:49 Linus Walleij wrote:
> On Tue, Nov 10, 2015 at 4:57 PM, Timur Tabi <timur@codeaurora.org> wr=
ote:
>=20
> > The driver doesn't report an error message if the ACPI tables are m=
issing
> > the num-gpios property (which indicates how many GPIOs there are on=
 this
> > SOC), and it didn't check to ensure that the mallocs didn't fail.
> >
> > Signed-off-by: Timur Tabi <timur@codeaurora.org>
>=20
> Waiting for Bj=F6rn's ACK on this.
>=20
> And I suspect Arnd would be interested to know if you are doing
> ACPI on something that is certainly not a server-class hardware.
> Because you shouldn't.
>=20

It's more fun just watching this really. No comment.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
