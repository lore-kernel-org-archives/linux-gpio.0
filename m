From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/6] pinctrl: st: Move st_get_pio_control() further up
 the source file
Date: Wed, 25 Mar 2015 16:36:31 +0100
Message-ID: <CACRpkdYOOQBmdJ0XFj_P4FX3wh+Civ8N9dcbNfz2BSWUEg9NRA@mail.gmail.com>
References: <1426699279-9258-1-git-send-email-lee.jones@linaro.org>
	<1426699279-9258-4-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:34061 "EHLO
	mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753269AbbCYPgb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Mar 2015 11:36:31 -0400
Received: by oier21 with SMTP id r21so24676234oie.1
        for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2015 08:36:31 -0700 (PDT)
In-Reply-To: <1426699279-9258-4-git-send-email-lee.jones@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel@stlinux.com

On Wed, Mar 18, 2015 at 6:21 PM, Lee Jones <lee.jones@linaro.org> wrote:

> st_get_pio_control() will be used by subsequent calls which are
> to be located above its original position.  This is required to
> prevent the need for an unnecessary forward-declaration/prototype.
>
> Acked-by: Maxime Coquelin <maxime.coquelin@st.com>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Patch applied.

Yours,
Linus Walleij
