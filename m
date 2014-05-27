From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] gpio: Add APM X-Gene SoC GPIO controller support
Date: Tue, 27 May 2014 10:25:54 +0200
Message-ID: <CACRpkdaVYXU9GN5OymuP3JRsQO3unkRGb5vZN3Jb2nWSnkh1SQ@mail.gmail.com>
References: <1400263432-922-1-git-send-email-fkan@apm.com>
	<1400263432-922-2-git-send-email-fkan@apm.com>
	<CAAVeFu+TOfjfvisinv3oJ9PobdV9HcNJhr+3VYneSJ54uGwiAg@mail.gmail.com>
	<CAL85gmDjVszNd3TB51BGa+78wEEZmJfBOLNKOpTEvMTGU2VdBA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:39492 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750884AbaE0IZz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 27 May 2014 04:25:55 -0400
Received: by mail-ob0-f179.google.com with SMTP id vb8so8870113obc.38
        for <linux-gpio@vger.kernel.org>; Tue, 27 May 2014 01:25:55 -0700 (PDT)
In-Reply-To: <CAL85gmDjVszNd3TB51BGa+78wEEZmJfBOLNKOpTEvMTGU2VdBA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Feng Kan <fkan@apm.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, patches <patches@apm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Wed, May 21, 2014 at 1:54 AM, Feng Kan <fkan@apm.com> wrote:

> I see each bank as separate gpio chip. It is a simple way to
> abstract the banks since they can operate independently.

I think they should also be separate devices, and separate nodes
in the device tree.

> It also
> provided me a way to fix the sysfs gpio base number, regardless if
> a particular bank node is pulled out.

The GPIO sysfs is unpredictable for this and many other
reasons and should not be relied upon.

> This is also done in similar way
> in some other gpio drivers such as the dwapb gpio driver.

I think the dwapb has it's registers mingled while your banks
seem to be separate chunks.

Yours,
Linus Walleij
