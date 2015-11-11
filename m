From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: Gpio exporting oopses sometimes
Date: Wed, 11 Nov 2015 13:11:56 +0100
Message-ID: <87a8qkag6r.fsf@belgarion.home>
References: <87egfwakzh.fsf@belgarion.home>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp09.smtpout.orange.fr ([80.12.242.131]:58788 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752133AbbKKMS4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2015 07:18:56 -0500
In-Reply-To: <87egfwakzh.fsf@belgarion.home> (Robert Jarzmik's message of
	"Wed, 11 Nov 2015 11:28:18 +0100")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

Robert Jarzmik <robert.jarzmik@free.fr> writes:

> Hi Linux and Alexandre,
First, it's Linus, I'm sorry for that.

Second, it was a collateral issue of a bug in my code, which triggered a
corruption in the gpio_chip structure, sorry for the noise.

Cheers.

--
Robert
