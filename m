From: Ian Molton <ian.molton@codethink.co.uk>
Subject: (unknown)
Date: Mon,  2 Sep 2013 16:44:54 +0100
Message-ID: <1378136695-23203-1-git-send-email-ian.molton@codethink.co.uk>
References: <CACRpkdbeCU_WG4xXvoh76RZ-9UtbWJvB4PqYhSpTXSF4Hodf2A@mail.gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from ducie-dc1.codethink.co.uk ([37.128.190.40]:40207 "EHLO
	ducie-dc1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756122Ab3IBPwj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Sep 2013 11:52:39 -0400
Subject: 
In-Reply-To: <CACRpkdbeCU_WG4xXvoh76RZ-9UtbWJvB4PqYhSpTXSF4Hodf2A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: horms@verge.net.au, linux-gpio@vger.kernel.org

Patch updated to depend on OF_GPIO as suggested. The only other driver using
OF_GPIO depends, rather than selects the symbol, so I have also.

-Ian

