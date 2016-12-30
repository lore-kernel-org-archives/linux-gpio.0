From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC v2 1/3] pinctrl: imx: remove const qualifier of imx_pinctrl_soc_info
Date: Fri, 30 Dec 2016 14:23:03 +0100
Message-ID: <CACRpkdbE1dYWB38fJdkgXRBV2DQyryEuTiF=zoZgh=zh_Mxoeg@mail.gmail.com>
References: <20161124233824.17424-1-gary.bisson@boundarydevices.com>
 <20161202163520.22927-1-gary.bisson@boundarydevices.com> <20161202163520.22927-2-gary.bisson@boundarydevices.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f178.google.com ([209.85.220.178]:35051 "EHLO
        mail-qk0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753696AbcL3NXE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Dec 2016 08:23:04 -0500
Received: by mail-qk0-f178.google.com with SMTP id u25so286275727qki.2
        for <linux-gpio@vger.kernel.org>; Fri, 30 Dec 2016 05:23:04 -0800 (PST)
In-Reply-To: <20161202163520.22927-2-gary.bisson@boundarydevices.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gary Bisson <gary.bisson@boundarydevices.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>

On Fri, Dec 2, 2016 at 5:35 PM, Gary Bisson
<gary.bisson@boundarydevices.com> wrote:

> Otherwise can't dynamically update fields such as ngroups which can
> change over time (with a dt-overlay for instance).
>
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>

Patch applied with Fabio's review tag.

Yours,
Linus Walleij
