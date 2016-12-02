From: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH 0/3] pinctrl: sx150x fixes for the 4-pin chips
Date: Fri, 2 Dec 2016 11:56:51 +0100
Message-ID: <0b6e22ca-44af-1ad1-1b9d-f69d7c8cc74d@axentia.se>
References: <1480675876-19540-1-git-send-email-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-db5eur01on0098.outbound.protection.outlook.com ([104.47.2.98]:46370
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751510AbcLBQ3j (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 2 Dec 2016 11:29:39 -0500
In-Reply-To: <1480675876-19540-1-git-send-email-peda@axentia.se>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On 2016-12-02 11:51, Peter Rosin wrote:
> Anyway, at your discretion, this could be added to patch #1:
> 
> Fixes: 4f5ac8cf0a11 ("pinctrl: sx150x: add support for sx1501, sx1504, sx1505, sx1507")

I'm apparently bad at copying, this should be:
Fixes: 4f5ac8cf0a11 ("pinctrl: sx150x: add support for sx1501, sx1504, sx1505 and sx1507")

Since I obviously typed this manually, I can note that I did check that
the shortened hash is correct.

Cheers,
Peter
