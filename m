From: Beniamino Galvani <b.galvani@gmail.com>
Subject: Re: [PATCH] pinctrl: meson: fix gpio request disabling other modes
Date: Sun, 11 Dec 2016 22:50:28 +0100
Message-ID: <20161211215028.GA22499@gmail.com>
References: <20161206140817.11708-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wj0-f193.google.com ([209.85.210.193]:35708 "EHLO
        mail-wj0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753840AbcLKVun (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Dec 2016 16:50:43 -0500
Content-Disposition: inline
In-Reply-To: <20161206140817.11708-1-narmstrong@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linus.walleij@linaro.org, carlo@caione.org, khilman@baylibre.com, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

On Tue, Dec 06, 2016 at 03:08:16PM +0100, Neil Armstrong wrote:
> The pinctrl_gpio_request is called with the "full" gpio number, already
> containing the base, then meson_pmx_request_gpio is then called with the
> final pin number.
> Remove the base addition when calling meson_pmx_disable_other_groups.
> 
> Fixes: 6ac730951104 ("pinctrl: add driver for Amlogic Meson SoCs")
> CC: Beniamino Galvani <b.galvani@gmail.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Acked-by: Beniamino Galvani <b.galvani@gmail.com>
