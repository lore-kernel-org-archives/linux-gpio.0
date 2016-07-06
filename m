From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: imx21: Remove the MODULE_DEVICE_TABLE() macro
Date: Wed, 6 Jul 2016 16:52:20 +0200
Message-ID: <CACRpkdbzfC1vjPapEQOKZncmmZdqDBLxoZaLv+m4uybgKbkQcw@mail.gmail.com>
References: <1467811517-20187-1-git-send-email-festevam@gmail.com>
 <CACRpkdapf3uLXU9gWfVc_DpHVPVbiDozEvbpaRxOu8G9tLGiQg@mail.gmail.com> <20160706143818.GG26134@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:36197 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753650AbcGFOwW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jul 2016 10:52:22 -0400
Received: by mail-oi0-f47.google.com with SMTP id f189so273843901oig.3
        for <linux-gpio@vger.kernel.org>; Wed, 06 Jul 2016 07:52:21 -0700 (PDT)
In-Reply-To: <20160706143818.GG26134@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Fabio Estevam <festevam@gmail.com>, Arnd Bergmann <arnd@arndb.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

n Wed, Jul 6, 2016 at 4:38 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

>> Patch applied with Arnd's ACK.
>
> Thanks and sorry this one snuck through.  I'm going to add walking all
> the various defconfigs to my build coverage akin to what linux-next does
> overnight.  It seems the allmodconfig builds didn't hit this file...

Don't worry. I'm a big fan of your work on cleaning up this mess and
surely I'm ready to do my part of making it happen.

Yours,
Linus Walleij
