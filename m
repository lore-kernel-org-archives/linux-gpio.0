From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 3/8] pinctrl: samsung: Add support for pad retention
 control for Exynos5433 SoCs
Date: Thu, 26 Jan 2017 21:57:46 +0200
Message-ID: <20170126195746.gjx7fp3ovz5nqd76@kozik-lap>
References: <1485419634-28331-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170126083402eucas1p187d3d31f62544fc46fae99fc5f74dbfe@eucas1p1.samsung.com>
 <1485419634-28331-4-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33415 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753001AbdAZT6B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Jan 2017 14:58:01 -0500
Content-Disposition: inline
In-Reply-To: <1485419634-28331-4-git-send-email-m.szyprowski@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Lee Jones <lee.jones@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Thu, Jan 26, 2017 at 09:33:49AM +0100, Marek Szyprowski wrote:
> This patch adds support for retention control for Exynos5433 SoCs. Three
> groups of pins has been defined for retention control: common shared group
> for ALIVE, CPIF, eSE, FINGER, IMEM, NFC, PERIC, TOUCH pin banks and
> separate control for FSYS and AUD pin banks, for which PMU retention
> registers match whole banks.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/pinctrl/samsung/pinctrl-exynos.c    | 58 +++++++++++++++++++++++++++++
>  include/linux/soc/samsung/exynos-regs-pmu.h | 16 ++++++++
>  2 files changed, 74 insertions(+)
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

