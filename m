From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 2/3] irqchip: GIC: Add support for irq_{get,set}_irqchip_state
Date: Wed, 13 May 2015 13:58:37 +0200
Message-ID: <CACRpkdYffHJEzksc5mg7JZdwTzShGaQofAmbmn65=_V3ot04Rg@mail.gmail.com>
References: <1426676484-21812-1-git-send-email-marc.zyngier@arm.com>
	<1426676484-21812-3-git-send-email-marc.zyngier@arm.com>
	<CAL85gmBrkonMcKdUVGmYx6zT3wSe-e2jPhnL_+Tkf3s4jsAiWg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:34449 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754522AbbEML6i (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 13 May 2015 07:58:38 -0400
Received: by oiko83 with SMTP id o83so29020687oik.1
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2015 04:58:37 -0700 (PDT)
In-Reply-To: <CAL85gmBrkonMcKdUVGmYx6zT3wSe-e2jPhnL_+Tkf3s4jsAiWg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Feng Kan <fkan@apm.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Abhijeet Dharmapurikar <adharmap@codeaurora.org>, Stephen Boyd <sboyd@codeaurora.org>, Phong Vo <pvo@apm.com>, Tin Huynh <tnhuynh@apm.com>, Y Vo <yvo@apm.com>, Thomas Gleixner <tglx@linutronix.de>, Toan Le <toanle@apm.com>, Bjorn Andersson <bjorn@kryo.se>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Wed, May 13, 2015 at 4:25 AM, Feng Kan <fkan@apm.com> wrote:

> Marc:
>
> Sorry for top posting. It seems with GIC-400, the get_irqstate is not a reliable
> way of accessing the GPIO status. In our case, the gpio interrupt status can
> only be read correctly with the SPISR register. So it seems we have to go
> back to the old way of mapping the SPISR portion of the GIC in our GPIO
> driver. We wanted to ask you if that is acceptable since SPISR in not
> standard in all GIC, perhaps we can treat it differently.

As GPIO maintainer I am curious about what this is...

Can you describe the scenario where your GPIO (!) driver needs
to be poking around in the GIC SPISR?

Yours,
Linus Walleij
