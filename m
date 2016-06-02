From: Michael Welling <mwelling@ieee.org>
Subject: Re: [PATCH 2/2] tools/gpio: add the gpio-hammer tool
Date: Thu, 2 Jun 2016 09:59:28 -0500
Message-ID: <20160602145927.GA4198@deathstar>
References: <1461660866-18683-1-git-send-email-linus.walleij@linaro.org>
 <1461660866-18683-2-git-send-email-linus.walleij@linaro.org>
 <20160427160034.GA20392@deathstar>
 <CACRpkdYr8GSmQ-=G4XcTtfrBcKsXUsJOvE7W35Fk-ovDiyaPJA@mail.gmail.com>
 <20160601034343.GA3749@deathstar>
 <CACRpkdZrdwPwnLDnHfBxEi67cUsfUAo+ugHnZWxywg5Vjdzghw@mail.gmail.com>
 <20160601180906.GA5286@deathstar>
 <CACRpkdYEfYFwnhgEGf2AmCkj7QUJm-GeQW3_CE2H4vWSNngp_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f67.google.com ([209.85.220.67]:32933 "EHLO
	mail-pa0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932210AbcFBO7i (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Jun 2016 10:59:38 -0400
Received: by mail-pa0-f67.google.com with SMTP id di3so3535248pab.0
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jun 2016 07:59:38 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CACRpkdYEfYFwnhgEGf2AmCkj7QUJm-GeQW3_CE2H4vWSNngp_Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Markus Pargmann <mpa@pengutronix.de>, Lee Campbell <leecam@google.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Johan Hovold <johan@kernel.org>

On Wed, Jun 01, 2016 at 11:40:04PM +0200, Linus Walleij wrote:
> On Wed, Jun 1, 2016 at 8:09 PM, Michael Welling <mwelling@ieee.org> wrote:
> 
> > Is there a way to name a group of GPIOs?
> 
> Do you mean from the producer side or the consumer side?

Producer side is what I am thinking.

> There is gpio-line-names in DT for the producer side.
> 
The gpio-line-names are naming individual GPIO on a controller.
I am looking to take a set of GPIOs and name them as a group and
be able to access them by that name. Either individually or
simultaneously.
 
> From the consumer side the same consumer name will be used
> on all lines if more than one is selected, which I think makes
> sense. (It's just a label after all.)
> 
> > It seems you are passing around a byte of data for each GPIO state.
> > Is there a reason why the bits couldn't bit masked into single variable
> > given the max number of handles is 64?
> 
> Sorry not following, I guess you need to post me some part of
> the patch or so...

+       fprintf(stdout, "] on %s, initial states: [", device_name);
+       for (i = 0; i < nlines; i++) {
+               fprintf(stdout, "%d", data.values[i]);

data.values[i];

Each bit is stored in a byte.

> 
> Yours,
> Linus Walleij
