From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] pinctrl: nsp: add pinmux driver support for Broadcom
 NSP SoC
Date: Mon, 30 Nov 2015 13:49:23 +0100
Message-ID: <CACRpkdZ=vyPSiPCUppfDWC9OShqfe-BRvB5QjU1AZmbDbYvsZQ@mail.gmail.com>
References: <1448042245-25702-1-git-send-email-yrdreddy@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:36798 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752822AbbK3MtY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2015 07:49:24 -0500
Received: by obdgf3 with SMTP id gf3so126987758obd.3
        for <linux-gpio@vger.kernel.org>; Mon, 30 Nov 2015 04:49:24 -0800 (PST)
In-Reply-To: <1448042245-25702-1-git-send-email-yrdreddy@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>, Stephen Warren <swarren@wwwdotorg.org>, Ray Jui <rjui@broadcom.com>
Cc: Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>

On Fri, Nov 20, 2015 at 6:57 PM, Yendapally Reddy Dhananjaya Reddy
<yrdreddy@broadcom.com> wrote:

> This adds the initial support of the Broadcom NSP pinmux driver.
>
> Signed-off-by: Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>

So what does Ray and Stephen say about this?

Is the hardware unique enough to warrant its own driver?

Or should it utilize/extend one of the existing Broadcom
drivers?

Yours,
Linus Walleij
