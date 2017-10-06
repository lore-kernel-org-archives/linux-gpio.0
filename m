From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 3/3] pinctrl: sunxi: Enforce the strict mode by default
Date: Fri, 6 Oct 2017 16:34:26 +0800
Message-ID: <CAGb2v64FwRnthfP=OrxUp92oAtozzo6BEAOFbn8pMg5gXUpWjQ@mail.gmail.com>
References: <cover.7a61d0bb31530def29efd8b4286d8c0afdaab347.1507236823.git-series.maxime.ripard@free-electrons.com>
 <817a66704d6c8f3caa034a526db11e25a9152a65.1507236823.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.csie.ntu.edu.tw ([140.112.30.61]:33668 "EHLO
        smtp.csie.ntu.edu.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751694AbdJFIew (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Oct 2017 04:34:52 -0400
In-Reply-To: <817a66704d6c8f3caa034a526db11e25a9152a65.1507236823.git-series.maxime.ripard@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Oct 6, 2017 at 4:54 AM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> The strict mode should always have been enabled on our driver, and leaving
> it unchecked just makes it harder to find a migration path as time passes.
>
> Let's enable it by default now so that hopefully the new SoCs should be
> safe.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>
