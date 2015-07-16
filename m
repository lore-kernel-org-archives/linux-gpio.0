From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: Drop owner assignment from platform_driver
Date: Thu, 16 Jul 2015 15:15:41 +0200
Message-ID: <CACRpkdbkM+PBA5CB5yiCbaFvQkJD+mqYnTz3MEHoAd6rkWqikA@mail.gmail.com>
References: <1436509650-5218-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:35373 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751883AbbGPNPl (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2015 09:15:41 -0400
Received: by oihq81 with SMTP id q81so49898033oih.2
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2015 06:15:41 -0700 (PDT)
In-Reply-To: <1436509650-5218-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Barry Song <baohua@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Jul 10, 2015 at 8:27 AM, Krzysztof Kozlowski
<k.kozlowski@samsung.com> wrote:

> platform_driver does not need to set an owner because
> platform_driver_register() will set it.
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Patch applied.

Yours,
Linus Walleij
