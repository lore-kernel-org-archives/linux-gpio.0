From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] gpio: mcp23s08: Add simple IRQ support for SPI devices
Date: Thu, 27 Nov 2014 14:52:04 +0100
Message-ID: <CACRpkdYjXSDrBUjQcygWaWGm3eS0MJF0MFqOY5zD58fLppv=aQ@mail.gmail.com>
References: <1416213491-9775-1-git-send-email-alexander.stein@systec-electronic.com>
	<1416213491-9775-2-git-send-email-alexander.stein@systec-electronic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f182.google.com ([209.85.213.182]:37397 "EHLO
	mail-ig0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751081AbaK0NwF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Nov 2014 08:52:05 -0500
Received: by mail-ig0-f182.google.com with SMTP id hn15so4332041igb.9
        for <linux-gpio@vger.kernel.org>; Thu, 27 Nov 2014 05:52:04 -0800 (PST)
In-Reply-To: <1416213491-9775-2-git-send-email-alexander.stein@systec-electronic.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Nov 17, 2014 at 9:38 AM, Alexander Stein
<alexander.stein@systec-electronic.com> wrote:

> Currently this implementation only supports one IRQ for (all) SPI devices
> using the same chip select.
>
> Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>

Patch applied.

Yours,
Linus Walleij
