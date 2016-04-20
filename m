From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/8] mfd: stmpe: Add STMPE_IDX_SYS_CTRL/2 enum
Date: Wed, 20 Apr 2016 16:32:37 +0200
Message-ID: <CACRpkdafbxV-0doYYO-nbVHc_mcYFfu_OS02rpg8cBwMokgahQ@mail.gmail.com>
References: <1461068317-28016-1-git-send-email-patrice.chotard@st.com>
	<1461068317-28016-2-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:33439 "EHLO
	mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754571AbcDTOci (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Apr 2016 10:32:38 -0400
Received: by mail-oi0-f42.google.com with SMTP id r78so42107474oie.0
        for <linux-gpio@vger.kernel.org>; Wed, 20 Apr 2016 07:32:38 -0700 (PDT)
In-Reply-To: <1461068317-28016-2-git-send-email-patrice.chotard@st.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Patrice CHOTARD <patrice.chotard@st.com>
Cc: Lee Jones <lee.jones@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Maxime Coquelin <maxime.coquelin@st.com>, amelie.delaunay@st.com, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Dinh Nguyen <dinguyen@opensource.altera.com>, Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>

On Tue, Apr 19, 2016 at 2:18 PM,  <patrice.chotard@st.com> wrote:

> From: Patrice Chotard <patrice.chotard@st.com>
>
> As STMPE1801/1601/24xx has a SYS_CTRL register and
> STMPE1601/2403 has even a SYS_CTRL2 register, add
> STMPE_IDX_SYS_CTRL/2 and update driver code accordingly
>
> This update prepares the ground for not yet supported STMPE1600
> which share similar REG_SYS_CTRL register.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

Looks reasonable:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
