From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [RFC v2 1/3] pinctrl: imx: remove const qualifier of imx_pinctrl_soc_info
Date: Thu, 29 Dec 2016 09:23:20 -0200
Message-ID: <CAOMZO5CtZr9ZywDRL4fg2eT4jf0=LVvPmwU4pZ9Wgt28WxiJaw@mail.gmail.com>
References: <20161124233824.17424-1-gary.bisson@boundarydevices.com>
 <20161202163520.22927-1-gary.bisson@boundarydevices.com> <20161202163520.22927-2-gary.bisson@boundarydevices.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:34421 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751113AbcL2LZe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Dec 2016 06:25:34 -0500
In-Reply-To: <20161202163520.22927-2-gary.bisson@boundarydevices.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gary Bisson <gary.bisson@boundarydevices.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>

On Fri, Dec 2, 2016 at 2:35 PM, Gary Bisson
<gary.bisson@boundarydevices.com> wrote:
> Otherwise can't dynamically update fields such as ngroups which can
> change over time (with a dt-overlay for instance).
>
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
