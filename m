Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792705993;
	b=gibSnrp6R0268dgNpLQ9M6kwYhY3KN1Z8tMxdrwUmZIwKQRwCUPSWQIZJaUvMw5t2h7q
	 BX/Vy5FUV7tbe+2KcSf7Q5+hoSMfEiPqSWVi4ImyO+CaZ+fgnODCbGQC3rTALcBc3D9Ke
	 3m3HRasF0z7uSPrQlYR7W6ha9saH0X95WHnH2qbeAX72ezNtKp4mvz6P7Yf88TrEJYDpm
	 ZC/Lyj3Vxj/eI+xa8ZtH0B1enMlp2BUjYdT8vW/cqa2sSTEl3VaLS5uGNJQsDjTp535EE
	 Bo/0974iWfzpMkoRKOZuiVJ2iV+Je319/hS25IYQh204cD0tVtJiR/ot1qkVxgi64zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792705993;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=CwMasHWWZQdA6V/N7J7qBaQwHlTPrnDjpuHBBTYGf+Q=;
	b=5PaeYou0A/stKzO228U9LeRgmBUlpAUjH1K84KEJ2E0A6Fp/Ic0SxSQZxTBN36AxZMrp
	 +9PNt9+8atekTBVkIImLGspk+7pgAkGYi8hfRB+mnty/uasD8MTss5ZErVeZxhLp4NwAs
	 77t/n2rCc53IvpG3qLzTt7CNAICNGAA59TdDQCA0DaBTihOnQwRsVLBl+ECYlcTDxBNpE
	 wCEXVByUEJEbwMPufMuTJD4QhIQv9nSd4M1S6Et2iX+TktQUT+F98WsBYNUIqtSX8hxde
	 3Bv17Ev/lpVJHyIt0AizhnTloN7EinDMVV1EE0VPIoph4Ti75LQx4CQpjG4tbntu2Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Jfwzazsz;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F199606A32A
	for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2026 21:53:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F199606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Jfwzazsz
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-18cdcfc05ffso289457c88.1
        for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2026 14:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792705992; x=1793310792; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CwMasHWWZQdA6V/N7J7qBaQwHlTPrnDjpuHBBTYGf+Q=;
        b=JfwzazszamKe4qO5iC4hGrwz2++kYlTz1xvag3d3AdixVtd3xSX6fYQgRN+F/NVk6c
         slUiVDXTdhHi/vRySXQ1+w5E9qUwsyzDjMdF1TvtM/4SA37A1HmJmyXWZ9iea2CtZdhj
         N8QHHoAU8u2GcQwlWs9WaQJUB52GUMhfOkG7Ru5B9he4YxEImKkOKnfMHRwMQlfrnFHT
         2uAuiRlXFUz+m8T4IbIzlN7amaH4I7LNY7Z+Air84IwNSq1iQPMjwi843wvLyuTGhrF0
         wRakwLNq2WxkpdDo68LfhXUqslyM2YzOKt1jNiEhlWRMp7p58vLPV3BqMDlVeruKB7SF
         VHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792705992; x=1793310792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CwMasHWWZQdA6V/N7J7qBaQwHlTPrnDjpuHBBTYGf+Q=;
        b=xrUC/PpJAaGKt9yk3k+V7IbBfMX8Ea9fJZYxXhnj/qgk0UxTnZ/M1gTNlRRgKryd0b
         B9pcKqtUgO7q5CGh0VjdL7ehwvTox00bme0rFcyD0Rv8/6jBLHWwwTft2ZVJSpwUNeuk
         U+uIzt8pyr99ZEs4I/YceSyk5+LktfwMMQE6a9pGlLPtLSC91sawYm4YcuqR6vLMi/zH
         IScdBWq9QoKiNosJUuiwJuxvfnMw7GhlABHK4wqPaCxFDoNLRqz22unfKVAh3ofP5Pur
         49nfQ5kJrmLZzvjQx8Kl21xAmkrkSVw6fi3dSvuhfYZNHJE2emV3juR31vldASGCPzYg
         Bb4w==
