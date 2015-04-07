From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH gpio 1/4] drivers: gpio: use devm_kzalloc
Date: Tue, 7 Apr 2015 17:40:23 +0200
Message-ID: <20150407154023.GF21841@localhost>
References: <1427775551-6908-1-git-send-email-varkab@cdac.in>
 <1427775551-6908-2-git-send-email-varkab@cdac.in>
 <CACRpkdbhxgx5ED7oy-Uzxd34_KO=5EuuMjkBDp+G9wW7X=5mVA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f43.google.com ([209.85.215.43]:36164 "EHLO
	mail-la0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752872AbbDGPk0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Apr 2015 11:40:26 -0400
Received: by lagv1 with SMTP id v1so45250531lag.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2015 08:40:23 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CACRpkdbhxgx5ED7oy-Uzxd34_KO=5EuuMjkBDp+G9wW7X=5mVA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Varka Bhadram <varkabhadram@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Varka Bhadram <varkab@cdac.in>

On Tue, Apr 07, 2015 at 04:19:17PM +0200, Linus Walleij wrote:
> On Tue, Mar 31, 2015 at 6:19 AM, Varka Bhadram <varkabhadram@gmail.com> wrote:
> 
> > We can use devres API for allocating memory. No need of using kfree.
> >
> > Signed-off-by: Varka Bhadram <varkab@cdac.in>
> 
> Straight forward clean-up. Patch applied.

You should probably drop this one (or remove the kfrees from the remove
callbacks as a follow up).

Johan
