From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/2] of/gpio: Define OF_GPIO_OPEN_DRAIN and
 OF_GPIO_OPEN_SOURCE flags.
Date: Mon, 24 Feb 2014 13:09:34 +0100
Message-ID: <CACRpkdYWEWgeY6xMvHtj3EPMfS_UgiNZvDPokrVzueqa3cw2ww@mail.gmail.com>
References: <1392148200-5393-1-git-send-email-ddaney.cavm@gmail.com>
	<1392148200-5393-2-git-send-email-ddaney.cavm@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:38900 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752492AbaBXMJe (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Feb 2014 07:09:34 -0500
Received: by mail-ob0-f172.google.com with SMTP id gq1so387209obb.31
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2014 04:09:34 -0800 (PST)
In-Reply-To: <1392148200-5393-2-git-send-email-ddaney.cavm@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Daney <ddaney.cavm@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Daney <david.daney@cavium.com>

On Tue, Feb 11, 2014 at 8:49 PM, David Daney <ddaney.cavm@gmail.com> wrote:

> From: David Daney <david.daney@cavium.com>
>
> When we have a GPIO pin connected to an open-drain network, we want a
> standard way of specifying this in the device tree.  So we choose bit
> 1 of the flag field to indicate open drain.

Same comments as for v1...

Yours,
Linus Walleij
