From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] pinctrl: ns2: add pinmux driver support for Broadcom
 NS2 SoC
Date: Wed, 9 Mar 2016 18:04:26 +0700
Message-ID: <CACRpkdaKn4puDsZBPSbfkmHW4KHqBW8q1T2vpyNk_0Yb7C0AXQ@mail.gmail.com>
References: <1457005303-26829-1-git-send-email-yendapally.reddy@broadcom.com>
	<1457005303-26829-3-git-send-email-yendapally.reddy@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:36025 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753133AbcCILE1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Mar 2016 06:04:27 -0500
Received: by mail-oi0-f54.google.com with SMTP id r187so32422988oih.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Mar 2016 03:04:26 -0800 (PST)
In-Reply-To: <1457005303-26829-3-git-send-email-yendapally.reddy@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>, Ray Jui <rjui@broadcom.com>, Stefan Wahren <stefan.wahren@i2se.com>, Stephen Warren <swarren@wwwdotorg.org>, Florian Fainelli <f.fainelli@gmail.com>, Pramod KUMAR <pramodku@broadcom.com>, Jonathan Bell <jonathan@raspberrypi.org>
Cc: Scott Branden <sbranden@broadcom.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Mar 3, 2016 at 6:41 PM, Yendapally Reddy Dhananjaya Reddy
<yendapally.reddy@broadcom.com> wrote:

> This adds the initial support of the Broadcom NS2 pinmux driver
>
> Signed-off-by: Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>

Now yet another Broadcom driver!

Can I get the help of the maintainers of the other
Broadcom drivers to say:

- If this looks sane

- If this hardware looks suspiciously similar to one of the
  other drivers and should rather me a subdriver of one of
  the existing ones

?

Yours,
Linus Walleij
