From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] gpio: Add APM X-Gene SoC GPIO controller support
Date: Wed, 28 May 2014 21:10:24 +0200
Message-ID: <CACRpkdYoebS-SzCPBnssjNMN_-mxd2GoPwiXHfZUL9HwMeGVzw@mail.gmail.com>
References: <1400263432-922-1-git-send-email-fkan@apm.com>
	<1400263432-922-2-git-send-email-fkan@apm.com>
	<CAAVeFu+TOfjfvisinv3oJ9PobdV9HcNJhr+3VYneSJ54uGwiAg@mail.gmail.com>
	<CAL85gmDjVszNd3TB51BGa+78wEEZmJfBOLNKOpTEvMTGU2VdBA@mail.gmail.com>
	<CACRpkdaVYXU9GN5OymuP3JRsQO3unkRGb5vZN3Jb2nWSnkh1SQ@mail.gmail.com>
	<CAL85gmCZD90UUZgC0-X4hui2L1V5TuH++o3fA20pRF_ZQEpDQw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f45.google.com ([209.85.219.45]:42419 "EHLO
	mail-oa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755079AbaE1TKY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 28 May 2014 15:10:24 -0400
Received: by mail-oa0-f45.google.com with SMTP id l6so11629018oag.4
        for <linux-gpio@vger.kernel.org>; Wed, 28 May 2014 12:10:24 -0700 (PDT)
In-Reply-To: <CAL85gmCZD90UUZgC0-X4hui2L1V5TuH++o3fA20pRF_ZQEpDQw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Feng Kan <fkan@apm.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, patches <patches@apm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Tue, May 27, 2014 at 6:59 PM, Feng Kan <fkan@apm.com> wrote:

> I will break out the gpio to separate
> device nodes as instructed, I will have to use the reg attribute to offset
> bank registers. Please let me know if it is acceptable.

Yeah sure regs = <a>, <b>, <c> for a single node is OK if that's what
you mean.

> gfc_gpio_fl0              GFC42'h1701c00c
> gfc_gpio_fl0_mux      GFC42'h1701c010
> gfc_gpio_fl1              GFC42'h1701c018
> gfc_gpio_fl1_mux      GFC42'h1701c01c
> gfc_gpio_fl2              GFC42'h1701c024
> gfc_gpio_fl2_mux      GFC42'h1701c028
> gfc_gpio_fl0_od        GFC42'h1701c030
> gfc_gpio_fl1_od        GFC42'h1701c034
> gfc_gpio_fl2_od        GFC42'h1701c038

Strange syntax in the last line there. GFC42'h uhm.

But that looks a bit mingled actually. However I think you will be
much happier if you split it into individual devices as I wanted to.
It will be easier to maintain and simpler code even if the device tree
may look a bit strange.

Yours,
Linus Walleij
