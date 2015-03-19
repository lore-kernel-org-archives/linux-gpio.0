From: Hongzhou Yang <hongzhou.yang@mediatek.com>
Subject: Re: [PATCH 35/35 linux-next] pinctrl: constify of_device_id array
Date: Wed, 18 Mar 2015 18:58:09 -0700
Message-ID: <1426730289.21744.7.camel@mussux00.eus.mediatek.inc>
References: <1426533469-25458-1-git-send-email-fabf@skynet.be>
	 <1426535949-26107-1-git-send-email-fabf@skynet.be>
	 <1426535949-26107-4-git-send-email-fabf@skynet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailgw02.mediatek.com ([69.46.227.142]:36172 "EHLO
	mailgw02.mediatek.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751069AbbCSCDh (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Mar 2015 22:03:37 -0400
In-Reply-To: <1426535949-26107-4-git-send-email-fabf@skynet.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Fabian Frederick <fabf@skynet.be>
Cc: linux-kernel@vger.kernel.org, kernel@stlinux.com, Stephen Warren <swarren@wwwdotorg.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, Patrice Chotard <patrice.chotard@st.com>, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, linux-arm-kernel@lists.infradead.org, Maxime Coquelin <maxime.coquelin@st.com>, Axel Lin <axel.lin@ingics.com>, yingjoe.chen@mediatek.com

On Mon, 2015-03-16 at 20:59 +0100, Fabian Frederick wrote:
> of_device_id is always used as const.
> (See driver.of_match_table and open firmware functions)
> 
> Signed-off-by: Fabian Frederick <fabf@skynet.be>
> ---
>  drivers/pinctrl/bcm/pinctrl-bcm2835.c       | 2 +-
>  drivers/pinctrl/mediatek/pinctrl-mt8135.c   | 2 +-
>  drivers/pinctrl/mediatek/pinctrl-mt8173.c   | 2 +-
>  

For the pinctrl-mt81xx driver,
Acked-by: Hongzhou Yang <hongzhou.yang@mediatek.com>

By the way, Axel has sent same patch to linux-gpio.
http://article.gmane.org/gmane.linux.kernel.gpio/6815

Thanks.
Hongzhou

