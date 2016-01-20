From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: Re: [PATCH] gpio: 104-idio-16: Return IRQ_NONE if all relevant GPIO
 lines are masked
Date: Wed, 20 Jan 2016 13:36:57 -0500
Message-ID: <20160120183657.GA25808@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yk0-f195.google.com ([209.85.160.195]:34002 "EHLO
	mail-yk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752687AbcATShH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Jan 2016 13:37:07 -0500
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Please ignore this patch.

This device cannot differentiate between its own and other devices'
interrupt requests. IRQ should not be shared with this device.

William Breathitt Gray
