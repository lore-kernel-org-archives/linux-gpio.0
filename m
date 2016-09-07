From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] pinctrl: nsp: constify pinctrl_ops and pinmux_ops structures
Date: Wed, 7 Sep 2016 22:41:03 +0200
Message-ID: <CACRpkdZSE=o_qSuBUkTA3FOpunaf7maNsue07L7ZGHyzc4xgMg@mail.gmail.com>
References: <1472755341-9995-1-git-send-email-Julia.Lawall@lip6.fr> <1472755341-9995-3-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:35906 "EHLO
        mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757185AbcIGUlE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Sep 2016 16:41:04 -0400
Received: by mail-oi0-f49.google.com with SMTP id w78so42911076oie.3
        for <linux-gpio@vger.kernel.org>; Wed, 07 Sep 2016 13:41:04 -0700 (PDT)
In-Reply-To: <1472755341-9995-3-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Ray Jui <rjui@broadcom.com>, kernel-janitors@vger.kernel.org, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Sep 1, 2016 at 8:42 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:

> Check for pinctrl_ops and pinmux_ops structures that are only stored in the
> pctlops field and the pmxops field, respectively, of a pinctrl_desc
> structure.  These fields are declared const, so pinctrl_ops and pinmux_ops
> structures that have this property can be declared as const also.

Patch applied.

Yours,
Linus Walleij
