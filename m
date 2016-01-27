From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: mvebu: add 98dx1135-pinctrl
Date: Wed, 27 Jan 2016 14:10:08 +0100
Message-ID: <CACRpkdbNPOCNLA+XgQ=J-z2PyTuh+2=uLBjhYoJix2cXsA_a2Q@mail.gmail.com>
References: <1449794673-9461-1-git-send-email-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:32786 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754487AbcA0NKI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2016 08:10:08 -0500
Received: by mail-ob0-f180.google.com with SMTP id is5so6481266obc.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jan 2016 05:10:08 -0800 (PST)
In-Reply-To: <1449794673-9461-1-git-send-email-chris.packham@alliedtelesis.co.nz>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Maxime Coquelin <maxime.coquelin@st.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Patrice CHOTARD <patrice.chotard@st.com>, Fabian Frederick <fabf@skynet.be>, valentin.longchamp@keymile.com

Sebastian, Thomas:

On Fri, Dec 11, 2015 at 1:44 AM, Chris Packham
<chris.packham@alliedtelesis.co.nz> wrote:

> The Marvell 98DX1135 is a switch chip with an integrated CPU,
> similar to the MV98DX4122. From a pinctrl point of view the only
> difference is that NF_REN, NF_WEN, NF_ALE and NF_CEN lines are
> MPP pins instead of dedicated ones.
>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

I guess this patch falls in your territory, please look at it if you can.

If you don't have it, ask Chris to resend it.

I suspect the patch needs to be rebased anyway.

Yours,
Linus Walleij
