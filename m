From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: Re: [PATCH 00/54] GPIO: clamp return values from drivers
Date: Tue, 22 Dec 2015 17:06:19 +0200
Message-ID: <567966EB.8060900@mentor.com>
References: <1450793312-21725-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:57371 "EHLO
	relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751370AbbLVPHn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 10:07:43 -0500
In-Reply-To: <1450793312-21725-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, =?UTF-8?Q?Bj=c3=b6rn_Andersson?= <bjorn.andersson@sonymobile.com>, Johan Hovold <johan@kernel.org>, Michael Trimarchi <michael@amarulasolutions.com>

Hi Linus,

On 22.12.2015 16:08, Linus Walleij wrote:
> It was recently discovered that a bunch of GPIO drivers were not
> clamping their return values from the .get() function to [0,1].
> Some did. Some did and returned a proper errorcode, for example
> for GPIOs on slow buses. Some returned the bit set in some register,
> so GPIO at offset 0 would return 0/1 but offset 2 would return
> 0/4 and expect the core to clamp it. Which it used to do, until we
> decided to propagate error codes. Which we shouldn't have, before
> going over all drivers to check if they were doing this "return
> something other than zero and expect it to be treated as asserted"
> business.
> 
> Usually it was all OK because the gpiolib core did this:
> 
> value = value < 0 ? value : !!value;
> 
> So the only time the error pops out is when a 32bit machine expect
> something greater than 2^31 to be interpreted as asserted. This is
> typically the case when a 32bit register contains 32 GPIOs, bit 31
> is a GPIO line and is read: then that is seen as a negative
> value and propagated as an error code, so all other cases including
> the 31 first GPIOs work fine. That is why the error is not so
> prominent, and took some time to detect.
> 
> Anyway, this series fixes all drivers in the kernel.
> 
> Merge tactic: I will merge the GPIO and pinctrl subsystem changes
> for v4.5, returning the propagation of the error code.
> 
> Subsystem maintainers may merge this as a fix for their v4.5 trees
> or ACK them so that I can merge them. In the next kernel cycle
> for v4.6 I will take a sweep and merge remaining fixes.
> 

thank you for this work. Please consider to add to the pile one more
change.

With best holiday wishes,
Vladimir

---

>From a19047b2131f73cdf494abd44d76de6f57ca81ff Mon Sep 17 00:00:00 2001
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Date: Tue, 22 Dec 2015 16:37:28 +0200
Subject: [PATCH] gpio: update gpiochip .get() callback description

Since gpiochip .get() callback may return a negative error value, it
strictly limits the range of possible non-error returned values to
a subset of [30:0] bitmask, however on practice on success all
gpiochip drivers return either 0 for low signal or 1 for high signal,
this is assured by "gpio: *: Be sure to clamp return value" series of
changes. To avoid any confusion, misinterpretation and potential
errors while developing gpiochip drivers in future convert this
implicit assumption to a mandatory rule.

For output signals with unknown output signal state gpiochip drivers
should return a negative error instead of 0.

Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
---
 include/linux/gpio/driver.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index b02c43b..9907975 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -32,8 +32,7 @@ struct seq_file;
  *	(same as GPIOF_DIR_XXX), or negative error
  * @direction_input: configures signal "offset" as input, or returns error
  * @direction_output: configures signal "offset" as output, or returns error
- * @get: returns value for signal "offset"; for output signals this
- *	returns either the value actually sensed, or zero
+ * @get: returns value for signal "offset", 0=low, 1=high, or negative error
  * @set: assigns output value for signal "offset"
  * @set_multiple: assigns output values for multiple signals defined by "mask"
  * @set_debounce: optional hook for setting debounce time for specified gpio in
-- 
2.5.0


