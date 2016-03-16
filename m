From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio/ls1021a: Add gpio support for ls1021a platform
Date: Wed, 16 Mar 2016 11:20:15 +0100
Message-ID: <CACRpkdYxTeM=W8pWQC8iW+ovezpfxvTgLm=JSn5bGqp7AJZipg@mail.gmail.com>
References: <1457600240-47141-1-git-send-email-Gang.Liu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:35253 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966040AbcCPKUP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Mar 2016 06:20:15 -0400
Received: by mail-oi0-f46.google.com with SMTP id c203so34760484oia.2
        for <linux-gpio@vger.kernel.org>; Wed, 16 Mar 2016 03:20:15 -0700 (PDT)
In-Reply-To: <1457600240-47141-1-git-send-email-Gang.Liu@nxp.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Liu Gang <Gang.Liu@nxp.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kevin Hilman <khilman@linaro.org>, Rob Herring <robh+dt@kernel.org>, scott.wood@nxp.com, Leo.Li@nxp.com, mingkai.hu@nxp.com

On Thu, Mar 10, 2016 at 9:57 AM, Liu Gang <Gang.Liu@nxp.com> wrote:

> Add gpio nodes for ls1021a platform dts file. The gpio
> IP block of the ls1021a can be supported by the code
> drivers/gpio/gpio-mpc8xxx.c.
>
> Signed-off-by: Liu Gang <Gang.Liu@nxp.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
