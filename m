From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: remove enable/disable callbacks from documentation
Date: Tue, 10 Mar 2015 08:53:54 +0100
Message-ID: <CACRpkdZ3NhcQ+GP62zeJ2=iv2rTJfaJOeYw1cRr+oPzk6qjfYg@mail.gmail.com>
References: <14c3c3a3ee485c9fdc868b9fab2322bf47963ec0.1425804706.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:44817 "EHLO
	mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751333AbbCJHxz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Mar 2015 03:53:55 -0400
Received: by oifu20 with SMTP id u20so34077446oif.11
        for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2015 00:53:54 -0700 (PDT)
In-Reply-To: <14c3c3a3ee485c9fdc868b9fab2322bf47963ec0.1425804706.git.baruch@tkos.co.il>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Baruch Siach <baruch@tkos.co.il>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sun, Mar 8, 2015 at 9:51 AM, Baruch Siach <baruch@tkos.co.il> wrote:

> Commit 03e9f0cac5d (pinctrl: clean up after enable refactoring) updated the
> documentation to remove mention of disable(), and rename enable() to set_mux().
> One in-text mention was forgotten. Fix this.
>
> Fixes: 03e9f0cac5d ('pinctrl: clean up after enable refactoring')
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Patch applied.

Yours,
Linus Walleij
