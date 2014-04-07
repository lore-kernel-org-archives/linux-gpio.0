From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: patches for the synopsys gpio controller, rount 3
Date: Mon,  7 Apr 2014 12:13:04 +0200
Message-ID: <1396865589-9972-1-git-send-email-bigeasy@linutronix.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:50054 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754519AbaDGKNY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Apr 2014 06:13:24 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: jamie@jamieiles.com
Cc: atull@altera.com, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, dinguyen@altera.com, linus.walleij@linaro.org, sebastian.hesselbarth@gmail.com

Hi,

my queue, updated with latest comments I recevied.
#1 fixes a list corruption bug
#4 enabled mixed edge/level user

the dts changes are not part of the series as I believe that they have
been already picked up by the maintainer(s).

Sebastian

