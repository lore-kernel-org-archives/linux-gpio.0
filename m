From: Clemens Gruber <clemens.gruber@pqgruber.com>
Subject: Re: pca953x: lockdep warning since 4.10
Date: Wed, 11 Jan 2017 16:06:33 +0100
Message-ID: <20170111150633.GA19933@archie.localdomain>
References: <20170107205410.GA11574@archie.localdomain>
 <CACRpkdaaCJK3=VOvyHt5hdJQJCQmaFjW5YXwEqivVPdFXDZ91Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.pqgruber.com ([178.189.19.235]:35094 "EHLO
        mail.pqgruber.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753301AbdAKPPh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Jan 2017 10:15:37 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdaaCJK3=VOvyHt5hdJQJCQmaFjW5YXwEqivVPdFXDZ91Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org

On Wed, Jan 11, 2017 at 02:43:31PM +0100, Linus Walleij wrote:
> On Sat, Jan 7, 2017 at 9:54 PM, Clemens Gruber
> <clemens.gruber@pqgruber.com> wrote:
> 
> > I observed the following lockdep warning when booting an i.MX6Q board
> > with several PCAL9555A gpio expanders connected over I2C. They are
> > connected to 3 separate busses, there is no i2c-mux in use.
> >
> > This warning appears with the latest mainline Linux kernel 4.10-rc2:
> 
> Can you please test the patch with subject:
> "gpio: provide lockdep keys for nested/unnested irqchips"
> that I sent out a few minutes ago?

Yes, the lockdep warning disappears. Thank you.

> 
> Please provide Tested-by if it solves your issue.

I'll send my Tested-by tag in reply to your v2 of the patch (due to the
typo in v1, which breaks the build)

Clemens
