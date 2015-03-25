From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/6] pinctrl: st: Introduce a 'get pin function' call
Date: Wed, 25 Mar 2015 16:35:36 +0100
Message-ID: <CACRpkdaOtY7QxnkKLbbsG6hJ+Hrs61PdrP596AD768oUNT4L4w@mail.gmail.com>
References: <1426699279-9258-1-git-send-email-lee.jones@linaro.org>
	<1426699279-9258-3-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:35067 "EHLO
	mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750717AbbCYPfg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Mar 2015 11:35:36 -0400
Received: by oiag65 with SMTP id g65so24565585oia.2
        for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2015 08:35:36 -0700 (PDT)
In-Reply-To: <1426699279-9258-3-git-send-email-lee.jones@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel@stlinux.com

On Wed, Mar 18, 2015 at 6:21 PM, Lee Jones <lee.jones@linaro.org> wrote:

> This call fetches the numerical function value a specified pin is
> currently operating in.  Function zero is more often than not the
> GPIO function.  Greater than zero values represent an alternative
> function.  You'd need to either look those up in the Device Tree
> sources or the Programmer's Manual.
>
> Acked-by: Maxime Coquelin <maxime.coquelin@st.com>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Patch applied.

Yours,
Linus Walleij
