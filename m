From: Valentin Rothberg <valentinrothberg@gmail.com>
Subject: lpc18xx: undefined Kconfig option ARCH_LPC18XX
Date: Wed, 6 May 2015 10:02:06 +0200
Message-ID: <CAD3Xx4Kswf+9wbLfuhf=j1fk65QPVj4zmEW0tpUC=yGf56QH7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:38236 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751839AbbEFICi (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 6 May 2015 04:02:38 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: manabian@gmail.com
Cc: linus.walleij@linaro.org, Valentin Rothberg <valentinrothberg@gmail.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, gnurou@gmail.com, Paul Bolle <pebolle@tiscali.nl>, hengelein Stefan <stefan.hengelein@fau.de>, Andreas Ruprecht <andreas.ruprecht@fau.de>

Hi Joachim,

there are two of your commits [1, 2] in today's linux-next (i.e.,
next-20150506).  Both of them add Kconfig options that depend on
ARCH_LPC18XX, which is not defined in Kconfig, see:

+       depends on OF && (ARCH_LPC18XX || COMPILE_TEST)

Is there a patch queued somewhere to add ARCH_LPC18XX ?

I detected this issue with ./scripts/checkkconfigsymbols.py by diffing
yesterday's and todays' linux-next trees.

Kind regards,
 Valentin

[1] 13a43fd9e905 ("gpio: add lpc18xx gpio driver")
[2] 3aba09daf3d4 ("pinctrl: add lpc18xx pinctrl driver")
