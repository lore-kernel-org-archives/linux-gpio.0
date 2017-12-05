From: Nadav Amit <namit@vmware.com>
Subject: gpio: wrong rounding in gpio-menz127
Date: Tue, 5 Dec 2017 04:00:19 +0000
Message-ID: <313BA467-56A9-43BD-93E0-F61142A5F3C7@vmware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-dm3nam03on0073.outbound.protection.outlook.com ([104.47.41.73]:49600
        "EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751756AbdLEEAW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 4 Dec 2017 23:00:22 -0500
Content-Language: en-US
Content-ID: <F0D2A663A62ABA408FF0B73D6DA69404@namprd05.prod.outlook.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "andy@wernerandy.de" <andy@wernerandy.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>

Hello Andy,

It seems that the use of round_up() and round_down() in men_z127_debounce()
is incorrect since the alignment, i.e., MEN_Z127_DB_MIN_US, is not a power
of two.

You may want to fix it.

Regards,
Nadav
