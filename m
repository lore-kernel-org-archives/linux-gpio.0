From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: remove maxpin from documentation
Date: Mon, 9 Mar 2015 12:21:10 +0100
Message-ID: <CACRpkdYBrgY9=H-BUdd55OMKXzXGJnJqLdiC-OaHB5S7qWHU1Q@mail.gmail.com>
References: <61439260263299de5969469fac565051db478bdb.1425308102.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:38622 "EHLO
	mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750968AbbCILVL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Mar 2015 07:21:11 -0400
Received: by oiax69 with SMTP id x69so28539470oia.5
        for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2015 04:21:10 -0700 (PDT)
In-Reply-To: <61439260263299de5969469fac565051db478bdb.1425308102.git.baruch@tkos.co.il>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Baruch Siach <baruch@tkos.co.il>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Mar 2, 2015 at 3:55 PM, Baruch Siach <baruch@tkos.co.il> wrote:

> struct pinctrl_desc does not contain the maxpin member since commit 0d2006bbf0
> (pinctrl: remove unnecessary max pin number).
>
> Fixes: 0d2006bbf0 ('pinctrl: remove unnecessary max pin number')
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Patch applied.

Yours,
Linus Walleij
