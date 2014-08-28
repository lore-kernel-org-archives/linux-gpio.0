From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V6 0/3] gpio: Add APM X-Gene SoC platform GPIO driver
Date: Thu, 28 Aug 2014 14:22:01 +0200
Message-ID: <CACRpkdZ79W9wjJ-AdtMqju6EBcTd+TEdUja6XPxfJT04zrDjDg@mail.gmail.com>
References: <1406833407-28316-1-git-send-email-fkan@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:44435 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751107AbaH1MWB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Aug 2014 08:22:01 -0400
Received: by mail-ob0-f179.google.com with SMTP id uz6so525249obc.10
        for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2014 05:22:01 -0700 (PDT)
In-Reply-To: <1406833407-28316-1-git-send-email-fkan@apm.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Feng Kan <fkan@apm.com>
Cc: patches <patches@apm.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Thu, Jul 31, 2014 at 9:03 PM, Feng Kan <fkan@apm.com> wrote:

> This patch add the GPIO controller in the APM X-Gene platform. The GPIO
> controller pins are muxed with the generic flash controller pins on the
> system.
>
> V6 Change:
>         1. change attribute description of second cell in gpio dts node
>            under documentation.

Patches 1+2 applied to the GPIO tree.

Patch 3 need to go through whatever tree handles this platform,
but you can add my ACK.

Yours,
Linus Walleij