X-Gm-Message-State: AFq9FYLIY0IFn9gTypNbR09j7SxRhW2u5NAhpl8yjgfANo0p/X85EC9g
	a7nnlPRH4hSaa5q+gYRoNsp9hpiq0xl7Qua/eNHNVPUrBdIuZ2Th7hMvAybtZg==
X-Gm-Gg: AYBFou1ZEWHES+LzqLc22RNO8AB+hkx9oMIzNlvM293ShKjjS9uoXfkgOlIm+Z/yX/N
	ixopqYMo3f7KSPVxngtpYgZxjrrsegTqdYgg7Fk2rQ3wT4AMCPcPnjkF4k8b7vSajs3isuTZ8MR
	Yc+KW2SvANlg8Ibkhu2G5owXcHRyb1hO/2VB3RPNwXgrfo/IRHf0fI+l+ZPx65qeDo8YRl+Vi7b
	a6hdW23Rbbd2JVSrbBjzg27kslxfKc4/J9jhsp7c+lWAF6SYPUaO1i9uUGd4uhBwcuQFiQ1Epor
	7vmk2fe8raI6FcKof+sKHWTHIWF4HCeeFZ37BN+wXkpYSPfTMWndhQKd9+wCTLf1pLAuigZJDC4
	LQgrqPmj4/iK7du1W8uzeeU+WqsD9hnIGbP57cN+xVM78Iqo/VxVI4tMUKz20HAFOT7+cZPJO/K
	6PMFDjEAUiT3qLvYsL6+ExjnVj7moo+T9vcKQCSmLYHOzeD98HOulkI0QRrvEv7gLT58IkmoHcd
	L+ZB0CNLKvNwmozYf+kEICWnKOJ/tvT3TjahrVCbppg5OiWMV4ATu/c+8eAc4c8p13ea8IwKRxC
	k0OjJjcs3yN9hLgDhmNpSg1/mEyz0k6juEZ5GIzzDGp0
X-Received: by 2002:a05:701b:420a:20b0:182:23da:b566 with SMTP id a92af1059eb24-195c44b9d7dmr639283c88.8.1792705992194;
        Thu, 22 Oct 2026 14:53:12 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f2d1:b7cb:a745:829f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195ec82eabfsm1110403c88.19.2026.10.22.14.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 14:53:11 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 22 Oct 2026 14:52:48 -0700
Subject: [PATCH v3 4/5] gpiolib: of: clean up formatting to pass checkpatch
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-gpiolib-of-v3-4-42c3b6439fba@gmail.com>
References: <20261022-gpiolib-of-v3-0-42c3b6439fba@gmail.com>
In-Reply-To: <20261022-gpiolib-of-v3-0-42c3b6439fba@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Clean up parameter alignment, line wrapping, and parenthesis formatting
in drivers/gpio/gpiolib-of.c to make the module pass checkpatch --strict
without warnings or checks. This helps when one has checkpatch
configured as a linter for their editor.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib-of.c | 46 ++++++++++++++++++++--------------------------
 1 file changed, 20 insertions(+), 26 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 424c02f81c20..e741a4f218f4 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -135,8 +135,8 @@ of_find_gpio_device_by_xlate(const struct of_phandle_args *gpiospec)
 }
 
 static struct gpio_desc *of_xlate_and_get_gpiod_flags(struct gpio_chip *chip,
-					struct of_phandle_args *gpiospec,
-					enum of_gpio_flags *flags)
+						      struct of_phandle_args *gpiospec,
+						      enum of_gpio_flags *flags)
 {
 	int ret;
 
@@ -333,7 +333,7 @@ static void of_gpio_set_polarity_by_property(const struct device_node *np,
 		if (of_device_is_compatible(np_compat, gpios[i].compatible) &&
 		    !strcmp(propname, gpios[i].gpio_propname)) {
 			active_high = of_property_read_bool(np_propname,
-						gpios[i].polarity_propname);
+							    gpios[i].polarity_propname);
 			of_gpio_quirk_polarity(np, active_high, flags);
 			break;
 		}
@@ -415,7 +415,8 @@ static void of_gpio_flags_quirks(const struct device_node *np,
  * in flags for the GPIO.
  */
 static struct gpio_desc *of_get_named_gpiod_flags(const struct device_node *np,
-		     const char *propname, int index, enum of_gpio_flags *flags)
+						  const char *propname, int index,
+						  enum of_gpio_flags *flags)
 {
 	struct of_phandle_args gpiospec;
 	struct gpio_desc *desc;
@@ -425,7 +426,7 @@ static struct gpio_desc *of_get_named_gpiod_flags(const struct device_node *np,
 					     &gpiospec);
 	if (ret) {
 		pr_debug("%s: can't parse '%s' property of node '%pOF[%d]'\n",
-			__func__, propname, np, index);
+			 __func__, propname, np, index);
 		return ERR_PTR(ret);
 	}
 
@@ -967,8 +968,8 @@ static int of_gpiochip_add_pin_range(struct gpio_chip *chip)
 		 * This is why we parse chip->of_gpio_n_cells + 1 cells
 		 */
 		ret = of_parse_phandle_with_fixed_args(np, "gpio-ranges",
-				chip->of_gpio_n_cells + 1,
-				index, &pinspec);
+						       chip->of_gpio_n_cells + 1,
+						       index, &pinspec);
 		if (ret)
 			break;
 
