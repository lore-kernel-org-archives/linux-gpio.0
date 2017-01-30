From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] Pinctrl : berlin - Fix possible NULL derefrence.
Date: Mon, 30 Jan 2017 15:55:48 +0100
Message-ID: <CACRpkdYkNP0Wo70Fw+hiDzBe=O2g=iB5ZBMWcY6i+cEMr57WsQ@mail.gmail.com>
References: <CGME20170127111027epcas4p2218cc1e0f62b5312eda5e1ccf667cc31@epcas4p2.samsung.com>
 <1485515418-3006-1-git-send-email-shailendra.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f42.google.com ([209.85.214.42]:37843 "EHLO
        mail-it0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753702AbdA3P27 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2017 10:28:59 -0500
Received: by mail-it0-f42.google.com with SMTP id r185so103656773ita.0
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2017 07:28:57 -0800 (PST)
In-Reply-To: <1485515418-3006-1-git-send-email-shailendra.v@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Shailendra Verma <shailendra.v@samsung.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, p.shailesh@samsung.com, ashish.kalra@samsung.com, vidushi.koul@samsung.com, Shailendra Verma <shailendra.capricorn@gmail.com>

On Fri, Jan 27, 2017 at 12:10 PM, Shailendra Verma
<shailendra.v@samsung.com> wrote:

> of_match_device could return NULL, and so can cause a NULL
> pointer dereference later.
>
> Signed-off-by: Shailendra Verma <shailendra.v@samsung.com>

Patch applied.

Yours,
Linus Walleij
