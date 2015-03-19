From: Fabian Frederick <fabf@skynet.be>
Subject: Re: [PATCH 35/35 linux-next] pinctrl: constify of_device_id array
Date: Thu, 19 Mar 2015 19:41:15 +0100 (CET)
Message-ID: <1144194766.100372.1426790475037.open-xchange@webmail.nmp.proximus.be>
References: <1426533469-25458-1-git-send-email-fabf@skynet.be> <1426535949-26107-1-git-send-email-fabf@skynet.be> <1426535949-26107-4-git-send-email-fabf@skynet.be> <1426730289.21744.7.camel@mussux00.eus.mediatek.inc>
Reply-To: Fabian Frederick <fabf@skynet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailsec110.isp.belgacom.be ([195.238.20.106]:16809 "EHLO
	mailsec110.isp.belgacom.be" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751332AbbCSSlQ convert rfc822-to-8bit
	(ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 19 Mar 2015 14:41:16 -0400
In-Reply-To: <1426730289.21744.7.camel@mussux00.eus.mediatek.inc>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Hongzhou Yang <hongzhou.yang@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, Maxime Coquelin <maxime.coquelin@st.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-gpio@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Axel Lin <axel.lin@ingics.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, yingjoe.chen@mediatek.com, kernel@stlinux.com, Maxime Ripard <maxime.ripard@free-electrons.com>, Stephen Warren <swarren@wwwdotorg.org>, Patrice Chotard <patrice.chotard@st.com>, linux-rpi-kernel@lists.infradead.org



> On 19 March 2015 at 02:58 Hongzhou Yang <hongzhou.yang@mediatek.com> =
wrote:
>
>
> On Mon, 2015-03-16 at 20:59 +0100, Fabian Frederick wrote:
> > of_device_id is always used as const.
> > (See driver.of_match_table and open firmware functions)
> >
> > Signed-off-by: Fabian Frederick <fabf@skynet.be>
> > ---
> >=C2=A0 drivers/pinctrl/bcm/pinctrl-bcm2835.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 2 +-
> >=C2=A0 drivers/pinctrl/mediatek/pinctrl-mt8135.c=C2=A0 =C2=A0| 2 +-
> >=C2=A0 drivers/pinctrl/mediatek/pinctrl-mt8173.c=C2=A0 =C2=A0| 2 +-
> >=C2=A0
>
> For the pinctrl-mt81xx driver,
> Acked-by: Hongzhou Yang <hongzhou.yang@mediatek.com>
>
> By the way, Axel has sent same patch to linux-gpio.
> http://article.gmane.org/gmane.linux.kernel.gpio/6815
>
> Thanks.
> Hongzhou
>
Axel's version is better (it also improves display) but doesn't
include bcm. I'll resend if necessary.

Regards,
=46abian
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
