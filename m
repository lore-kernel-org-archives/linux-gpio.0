From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: fix example .get_group_pins implementation signature
Date: Tue, 17 Mar 2015 13:25:29 +0100
Message-ID: <CACRpkdaVTH-HS3FWw8_nyC9+8MHaF8EfWSBKHqdod6Ekc7dGpg@mail.gmail.com>
References: <209335cc0e7fecceb3ff8ffbae65550cd0776812.1425921630.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:34677 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752631AbbCQMZa (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Mar 2015 08:25:30 -0400
Received: by obbgg8 with SMTP id gg8so5642718obb.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2015 05:25:29 -0700 (PDT)
In-Reply-To: <209335cc0e7fecceb3ff8ffbae65550cd0776812.1425921630.git.baruch@tkos.co.il>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Baruch Siach <baruch@tkos.co.il>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>

On Mon, Mar 9, 2015 at 6:20 PM, Baruch Siach <baruch@tkos.co.il> wrote:

> The callback function signature has changed in commit a5818a8bd0 (pinctrl:
> get_group_pins() const fixes)
>
> Fixes: a5818a8bd0 ('pinctrl: get_group_pins() const fixes')
> Cc: Stephen Warren <swarren@nvidia.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Patch applied.

Yours,
Linus Walleij
