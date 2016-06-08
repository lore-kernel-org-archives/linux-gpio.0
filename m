From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] gpio: pca953x: enfore type for
 i2c_smbus_write_word_data()
Date: Wed, 08 Jun 2016 12:06:19 +0300
Message-ID: <1465376779.1767.116.camel@linux.intel.com>
References: <1464721423-10969-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <CADO9-pd60y8u7fQ-thBfpKr58t-=i2D9gyW-PWcz1_CyvgOFsA@mail.gmail.com>
 <1464784534.1767.11.camel@linux.intel.com>
	 <CADO9-pdtfOKdAtwueg0YZ0GHnLkPwL842SXhpx+ENt+11wepPA@mail.gmail.com>
 <1464878595.1767.28.camel@linux.intel.com>
	 <CACRpkdbM_57-uYLRfQycD8pudvnruV4QMW8UJP+txKRs2MK1wA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:35236 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755953AbcFHJFX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 8 Jun 2016 05:05:23 -0400
In-Reply-To: <CACRpkdbM_57-uYLRfQycD8pudvnruV4QMW8UJP+txKRs2MK1wA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Yong Li <sdliyong@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Phil Reid <preid@electromag.com.au>

On Wed, 2016-06-08 at 10:03 +0200, Linus Walleij wrote:
> On Thu, Jun 2, 2016 at 4:43 PM, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Linus, by the way do we need to go with this to stable and -rc2?
> 
> If it's just a compilation warning, no.
> 
> If it is causing real regressions on hardware yes.

I believe it's just a static analyzer warning.

> 
> I have applied it for the next kernel as of now.

Thanks!

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
