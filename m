From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: two patches for the synposys gpio controller
Date: Thu, 20 Mar 2014 20:55:21 +0100
Message-ID: <1395345324-18299-1-git-send-email-bigeasy@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:45252 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754341AbaCTTzc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Mar 2014 15:55:32 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alan Tull <atull@altera.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@altera.com>

Hi,

I didn't manage to fully test this yet therefore they go out as RFC. Th=
e
list corruption I refer to in irq_setup_generic_chip() real, this is go=
ne.
What I am not sure yet is if the interrupt functionally is still there=E2=
=80=A6

Sebastian

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
