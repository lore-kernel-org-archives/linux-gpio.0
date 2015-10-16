From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: keep the GPIO line names internal
Date: Fri, 16 Oct 2015 16:41:11 +0200
Message-ID: <CACRpkdb_7TNQ0CfYKD_fJFP6W2ZPJZJfaQYGUuPw+S762GvBAw@mail.gmail.com>
References: <1443050853-24601-1-git-send-email-linus.walleij@linaro.org>
	<20151004133742.GO4284@localhost>
	<CACRpkdaB=Sne1Vq=apQE5r8FDvfvQ-4w0nths-dVnuJvBaGDOA@mail.gmail.com>
	<20151005100147.GB25143@localhost>
	<CACRpkdZBw7ayenkRTtpQH==G64TGNEXv6DgzdRAZxCCHJUZuRg@mail.gmail.com>
	<20151006091316.GK19355@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:34996 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751401AbbJPOlM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Oct 2015 10:41:12 -0400
Received: by oiev17 with SMTP id v17so17686266oie.2
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2015 07:41:11 -0700 (PDT)
In-Reply-To: <20151006091316.GK19355@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Johan Hovold <johan@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>

On Tue, Oct 6, 2015 at 11:13 AM, Markus Pargmann <mpa@pengutronix.de> wrote:


> So what is this "real" chardev interface all about? What are the
> requirements and features for such an interface? How is it supposed to
> work? Was this already discussed somewhere?

Comes up all the time. Obviously noone find the time or focus
to do this, so I will make a try now to get the ball rolling. Expect
a rough chardev patch in a week or so.

Yours,
Linus Walleij
