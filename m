From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: pca953x: add PCAL9535 interrupt support for
 Galileo Gen2
Date: Thu, 14 Apr 2016 14:07:48 +0200
Message-ID: <CACRpkdbAYKHHfc8Qs7_=LVsZ9bcZVLATt9r-QLYap2s0jBkKoQ@mail.gmail.com>
References: <1460004992-16210-1-git-send-email-yong.b.li@intel.com>
	<CACRpkdavpaV1K7hfWgyRTtnxmFqkrD33--Ji9jcy_JFwqYYX7Q@mail.gmail.com>
	<BCE6BEBCDDF4B84E891D2320CBF96F1D3F9C77F1@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:35288 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754392AbcDNMHt (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Apr 2016 08:07:49 -0400
Received: by mail-ob0-f171.google.com with SMTP id k9so47441293obk.2
        for <linux-gpio@vger.kernel.org>; Thu, 14 Apr 2016 05:07:48 -0700 (PDT)
In-Reply-To: <BCE6BEBCDDF4B84E891D2320CBF96F1D3F9C77F1@SHSMSX101.ccr.corp.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Li, Yong B" <yong.b.li@intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "Puustinen, Ismo" <ismo.puustinen@intel.com>, Phil Reid <preid@electromag.com.au>

On Sun, Apr 10, 2016 at 5:02 AM, Li, Yong B <yong.b.li@intel.com> wrote:

> Thanks Linus. I think the below patch(in fixes branch) should be merged into devel branch too, since the below patch is depended by this one in devel branch.
>
> commit 9b8e3ec34318663affced3c14d960e78d760dd9a
> Author: Yong Li <sdliyong@gmail.com>
> Date:   Wed Mar 30 14:49:14 2016 +0800
>
>     gpio: pca953x: Use correct u16 value for register word write

This patch is already upstream so no need to worry about that.

Yours,
Linus Walleij
