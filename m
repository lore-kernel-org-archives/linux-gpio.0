From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mfd: intel_soc_pmic_crc: Uniquify device name
Date: Tue, 18 Jul 2017 08:14:17 +0100
Message-ID: <20170718071417.umjdrk2cahnwqbz4@dell>
References: <20170620163323.16345-1-hadess@hadess.net>
 <20170717115829.2mp2eyodrcdqy4t5@dell>
 <1500297840.24690.4.camel@hadess.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f176.google.com ([209.85.128.176]:35187 "EHLO
        mail-wr0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751357AbdGRHOV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jul 2017 03:14:21 -0400
Received: by mail-wr0-f176.google.com with SMTP id w4so15188283wrb.2
        for <linux-gpio@vger.kernel.org>; Tue, 18 Jul 2017 00:14:20 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1500297840.24690.4.camel@hadess.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bastien Nocera <hadess@hadess.net>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 17 Jul 2017, Bastien Nocera wrote:

> On Mon, 2017-07-17 at 12:58 +0100, Lee Jones wrote:
> > The commit log should not be empty.
> 
> Fair.
> 
> > Please provide information as to why this change is required, etc.
> 
> SSIA.

Disagree.  The $SUBJECT says what your intention is, but does not
describe why it's required or what tangible difference it makes to a
running system.

> I also sent another patch to the same addresses labelled:
> [PATCH] gpio: crystalcove: Uniquify driver name

Okay?  I did wonder why the GPIO list was Cc'ed on this patch.

In this case the Intel guys are not listed as Maintainers for these
files, so you'll have to run ./get_maintainer.pl and pick them from
the committers entries.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
