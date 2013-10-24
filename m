From: David Cohen <david.a.cohen@linux.intel.com>
Subject: question: pin mux & gpio
Date: Wed, 23 Oct 2013 18:28:16 -0700
Message-ID: <526877B0.1090602@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:25597 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752407Ab3JXB3w (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 23 Oct 2013 21:29:52 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>

Hi,

I've got a question WRT pin muxing.
gpio-intel-mid registers are responsible to set alternative functions
to some pins. Despite pin mux is not directly related to gpio in
general, in this case it is.

Is there any other gpio driver doing this same task? Or maybe
suggestion about how to handle it?

Br, David Cohen
