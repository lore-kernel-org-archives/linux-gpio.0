From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: oxnas: Rename pinctrl_utils_dt_free_map to pinctrl_utils_free_map
Date: Tue, 31 May 2016 12:59:51 +0200
Message-ID: <CACRpkdb0yrqbyk8k38DpZ1KP1WvPv6qxsDNgXm9XHCsiJRgmmg@mail.gmail.com>
References: <1464687375-1370-1-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:32873 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750852AbcEaK7w (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 31 May 2016 06:59:52 -0400
Received: by mail-oi0-f54.google.com with SMTP id k23so295413412oih.0
        for <linux-gpio@vger.kernel.org>; Tue, 31 May 2016 03:59:52 -0700 (PDT)
In-Reply-To: <1464687375-1370-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, May 31, 2016 at 11:36 AM, Neil Armstrong
<narmstrong@baylibre.com> wrote:

> Rename pinctrl_utils_dt_free_map to pinctrl_utils_free_map, introduced in
> d32f7fd3bbc3 ("pinctrl: Rename pinctrl_utils_dt_free_map to pinctrl_utils_free_map")
> but not reported into oxnas driver.
>
> Fixes: 611dac1e48a4 ("pinctrl: Add Oxford Semiconductor OXNAS pinctrl and gpio driver")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Patch applied.

Yours,
Linus Walleij
