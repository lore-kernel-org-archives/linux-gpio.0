From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 5/6] pinctrl: st: Show correct pin direction -- even
 when in GPIO mode
Date: Wed, 25 Mar 2015 16:38:38 +0100
Message-ID: <CACRpkdai4Gtif9vUwGW0xc9qpgkf3O4r0Lmm2aJfeL78h0P=rA@mail.gmail.com>
References: <1426699279-9258-1-git-send-email-lee.jones@linaro.org>
	<1426699279-9258-6-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:33196 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754322AbbCYPij (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Mar 2015 11:38:39 -0400
Received: by obcxo2 with SMTP id xo2so22621547obc.0
        for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2015 08:38:38 -0700 (PDT)
In-Reply-To: <1426699279-9258-6-git-send-email-lee.jones@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel@stlinux.com

On Wed, Mar 18, 2015 at 6:21 PM, Lee Jones <lee.jones@linaro.org> wrote:

> Until now ST's pinconf_dbg_show() call-back has displayed the PIO
> alternate function direction, which is only relevant if a pin is
> operating in an alternate function mode i.e not GPIO mode.  If a
> pin is in GPIO mode its direction is both set and status is
> obtained by a completely different/unrelated bunch of registers.
>
> This change ensures that the correct pin direction is shown, even
> if a pin is operating in GPIO mode.
>
> Reported-by: Olivier Clergeaud <olivier.clergeaud@st.com>
> Acked-by: Maxime Coquelin <maxime.coquelin@st.com>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Patch applied.

Yours,
Linus Walleij
