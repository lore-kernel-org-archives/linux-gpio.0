From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 10/17] pinctrl: Add PLX Technology OXNAS pinctrl and gpio driver
Date: Thu, 17 Mar 2016 15:49:58 +0100
Message-ID: <CACRpkdbWZDpM5ctNkU5cRasaATjkoa_zrg_-xgnTpbYRZK2pXw@mail.gmail.com>
References: <1457005210-18485-1-git-send-email-narmstrong@baylibre.com>
	<1457005210-18485-11-git-send-email-narmstrong@baylibre.com>
	<CACRpkdby7XmbK2ZpwX3zy5J=yr1HRbmfWVab3K0ArcL6wd=oyA@mail.gmail.com>
	<56E9750B.2000800@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:36705 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753304AbcCQOt7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Mar 2016 10:49:59 -0400
Received: by mail-ob0-f180.google.com with SMTP id m7so85782201obh.3
        for <linux-gpio@vger.kernel.org>; Thu, 17 Mar 2016 07:49:58 -0700 (PDT)
In-Reply-To: <56E9750B.2000800@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Ma Haijun <mahaijuns@gmail.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>

On Wed, Mar 16, 2016 at 4:00 PM, Neil Armstrong <narmstrong@baylibre.com> wrote:

> I think I'll reboot over a clean base, could you give a reference driver I should follow ?
> It's a very simple HW, it should be easy.

I would look at those merged lately, which has pin control
combined with GPIO and interrupts.

drivers/pinctrl/qcom is good but supports quite a lot of
subvariants so it may be hard to see what parts you really
need. But I think of those as a very nice drivers.

Yours,
Linus Walleij
