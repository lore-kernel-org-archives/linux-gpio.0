From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [bug report] pinctrl: berlin: Don't leak memory if krealloc() fails
Date: Tue, 18 Oct 2016 14:34:23 +0200
Message-ID: <CACRpkdZEbzeibDP2D3uA2HL9L10fiQcV6rr-kp+ORmnpRkBozw@mail.gmail.com>
References: <20161012081422.GA27222@mwanda> <20161012083002.c4tsiuis4suna77h@linux-x5ow.site>
 <20161012084526.GG5630@mwanda> <20161012094436.3k7abjx64wlyjnyc@linux-x5ow.site>
 <20161012111924.GJ5630@mwanda> <20161012123616.ff7kiwbsyrnvhwff@linux-x5ow.site>
 <20161012125846.GK5630@mwanda> <20161013130933.pl2stxjcawgcufbx@linux-x5ow.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f175.google.com ([209.85.220.175]:33261 "EHLO
        mail-qk0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754966AbcJRMeY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Oct 2016 08:34:24 -0400
Received: by mail-qk0-f175.google.com with SMTP id n189so289429874qke.0
        for <linux-gpio@vger.kernel.org>; Tue, 18 Oct 2016 05:34:24 -0700 (PDT)
In-Reply-To: <20161013130933.pl2stxjcawgcufbx@linux-x5ow.site>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johannes Thumshirn <jthumshirn@suse.de>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Oct 13, 2016 at 3:09 PM, Johannes Thumshirn <jthumshirn@suse.de> wrote:

> @Linus are you ok with dropping these patches from your queue or shall I send
> you reverts?

Dropping them, rebasing my for-next test branch on v4.9-rc1 anyway.

Yours,
Linus Walleij
