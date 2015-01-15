From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/4] gpio: max732x: Fix possible deadlock
Date: Thu, 15 Jan 2015 18:04:16 +0100
Message-ID: <CACRpkdY9iV8_2BX7fSkkdKFmP3d8QjHATMLfHdP9-oindRWrnw@mail.gmail.com>
References: <1421156505-16600-1-git-send-email-semen.protsenko@globallogic.com>
	<1421156505-16600-4-git-send-email-semen.protsenko@globallogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f169.google.com ([209.85.223.169]:57112 "EHLO
	mail-ie0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753808AbbAORER (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Jan 2015 12:04:17 -0500
Received: by mail-ie0-f169.google.com with SMTP id y20so16014828ier.0
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jan 2015 09:04:16 -0800 (PST)
In-Reply-To: <1421156505-16600-4-git-send-email-semen.protsenko@globallogic.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Semen Protsenko <semen.protsenko@globallogic.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Mark Rutland <mark.rutland@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Marc Zyngier <maz@misterjones.org>, Grygorii Strashko <grygorii.strashko@globallogic.com>, Illia Smyrnov <illia.smyrnov@globallogic.com>

On Tue, Jan 13, 2015 at 2:41 PM, Semen Protsenko
<semen.protsenko@globallogic.com> wrote:

> This patch was derived from next one:
> "gpio: fix pca953x set_type 'scheduling while atomic' bug".
>
> After adding entry that consumes max732x GPIO as interrupt line to dts
> file, deadlock appears somewhere in max732x probe function.

Patch applied.

Yours,
Linus Walleij
