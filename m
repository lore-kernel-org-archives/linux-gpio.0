From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH] gpio: pxa: change initcall level second attempt
Date: Tue, 17 Nov 2015 21:37:36 +0100
Message-ID: <871tbo9xbj.fsf@belgarion.home>
References: <1447446158-20213-1-git-send-email-robert.jarzmik@free.fr>
	<CACRpkdbaej0s0GNYUwbsmwR-fSRMuJR5H+GHrat1sevUBiCgmw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp01.smtpout.orange.fr ([80.12.242.123]:56856 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751918AbbKQUhj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2015 15:37:39 -0500
In-Reply-To: <CACRpkdbaej0s0GNYUwbsmwR-fSRMuJR5H+GHrat1sevUBiCgmw@mail.gmail.com>
	(Linus Walleij's message of "Tue, 17 Nov 2015 14:56:16 +0100")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Linus Walleij <linus.walleij@linaro.org> writes:

> Kludgy, but what can we do.
Indeed.

> Patch applied.
Thanks. I'll follow up with the current pinmux + partly pinconf implementation
to gather comments to amend/change/rework my current pxa2xx implementation.

I just need to split the patch into smaller chunks for easier review.

Cheers.

-- 
Robert
