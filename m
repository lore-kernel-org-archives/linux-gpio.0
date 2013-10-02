From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: arizona: Use the of_node from the Arizona device
Date: Wed, 2 Oct 2013 12:50:58 +0200
Message-ID: <CACRpkdbF+8rYxSbSQLoRo-pEmZvc1mduT5kMAsXYE2pQHPsPrQ@mail.gmail.com>
References: <1380484837-27668-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f173.google.com ([209.85.223.173]:45414 "EHLO
	mail-ie0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753364Ab3JBKu7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Oct 2013 06:50:59 -0400
Received: by mail-ie0-f173.google.com with SMTP id ar20so1345135iec.32
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2013 03:50:58 -0700 (PDT)
In-Reply-To: <1380484837-27668-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: Mark Brown <broonie@kernel.org>, patches@opensource.wolfsonmicro.com, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sun, Sep 29, 2013 at 10:00 PM, Charles Keepax
<ckeepax@opensource.wolfsonmicro.com> wrote:

> We need to use the of_node from the main Arizona device as that
> holds our configuration.
>
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

Patch applied.

Yours,
Linus Walleij
