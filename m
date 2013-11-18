From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [patch] gpio: rcar: NULL dereference on error in probe()
Date: Mon, 18 Nov 2013 11:45:27 +0100
Message-ID: <CACRpkdai2WdEC-eRiBJ1jDMcMOVcvnN78_yO-VtmyxM4SwWwLw@mail.gmail.com>
References: <20131107075651.GN21844@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:49921 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751061Ab3KRKp1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Nov 2013 05:45:27 -0500
Received: by mail-ob0-f169.google.com with SMTP id wm4so1223610obc.0
        for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2013 02:45:27 -0800 (PST)
In-Reply-To: <20131107075651.GN21844@elgon.mountain>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Magnus Damm <damm@opensource.se>, Grant Likely <grant.likely@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <rob.herring@calxeda.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Nov 7, 2013 at 8:56 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> It's not obvious from the label name but "err1" tries to release
> "p->irq_domain" which leads to a NULL dereference.
>
> Fixes: 119f5e448d32 ('gpio: Renesas R-Car GPIO driver V3')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied for fixes with Magnus' ACK and tagged for stable.

Yours,
Linus Walleij
