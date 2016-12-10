From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH V1] pinctrl:pxa:pinctrl-pxa2xx:- No need of devm functions
Date: Sat, 10 Dec 2016 10:19:07 +0100
Message-ID: <87eg1g16r8.fsf@belgarion.home>
References: <1481207730-6332-1-git-send-email-arvind.yadav.cs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:42389 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751388AbcLJJTR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 10 Dec 2016 04:19:17 -0500
In-Reply-To: <1481207730-6332-1-git-send-email-arvind.yadav.cs@gmail.com>
        (Arvind Yadav's message of "Thu, 8 Dec 2016 20:05:30 +0530")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: daniel@zonque.org, haojian.zhuang@gmail.com, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Arvind Yadav <arvind.yadav.cs@gmail.com> writes:

Hi Arvind,

> In functions pxa2xx_build_functions, the memory allocated for
> 'functions' is live within the function only. After the
> allocation it is immediately freed with devm_kfree. There is
> no need to allocate memory for 'functions' with devm function
> so replace devm_kcalloc  with kcalloc and devm_kfree with kfree.

That's not very true : the "need" is to spare the "manual" kfree you're adding
in your patch for one, and make it consistent with pxa2xx_build_groups() and
pxa2xx_build_state() for two.

Therefore I'm not very thrilled by this patch and unless it fixes a defect in
the driver I'd rather not have it in.

Cheers.

--
Robert
