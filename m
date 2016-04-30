From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [patch] pinctrl: baytrail: fix some error handling in debugfs
Date: Sat, 30 Apr 2016 13:35:30 +0200
Message-ID: <CACRpkdagyyeTTieGNNdT-O2pQAZBAnKtUkTBzAc_0Fdq_w-7aA@mail.gmail.com>
References: <20160427080835.GB22469@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:36198 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752111AbcD3Lfb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 30 Apr 2016 07:35:31 -0400
Received: by mail-oi0-f41.google.com with SMTP id x201so145591327oif.3
        for <linux-gpio@vger.kernel.org>; Sat, 30 Apr 2016 04:35:31 -0700 (PDT)
In-Reply-To: <20160427080835.GB22469@mwanda>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Cristina Ciocan <cristina.ciocan@intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Apr 27, 2016 at 10:08 AM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:

> We need to unlock before continuing.  Also the continue was accidentally
> left out on one error path which would lead to a NULL dereference.
>
> Fixes: 86e3ef812fe3 ('pinctrl: baytrail: Update gpio chip operations')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied with Mika's ACK.

Yours,
Linus Walleij
