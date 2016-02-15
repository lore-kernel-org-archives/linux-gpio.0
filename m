From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/4] pinctrl: sh-pfc: More PINMUX_SINGLE() conversions
Date: Mon, 15 Feb 2016 19:26:34 +0100
Message-ID: <CACRpkdZp8n_QMa+X36VNqn4Vueh60nwD4=6HuEWjJvnV4g_KEw@mail.gmail.com>
References: <1448890865-1856-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:33367 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752254AbcBOS0e (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Feb 2016 13:26:34 -0500
Received: by mail-ob0-f175.google.com with SMTP id jq7so39035147obb.0
        for <linux-gpio@vger.kernel.org>; Mon, 15 Feb 2016 10:26:34 -0800 (PST)
In-Reply-To: <1448890865-1856-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Nov 30, 2015 at 2:41 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

>         Hi Laurent, Linus,
>
> This patch series converts pin control data for a few more Renesas SoCs
> to the recently-introduced PINMUX_SINGLE() macro.
> As such this series depends on "[PATCH/RFC 0/4] pinctrl: sh-pfc: Add
> PINMUX_SINGLE()".

Looks good to me (TM)
Please queue them and send with a pull request incl. Laurent's ACKs.

Yours,
Linus Walleij
