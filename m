From: Bjorn Andersson <bjorn@kryo.se>
Subject: Re: [PATCH v3] pinctrl: msm: move all qualcomm drivers to subdir
Date: Wed, 9 Jul 2014 15:16:24 -0700
Message-ID: <CAJAp7Oi-UH4SUHNw_gHtm=P8EYG3+BsA=hPAsZZWjfG5KCMJeA@mail.gmail.com>
References: <1404910216-2170-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:53540 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755041AbaGIWQY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Jul 2014 18:16:24 -0400
Received: by mail-oa0-f53.google.com with SMTP id l6so8918171oag.40
        for <linux-gpio@vger.kernel.org>; Wed, 09 Jul 2014 15:16:24 -0700 (PDT)
In-Reply-To: <1404910216-2170-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-gpio@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>, "Ivan T. Ivanov" <iivanov@mm-sol.com>

On Wed, Jul 9, 2014 at 5:50 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> We have four Qualcomm-related pin control drivers, and now there
> are drivers coming in for the PMICs on these systems, so let's
> create a qcom subdirectory to hold all the Qualcomm stuff.
>
> Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> Cc: Ivan T. Ivanov <iivanov@mm-sol.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Nice initiative.

Acked-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
