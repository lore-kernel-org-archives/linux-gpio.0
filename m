From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7795: Add DRIF support
Date: Thu, 23 Jun 2016 11:13:21 +0200
Message-ID: <CACRpkdawgMAdQDgQZJiF6B_ep_xff-LbU+hJSkMpsUfOvEYcGA@mail.gmail.com>
References: <1466165981-65284-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
 <CAMuHMdXz5mvR=+iWBap=jV7w94phuLXJSNKtOCqjxCEFNy=QDg@mail.gmail.com>
 <SG2PR06MB103835BE72B262243B46864BC3570@SG2PR06MB1038.apcprd06.prod.outlook.com>
 <CAMuHMdXYW5ObuDPm7aCr5uTaPYBrTAREM6Z16XWF3q7YBtFgNw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:33945 "EHLO
	mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751185AbcFWJNW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jun 2016 05:13:22 -0400
Received: by mail-oi0-f49.google.com with SMTP id s66so61044297oif.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jun 2016 02:13:22 -0700 (PDT)
In-Reply-To: <CAMuHMdXYW5ObuDPm7aCr5uTaPYBrTAREM6Z16XWF3q7YBtFgNw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Jun 21, 2016 at 9:37 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:

> Linus/Laurent: I assume the GPIO also takes precedence in the Linux pinctrl
> subsystem, or would it return an error, as the pin is claimed by the IP group?

Complicated question. Depends on the .strict property is set on the pin
controller, see Documentation/pinctrl.txt

Yours,
Linus Walleij
