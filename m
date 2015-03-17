From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: dt: at91: new binding
Date: Tue, 17 Mar 2015 13:07:19 +0100
Message-ID: <CACRpkdbNLE+VjhvSgsU4oqAc03ieCNyiLkUzbjEiu_LFof-Unw@mail.gmail.com>
References: <1424943294-8805-1-git-send-email-plagnioj@jcrosoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:36025 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752348AbbCQMHU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Mar 2015 08:07:20 -0400
Received: by oigv203 with SMTP id v203so6008911oig.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2015 05:07:19 -0700 (PDT)
In-Reply-To: <1424943294-8805-1-git-send-email-plagnioj@jcrosoft.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Stephen Warren <swarren@wwwdotorg.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "arm@kernel.org" <arm@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

On Thu, Feb 26, 2015 at 10:34 AM, Jean-Christophe PLAGNIOL-VILLARD
<plagnioj@jcrosoft.com> wrote:

> +For each peripheral/bank we will descibe in a u32 if a pin can be
> +configured in it by putting 1 to the pin bit (1 << pin)

This seems to be describing driver intrinsics in the device tree, like
how the hardware is routed on the inside and what it can do.

IMO that is driver territory, the driver should know these limitations
and protest if you try to do something illegal.

Anyway as the AT91 maintainers seem to disagree I will allow some
more time for discussion before merging the patch.

I can't really have one AT91 maintainer NACKing another, it doesn't
matter that this is a separate driver, in my book the MAINTAINERS
entry for AT91 as a whole overrides that so can you please find an
agreement on how to handle this or I will stall the patch until
you're in agreement.

ARM SoC maintainers input would be welcomed.

Yours,
Linus Walleij
