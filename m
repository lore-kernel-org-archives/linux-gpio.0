From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/3] gpio: pcf857x: Add OF support
Date: Fri, 23 Aug 2013 19:54:03 +0200
Message-ID: <CACRpkdYvP6yCiQMQFpzaerrcvFug4rNWALPSDvkTidmz8_PovQ@mail.gmail.com>
References: <1376953494-9684-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
	<1376953494-9684-4-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:50398 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755730Ab3HWRyF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Aug 2013 13:54:05 -0400
Received: by mail-ob0-f171.google.com with SMTP id tb18so986627obb.2
        for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2013 10:54:04 -0700 (PDT)
In-Reply-To: <1376953494-9684-4-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

On Tue, Aug 20, 2013 at 1:04 AM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:

> Add DT bindings for the pcf857x-compatible chips and parse the device
> tree node in the driver.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

I'm holding this until I get some reaction from the device tree reviewers,
or until I get unpatient, whichever comes first. It looks good to me.

Yours,
Linus Walleij
