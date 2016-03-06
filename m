From: Alexander Stein <alexanders83@web.de>
Subject: Re: [PATCH 00/63] Allow compile testing of most gpio drivers
Date: Sun, 06 Mar 2016 09:24:17 +0100
Message-ID: <5418619.AydMFMK0ya@kongar>
References: <1456492692-21592-1-git-send-email-alexanders83@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.3]:50283 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751082AbcCFIYW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 6 Mar 2016 03:24:22 -0500
In-Reply-To: <1456492692-21592-1-git-send-email-alexanders83@web.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

On Friday 26 February 2016, 14:17:09 wrote Alexander Stein:
> This patch set allows compile testing of most gpio drivers. I compiled all
> from this list for x86_64 and arm. The drivers missing are using arch specific
> includes or code only available on that platform, e.g. msr on x86, which is
> unavailable on others.
> I didn't include the OF people for the first one in purpose as I want some
> feedback first.

Any feedback on this?

Best regards,
Alexander

