From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH 2/3] gpio: pl061: refactor type setting
Date: Wed, 27 Nov 2013 06:16:33 +0200
Message-ID: <20131127041633.GT32436@tarshish>
References: <1385472238-26001-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from guitar.tcltek.co.il ([192.115.133.116]:33116 "EHLO
	mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753677Ab3K0EQg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 26 Nov 2013 23:16:36 -0500
Content-Disposition: inline
In-Reply-To: <1385472238-26001-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, Deepak Sikri <deepak.sikri@st.com>

Hi Linus,

On Tue, Nov 26, 2013 at 02:23:58PM +0100, Linus Walleij wrote:
> Refactor this function so that I can understand it, do one
> big read/modify/write operation and have the bitmask in a
> variable instead of recalculating it every time it's needed.
> 
> Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
> Cc: Baruch Siach <baruch@tkos.co.il>
> Cc: Deepak Sikri <deepak.sikri@st.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Baruch Siach <baruch@tkos.co.il>

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
