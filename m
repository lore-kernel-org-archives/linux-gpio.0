From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] gpio: pca953x: enfore type for i2c_smbus_write_word_data()
Date: Wed, 8 Jun 2016 10:03:55 +0200
Message-ID: <CACRpkdbM_57-uYLRfQycD8pudvnruV4QMW8UJP+txKRs2MK1wA@mail.gmail.com>
References: <1464721423-10969-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <CADO9-pd60y8u7fQ-thBfpKr58t-=i2D9gyW-PWcz1_CyvgOFsA@mail.gmail.com>
 <1464784534.1767.11.camel@linux.intel.com> <CADO9-pdtfOKdAtwueg0YZ0GHnLkPwL842SXhpx+ENt+11wepPA@mail.gmail.com>
 <1464878595.1767.28.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:34306 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751212AbcFHID5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jun 2016 04:03:57 -0400
Received: by mail-oi0-f51.google.com with SMTP id e72so900299oib.1
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jun 2016 01:03:56 -0700 (PDT)
In-Reply-To: <1464878595.1767.28.camel@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Yong Li <sdliyong@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Phil Reid <preid@electromag.com.au>

On Thu, Jun 2, 2016 at 4:43 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Linus, by the way do we need to go with this to stable and -rc2?

If it's just a compilation warning, no.

If it is causing real regressions on hardware yes.

I have applied it for the next kernel as of now.

Yours,
Linus Walleij
