From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: brcmstb: Return proper error if bank width is invalid
Date: Fri, 15 Apr 2016 10:10:28 +0200
Message-ID: <CACRpkdYaqJS1ZZm33dq3HudAJJ3NZN3Q=H=+FNFNf8ByS1bmgQ@mail.gmail.com>
References: <1460283315.10702.5.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:33848 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751030AbcDOIK3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Apr 2016 04:10:29 -0400
Received: by mail-ob0-f171.google.com with SMTP id bg3so60782834obb.1
        for <linux-gpio@vger.kernel.org>; Fri, 15 Apr 2016 01:10:29 -0700 (PDT)
In-Reply-To: <1460283315.10702.5.camel@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Gregory Fong <gregory.0xf0@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sun, Apr 10, 2016 at 12:15 PM, Axel Lin <axel.lin@ingics.com> wrote:

> Return proper error in brcmstb_gpio_probe if bank width is invalid.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Patch applied with Gregory's ACK.

Yours,
Linus Walleij
