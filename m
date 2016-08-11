From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: qcom: Add generic ssbi and spmi GPIO/MPP bindings
Date: Thu, 11 Aug 2016 10:19:32 +0200
Message-ID: <CACRpkdazPheA1s2FX2ugEyCFmrKiq36QEmEuCGJRt-vQTFWFVw@mail.gmail.com>
References: <20160711190109.16758-1-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:33714 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932289AbcHKITd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Aug 2016 04:19:33 -0400
Received: by mail-oi0-f51.google.com with SMTP id c15so91795397oig.0
        for <linux-gpio@vger.kernel.org>; Thu, 11 Aug 2016 01:19:33 -0700 (PDT)
In-Reply-To: <20160711190109.16758-1-sboyd@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

On Mon, Jul 11, 2016 at 9:01 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:

> The drivers don't really need to know which PMIC they're for, so
> make a generic binding for them. This alleviates us from updating
> the drivers every time a new PMIC comes out. It's still
> recommended that we update the binding with new PMIC models and
> always specify the specific model for the MPPs and gpios before
> the generic compatible string in devicetree, but this at least
> cuts down on adding more and more compatible strings to the
> drivers until we actually need them.
>
> Cc: <devicetree@vger.kernel.org>
> Acked-by: "Ivan T. Ivanov" <iivanov.xz@gmail.com>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Patch applied with Rob's ACK.

Yours,
Linus Walleij
