From: Taras Kondratiuk <taras.kondratiuk@linaro.org>
Subject: Re: [PATCH v6 1/6] gpio: davinci: use readl/writel instead of __raw_*
Date: Fri, 22 Nov 2013 12:08:51 +0200
Message-ID: <CAArO44vmfkroE9w4KviOhjkPvg9bTX9pAtr3oxYjD9u_wVZXeg@mail.gmail.com>
References: <1385057731-4348-1-git-send-email-prabhakar.csengg@gmail.com>
	<1385057731-4348-2-git-send-email-prabhakar.csengg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f45.google.com ([209.85.215.45]:39849 "EHLO
	mail-la0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751956Ab3KVKIx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Nov 2013 05:08:53 -0500
Received: by mail-la0-f45.google.com with SMTP id eh20so749504lab.4
        for <linux-gpio@vger.kernel.org>; Fri, 22 Nov 2013 02:08:52 -0800 (PST)
In-Reply-To: <1385057731-4348-2-git-send-email-prabhakar.csengg@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Prabhakar Lad <prabhakar.csengg@gmail.com>
Cc: Sekhar Nori <nsekhar@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Grygorii Strashko <grygorii.strashko@ti.com>, LKML <linux-kernel@vger.kernel.org>, DLOS <davinci-linux-open-source@linux.davincidsp.com>, LAK <linux-arm-kernel@lists.infradead.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Grant Likely <grant.likely@linaro.org>

On 21 November 2013 20:15, Prabhakar Lad <prabhakar.csengg@gmail.com> wrote:
> From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
>
> This patch replaces the __raw_readl/writel with
> readl and writel, Altough the code runs on ARMv5
> based SOCs, changing this will help copying the code
> for other uses.

This replacement has a functional impact: it adds memory barriers.
Please note this in the description.
Also please add a bit of explanation on why do you need to add barriers.

-- 
Regards,
Taras Kondratiuk
