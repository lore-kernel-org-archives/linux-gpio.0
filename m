Return-Path: <SRS0=pKPn=DO=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70CEAC4363D
	for <linux-gpio@archiver.kernel.org>; Wed,  7 Oct 2020 12:09:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 35C44206A1
	for <linux-gpio@archiver.kernel.org>; Wed,  7 Oct 2020 12:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602072577;
	bh=svwLuI3ftJyxkOSAbrlX92yzVeoZDHveLEVuxgFyL80=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=TkjmpkL+/7fvE2LqvRU0WffbawkyZU6FkfAyToSl03KaUllEDBro66qb6DTR1Z8+Z
	 LBGbWOkDIYFSOj5qwZBpOc4do9t8FfO/Re7e2drESaBv7QC4ocyu78UrorbVpzgB8F
	 BzPS5eWaxmTn5fciT4R20ciWBwubhp0KmRtW6ShU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728037AbgJGMJg (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 7 Oct 2020 08:09:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:39870 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728008AbgJGMJg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 7 Oct 2020 08:09:36 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 84BCB206A1;
        Wed,  7 Oct 2020 12:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602072575;
        bh=svwLuI3ftJyxkOSAbrlX92yzVeoZDHveLEVuxgFyL80=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Qd8tOqzGzQU3zyau3RibXuEcAgwdUPLk9YyaPuJha5XoSaotf3WNAoyIEBM68edXD
         PPd2RvyOJ7OIgXYgoWXw/bOARS9DfEyN4pz+TylwSchAHLkOpqVYbmGjil9ymb4UAo
         Dfh84VSKfNpNt5icqvP3brRXkkaDUgAkht4BRlm4=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kQ8GD-000LWr-FR; Wed, 07 Oct 2020 13:09:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 07 Oct 2020 13:09:33 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        kernel-team@android.com
Subject: Re: [PATCH] gpio: pca953x: Survive spurious interrupts
In-Reply-To: <CAHp75Vdb3y_r_+Mq8K=Jog21wiFH54F18ED8eBwT4rM_zxcCUA@mail.gmail.com>
References: <20201005140217.1390851-1-maz@kernel.org>
 <CACRpkdbctO9cWZZhVQHWkA1DN7YRTsLRo4Ub9g2x7q6BBSD=Ug@mail.gmail.com>
 <CAHp75Vdb3y_r_+Mq8K=Jog21wiFH54F18ED8eBwT4rM_zxcCUA@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <0175d3ce84ea0aa938a3ce9b3731762e@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: andy.shevchenko@gmail.com, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, bgolaszewski@baylibre.com, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2020-10-07 13:02, Andy Shevchenko wrote:
> On Wed, Oct 7, 2020 at 12:49 PM Linus Walleij 
> <linus.walleij@linaro.org> wrote:
>> 
>> On Mon, Oct 5, 2020 at 4:02 PM Marc Zyngier <maz@kernel.org> wrote:
>> 
>> > The pca953x driver never checks the result of irq_find_mapping(),
>> > which returns 0 when no mapping is found. When a spurious interrupt
>> > is delivered (which can happen under obscure circumstances), the
>> > kernel explodes as it still tries to handle the error code as
>> > a real interrupt.
>> >
>> > Handle this particular case and warn on spurious interrupts.
>> >
>> > Signed-off-by: Marc Zyngier <maz@kernel.org>
> 
> Wait, doesn't actually [1]  fix the reported issue?

Not at all.

> Marc, can you confirm this?
> 
> [1]: e43c26e12dd4 ("gpio: pca953x: Fix uninitialized pending variable")

Different bug, really. If an interrupt is *really* pending, and no
mapping established yet, feeding the result of irq_find_mapping() to
handle_nested_irq() will lead to a panic.

Recently seen on a Tegra system suffering from even more pathological 
bugs.

         M.
-- 
Jazz is not dead. It just smells funny...
