From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: vx855: Switch to use managed resources APIs
Date: Tue, 13 Jan 2015 07:27:47 +0100
Message-ID: <CACRpkdZf=_Fozt7yy=4BGrJx7iD27LPVwKfpD_K0P5BSQTBikQ@mail.gmail.com>
References: <1418357861.1093.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f173.google.com ([209.85.223.173]:49092 "EHLO
	mail-ie0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751225AbbAMG1r (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jan 2015 01:27:47 -0500
Received: by mail-ie0-f173.google.com with SMTP id y20so1166620ier.4
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jan 2015 22:27:47 -0800 (PST)
In-Reply-To: <1418357861.1093.1.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Harald Welte <HaraldWelte@viatech.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Dec 12, 2014 at 5:17 AM, Axel Lin <axel.lin@ingics.com> wrote:

> Use devm_* APIs to simplify the code a bit.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Patch applied.

Great work, as usual.

Yours,
Linus Walleij
