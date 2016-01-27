From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 0/9] Add STM32 pinctrl/GPIO driver
Date: Wed, 27 Jan 2016 14:20:38 +0100
Message-ID: <CACRpkdYGQ1xObWfka2CN9au6YMGhpu4qcTZpu72bzuJjO38tog@mail.gmail.com>
References: <1452773795-24216-1-git-send-email-mcoquelin.stm32@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:33939 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754266AbcA0NUj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2016 08:20:39 -0500
Received: by mail-oi0-f46.google.com with SMTP id k206so5012933oia.1
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jan 2016 05:20:38 -0800 (PST)
In-Reply-To: <1452773795-24216-1-git-send-email-mcoquelin.stm32@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Patrice CHOTARD <patrice.chotard@st.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Bruno Herrera <bruherrera@gmail.com>

On Thu, Jan 14, 2016 at 1:16 PM, Maxime Coquelin
<mcoquelin.stm32@gmail.com> wrote:

> This is the fourth round of STM32 pinctrl series, which takes into
> account comments made by Patrice on patch 4.

I have applied patch 2 and 4 to the pinctrl tree.

Please put the rest of the patches in through ARM SoC, you can
add my
Acked-by: Linus Walleij <linus.walleij@linaro.org>
to them.

AFAICT there is no compile-time dependency between these two
patches and the rest, so it should merge just fine.

Yours,
Linus Walleij
