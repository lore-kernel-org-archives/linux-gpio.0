From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCHv2] gpiolib: change a warning to debug message when failing
 to get gpio
Date: Fri, 29 Nov 2013 21:01:42 +0100
Message-ID: <CACRpkdbbxjfPyjjON28nC9rK86jKTKZGL6y0_BUa94LF6FporA@mail.gmail.com>
References: <1385732854-9667-1-git-send-email-heikki.krogerus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:46624 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752873Ab3K2UBm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Nov 2013 15:01:42 -0500
Received: by mail-ob0-f179.google.com with SMTP id wm4so10473917obc.10
        for <linux-gpio@vger.kernel.org>; Fri, 29 Nov 2013 12:01:42 -0800 (PST)
In-Reply-To: <1385732854-9667-1-git-send-email-heikki.krogerus@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Fri, Nov 29, 2013 at 2:47 PM, Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:

> It's the drivers responsibility to react on failure to get
> the gpio descriptors and not the frameworks. Since there are
> some common peripherals that may or may not have certain
> pins connected to gpio lines, depending on the platform,
> printing the warning there may end up generating useless bug
> reports.
>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Applied for fixes, thanks Heikki!

Yours,
Linus Walleij
