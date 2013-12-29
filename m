From: Alexander Shiyan <shc_work@mail.ru>
Subject: Re: [PATCH v2] gpio: Driver for SYSCON-based GPIOs
Date: Sun, 29 Dec 2013 08:44:43 +0400
Message-ID: <20131229084443.f5f13fb807d36de877fbfe0d@mail.ru>
References: <1387307984-7693-1-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from fallback4.mail.ru ([94.100.176.42]:44315 "EHLO
	fallback4.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751770Ab3L2Eo6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 28 Dec 2013 23:44:58 -0500
Received: from smtp51.i.mail.ru (smtp51.i.mail.ru [94.100.177.111])
	by fallback4.mail.ru (mPOP.Fallback_MX) with ESMTP id A234B141828
	for <linux-gpio@vger.kernel.org>; Sun, 29 Dec 2013 08:44:56 +0400 (MSK)
In-Reply-To: <1387307984-7693-1-git-send-email-shc_work@mail.ru>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>

On Tue, 17 Dec 2013 23:19:44 +0400
Alexander Shiyan <shc_work@mail.ru> wrote:

> SYSCON driver was designed for using memory areas (registers)
> that are used in several subsystems. There are systems (CPUs)
> which use bits in one register for various purposes and thus
> should be handled by various kernel subsystems. This driver
> allows you to use the individual SYSCON bits as GPIOs.
> ARM CLPS711X SYSFLG1 input lines has been added as first user
> of this driver.
> 
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> ---

Ping.

-- 
Alexander Shiyan <shc_work@mail.ru>
