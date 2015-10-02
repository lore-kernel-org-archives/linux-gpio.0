From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 2/5] mfd: tps65912: Remove old driver in preparation
 for new driver
Date: Fri, 2 Oct 2015 05:16:14 -0700
Message-ID: <CACRpkdaTVM9ojb3g5FqnXGtMRP3fhnyFSgTw7K45u+LUCc0x=Q@mail.gmail.com>
References: <1443106374-4126-1-git-send-email-afd@ti.com>
	<1443106374-4126-3-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:36154 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752356AbbJBMQP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Oct 2015 08:16:15 -0400
Received: by obcgx8 with SMTP id gx8so80132695obc.3
        for <linux-gpio@vger.kernel.org>; Fri, 02 Oct 2015 05:16:14 -0700 (PDT)
In-Reply-To: <1443106374-4126-3-git-send-email-afd@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Sep 24, 2015 at 7:52 AM, Andrew F. Davis <afd@ti.com> wrote:

> The old tps65912 driver is being replaced, delete old driver.
>
> Signed-off-by: Andrew F. Davis <afd@ti.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

The merge collisions are unpredictable. Will this be merged
through the MFD tree?

Yours,
Linus Walleij
