From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH 1/3] gpio: pl061: lock IRQs when starting them
Date: Wed, 27 Nov 2013 10:02:04 +0200
Message-ID: <20131127080204.GW32436@tarshish>
References: <1385472227-25956-1-git-send-email-linus.walleij@linaro.org>
 <20131127042019.GV32436@tarshish>
 <CACRpkdYqvVD9Z-B5NrGOcH9JoO53DJqEigcNshjffG0ASrLgjw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from guitar.tcltek.co.il ([192.115.133.116]:33275 "EHLO
	mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752406Ab3K0ICI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 27 Nov 2013 03:02:08 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdYqvVD9Z-B5NrGOcH9JoO53DJqEigcNshjffG0ASrLgjw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Haojian Zhuang <haojian.zhuang@linaro.org>

Hi Linus,

(removing Deepak from Cc)

On Wed, Nov 27, 2013 at 08:58:03AM +0100, Linus Walleij wrote:
> On Wed, Nov 27, 2013 at 5:20 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> > On Tue, Nov 26, 2013 at 02:23:47PM +0100, Linus Walleij wrote:
> 
> >> This uses the new API for tagging GPIO lines as in use by
> >> IRQs. This enforces a few semantic checks on how the underlying
> >> GPIO line is used.
> >
> > What is this locking good for if locking is not enforced (i.e. error out)?
> 
> See commit d468bf9ecaabd3bf3a6134e5a369ced82b1d1ca1

OK, then.

Acked-by: Baruch Siach <baruch@tkos.co.il>

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
