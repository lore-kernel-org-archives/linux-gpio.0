From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] gpio: omap: Fix error path on chip init
Date: Tue, 2 Jan 2018 11:39:55 +0100
Message-ID: <20180102103955.GK16993@localhost>
References: <20180102102314.12906-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:39884 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752839AbeABKj4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jan 2018 05:39:56 -0500
Received: by mail-lf0-f68.google.com with SMTP id m20so42148708lfi.6
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jan 2018 02:39:55 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20180102102314.12906-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>

On Tue, Jan 02, 2018 at 11:23:14AM +0100, Linus Walleij wrote:
> The error path was leaking a gpio_chip at one point.
> 
> Cc: Johan Hovold <johan@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Johan Hovold <johan@kernel.org>
