From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/8] STMPE fixes/rework and add STMPE1600 support
Date: Wed, 20 Apr 2016 16:25:11 +0200
Message-ID: <CACRpkdbsMqhXMa7Ug1k61bwXkH2Mfu-F+7bGORM9ivhbzfcxvg@mail.gmail.com>
References: <1461068317-28016-1-git-send-email-patrice.chotard@st.com>
	<5716545D.9080006@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:32858 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753104AbcDTOZM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Apr 2016 10:25:12 -0400
Received: by mail-oi0-f54.google.com with SMTP id r78so41878637oie.0
        for <linux-gpio@vger.kernel.org>; Wed, 20 Apr 2016 07:25:11 -0700 (PDT)
In-Reply-To: <5716545D.9080006@wwwdotorg.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Patrice CHOTARD <patrice.chotard@st.com>, Lee Jones <lee.jones@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Maxime Coquelin <maxime.coquelin@st.com>, amelie.delaunay@st.com, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Dinh Nguyen <dinguyen@opensource.altera.com>, Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, Thierry Reding <thierry.reding@gmail.com>

On Tue, Apr 19, 2016 at 5:53 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> On 04/19/2016 06:18 AM, patrice.chotard@st.com wrote:

>> For TEGRA ARCHITECTURE SUPPORT
>>         _ Stephen Warren <swarren@wwwdotorg.org>
>>         _ Thierry Reding <thierry.reding@gmail.com>
>>         _ Alexandre Courbot <gnurou@gmail.com>
>
> I don't know what STMPE is,

ST Microelectronics Multi-Purpose Expander.
Some GPIO and keypad and touchscreen, PWM and what
not.

> and I don't believe it is used on Tegra; what
> makes you think it is?

Probably this:

$ git grep stmpe arch/arm/boot/dts/

arch/arm/boot/dts/tegra30-apalis.dtsi:          stmpe811@41 {
arch/arm/boot/dts/tegra30-apalis.dtsi:                  compatible =
"st,stmpe811";
arch/arm/boot/dts/tegra30-apalis.dtsi:                  stmpe_touchscreen {
arch/arm/boot/dts/tegra30-apalis.dtsi:
compatible = "st,stmpe-ts";
arch/arm/boot/dts/tegra30-colibri.dtsi:         stmpe811@41 {
arch/arm/boot/dts/tegra30-colibri.dtsi:                 compatible =
"st,stmpe811";
arch/arm/boot/dts/tegra30-colibri.dtsi:                 stmpe_touchscreen {
arch/arm/boot/dts/tegra30-colibri.dtsi:
compatible = "st,stmpe-ts";

Yours,
Linus Walleij
