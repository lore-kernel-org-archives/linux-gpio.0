From: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [PATCH 7/8] gpio/mpc8xxx: Convert to platform device interface.
Date: Mon, 19 Jan 2015 23:36:59 +0100
Message-ID: <87oapu9z3o.fsf@dell.be.48ers.dk>
References: <1421581173-28416-1-git-send-email-ricardo.ribalda@gmail.com>
	<1421581173-28416-8-git-send-email-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f46.google.com ([74.125.82.46]:65351 "EHLO
	mail-wg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751836AbbASWhE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jan 2015 17:37:04 -0500
In-Reply-To: <1421581173-28416-8-git-send-email-ricardo.ribalda@gmail.com>
	(Ricardo Ribalda Delgado's message of "Sun, 18 Jan 2015 12:39:32
	+0100")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Peter Korsgaard <jacmet@sunsite.dk>, devicetree@vger.kernel.org

>>>>> "Ricardo" == Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> writes:

 > This way we do not need to transverse the device tree manually.
 > Cc: Linus Walleij <linus.walleij@linaro.org>
 > Cc: Alexandre Courbot <gnurou@gmail.com>
 > Cc: Grant Likely <grant.likely@linaro.org>
 > Cc: Rob Herring <robh+dt@kernel.org>
 > Cc: Peter Korsgaard <jacmet@sunsite.dk>
 > Cc: devicetree@vger.kernel.org
 > Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

Looks sensible.

Acked-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard
