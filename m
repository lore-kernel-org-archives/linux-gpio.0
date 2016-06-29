From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: qcom: msm8974: Add hsic_ctl pinmux
Date: Wed, 29 Jun 2016 10:30:25 +0200
Message-ID: <CACRpkdYfs-8fj8_UqAxJUeRkYt5Y1KQC9dskwaWHmrA3-cD5Pg@mail.gmail.com>
References: <20160626052132.7178-1-stephen.boyd@linaro.org> <20160626052132.7178-3-stephen.boyd@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:35472 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751565AbcF2Ia1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2016 04:30:27 -0400
Received: by mail-ob0-f175.google.com with SMTP id o10so2870582obp.2
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2016 01:30:26 -0700 (PDT)
In-Reply-To: <20160626052132.7178-3-stephen.boyd@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stephen Boyd <stephen.boyd@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>

On Sun, Jun 26, 2016 at 7:21 AM, Stephen Boyd <stephen.boyd@linaro.org> wrote:

> The msm8974 pinctrl variant has a couple USB HSIC "glue"
> registers that let us mux between the pinctrl register settings
> or the HSIC core settings for the HSIC pins (gpio 144 and gpio
> 145). Support this method of operation by adding hsic_data and
> hsic_strobe pins that can select between hsic_ctl and gpio
> functions. This allows us to toggle the hsic pin configuration
> over to the HSIC core at runtime.
>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>

Patch applied.

Yours,
Linus Walleij
