From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: gpio-74x164: Remove redundant spi_set_drvdata
Date: Mon, 23 Sep 2013 12:52:00 +0200
Message-ID: <CACRpkdaq_wcXGxyy+ZqZek7X45u=VKJupnc=PfPJkd3SWJYqig@mail.gmail.com>
References: <1379591888-8834-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:46480 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753186Ab3IWKwA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Sep 2013 06:52:00 -0400
Received: by mail-ob0-f175.google.com with SMTP id uz6so3213343obc.6
        for <linux-gpio@vger.kernel.org>; Mon, 23 Sep 2013 03:52:00 -0700 (PDT)
In-Reply-To: <1379591888-8834-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Gabor Juhos <juhosg@openwrt.org>

On Thu, Sep 19, 2013 at 1:58 PM, Sachin Kamat <sachin.kamat@linaro.org> wrote:

> Driver core sets driver data to NULL upon failure or remove.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> Cc: Gabor Juhos <juhosg@openwrt.org>

Patch applied.

Yours,
Linus Walleij
