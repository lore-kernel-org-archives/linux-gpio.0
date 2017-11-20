From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v2 1/2] pinctrl: meson-axg: Introduce a pinctrl pinmux
 ops for Meson-AXG SoC
Date: Mon, 20 Nov 2017 11:33:11 +0100
Message-ID: <1511173991.6971.7.camel@baylibre.com>
References: <20171120100825.16613-1-yixun.lan@amlogic.com>
         <20171120100825.16613-2-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:37891 "EHLO
        mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751019AbdKTKdN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Nov 2017 05:33:13 -0500
Received: by mail-wm0-f51.google.com with SMTP id 128so9074991wmo.3
        for <linux-gpio@vger.kernel.org>; Mon, 20 Nov 2017 02:33:13 -0800 (PST)
In-Reply-To: <20171120100825.16613-2-yixun.lan@amlogic.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yixun Lan <yixun.lan@amlogic.com>, Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Carlo Caione <carlo@caione.org>, Xingyu Chen <xingyu.chen@amlogic.com>, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

On Mon, 2017-11-20 at 18:08 +0800, Yixun Lan wrote:
> From: Xingyu Chen <xingyu.chen@amlogic.com>
> 
> The pin controller has been updated in the Amlogic Meson AXG series,
> which use continuous 4-bit register to select function for each pin.
> In order to support this, a new pinmux operations "meson_axg_pmx_ops"
> has been added.
> 
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

> Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>