@@ -993,7 +994,7 @@ static int of_gpiochip_add_pin_range(struct gpio_chip *chip)
 		 * right instance.
 		 */
 		if (chip->of_node_instance_match &&
-		    (chip->of_gpio_n_cells == 3) &&
+		    chip->of_gpio_n_cells == 3 &&
 		    !chip->of_node_instance_match(chip, pinspec.args[0]))
 			continue;
 
@@ -1006,12 +1007,11 @@ static int of_gpiochip_add_pin_range(struct gpio_chip *chip)
 		if (count) {
 			/* npins != 0: linear range */
 			if (has_group_names) {
-				of_property_read_string_index(np,
-						group_names_propname,
-						index, &name);
+				of_property_read_string_index(np, group_names_propname,
+							      index, &name);
 				if (strlen(name)) {
 					pr_err("%pOF: Group name of numeric GPIO ranges must be the empty string.\n",
-						np);
+					       np);
 					break;
 				}
 			}
@@ -1028,41 +1028,35 @@ static int of_gpiochip_add_pin_range(struct gpio_chip *chip)
 			if ((offset + count) > chip->ngpio)
 				count = chip->ngpio - offset;
 
-			ret = gpiochip_add_pin_range(chip,
-					pinctrl_dev_get_devname(pctldev),
-					offset,
-					pin,
-					count);
+			ret = gpiochip_add_pin_range(chip, pinctrl_dev_get_devname(pctldev),
+						     offset, pin, count);
 			if (ret)
 				return ret;
 		} else {
 			/* npins == 0: special range */
 			if (pin) {
-				pr_err("%pOF: Illegal gpio-range format.\n",
-					np);
+				pr_err("%pOF: Illegal gpio-range format.\n", np);
 				break;
 			}
 
 			if (!has_group_names) {
 				pr_err("%pOF: GPIO group range requested but no %s property.\n",
-					np, group_names_propname);
+				       np, group_names_propname);
 				break;
 			}
 
-			ret = of_property_read_string_index(np,
-						group_names_propname,
-						index, &name);
+			ret = of_property_read_string_index(np, group_names_propname,
+							    index, &name);
 			if (ret)
 				break;
 
 			if (!strlen(name)) {
 				pr_err("%pOF: Group name of GPIO group range cannot be the empty string.\n",
-				np);
+				       np);
 				break;
 			}
 
-			ret = gpiochip_add_pingroup_range(chip, pctldev,
-						offset, name);
+			ret = gpiochip_add_pingroup_range(chip, pctldev, offset, name);
 			if (ret)
 				return ret;
 		}

-- 
2.56.0.257.gf7497c7d27-goog

